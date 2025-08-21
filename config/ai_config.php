<?php
/**
 * AI Configuration for GLPI Dashboard Quick Stats
 * Auto-refresh functionality based on data changes
 * 
 * Instructions: Add your Google Gemini API key to the $api_key variable below
 */

// Include GLPI configuration only if not already included
if (!defined('GLPI_ROOT')) {
    define('GLPI_ROOT', dirname(__DIR__));
}
if (!class_exists('Session')) {
    include_once(GLPI_ROOT . '/inc/includes.php');
}

class AIQuickStats {
    private $api_key;
    private $api_url;
    private $session_key;
    
    public function __construct() {
        // TODO: Add your Google Gemini API key here
        $this->api_key = "AIzaSyAKxzkINvMqefkzvsYkT9chFZmBQxj7Dxo"; // Add your API key here
        $this->api_url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent";
        $this->session_key = 'ai_quickstats_cache';
    }
    
    /**
     * Check if AI service is available
     */
    public function isAIReady() {
        return !empty($this->api_key) && function_exists('curl_init');
    }
    
    /**
     * Generate data signature for change detection
     */
    public function generateDataSignature($asset_counts, $total_assets) {
        $data_string = serialize($asset_counts) . $total_assets;
        return md5($data_string);
    }
    
    /**
     * Check if data has changed since last generation
     */
    public function hasDataChanged($current_signature) {
        $cached_data = $_SESSION[$this->session_key] ?? null;
        return !$cached_data || $cached_data['signature'] !== $current_signature;
    }
    
    /**
     * Clear AI insights cache
     */
    public function clearCache() {
        unset($_SESSION[$this->session_key]);
        unset($_SESSION['ai_maintenance_cache']); // Also clear maintenance cache
    }
    
    /**
     * Generate AI-powered maintenance recommendations
     */
    public function generateMaintenanceRecommendations($maintenance_stats, $low_stock_count) {
        try {
            $session_key = 'ai_maintenance_cache';
            
            // Generate signature for maintenance data
            $maintenance_signature = md5(serialize($maintenance_stats) . $low_stock_count);
            
            // Check cache
            $cached_data = $_SESSION[$session_key] ?? null;
            if ($cached_data && $cached_data['signature'] === $maintenance_signature && 
                time() - $cached_data['timestamp'] < 300) {
                return $cached_data['recommendations'];
            }
            
            // Create prompt for maintenance recommendations
            $prompt = $this->createMaintenancePrompt($maintenance_stats, $low_stock_count);
            
            // Call AI API
            $ai_response = $this->callGeminiAPI($prompt);
            
            if ($ai_response) {
                // Cache the result
                $_SESSION[$session_key] = [
                    'recommendations' => $ai_response,
                    'signature' => $maintenance_signature,
                    'timestamp' => time()
                ];
                return $ai_response;
            }
            
            return $this->getFallbackMaintenanceRecommendations($maintenance_stats, $low_stock_count);
            
        } catch (Exception $e) {
            return $this->getFallbackMaintenanceRecommendations($maintenance_stats, $low_stock_count);
        }
    }
    
    /**
     * Create maintenance recommendations prompt for AI
     */
    private function createMaintenancePrompt($stats, $low_stock_count) {
        $prompt = "Generate 5 maintenance recommendations for GLPI assets. Return ONLY HTML divs - no markdown.\n\n";
        $prompt .= "Issues found:\n";
        $prompt .= "- Old computers: " . $stats['old_computers'] . "\n";
        $prompt .= "- Expired warranties: " . $stats['expired_warranty'] . "\n";
        $prompt .= "- Outdated OS: " . $stats['outdated_os'] . "\n";
        $prompt .= "- Missing data: " . ($stats['no_purchase_date'] + $stats['no_manufacturer']) . "\n";
        $prompt .= "- Low stock: " . $low_stock_count . "\n\n";
        
        $prompt .= "Create 5 clickable recommendations, each under 25 words.\n";
        $prompt .= "Use priority: 🔴 (critical), 🟡 (medium), 🟢 (low)\n\n";
        
        $prompt .= "Format each exactly like this with onclick handler:\n";
        $prompt .= "<div onclick='showAssetDetails(\"category_type\")' style='background: #f8f9fa; border-left: 4px solid #dc3545; padding: 15px; margin-bottom: 12px; border-radius: 0 8px 8px 0; cursor: pointer; transition: background 0.2s;' onmouseover='this.style.background=\"#e9ecef\"' onmouseout='this.style.background=\"#f8f9fa\"'><div style='font-weight: 600; color: #333; margin-bottom: 5px; display: flex; align-items: center;'><span style='margin-right: 8px;'>🔴</span>Title Here</div><div style='color: #555; font-size: 0.95rem;'>Recommendation text with numbers. <span style='color: #007bff; font-size: 0.85rem;'>Click to view details →</span></div></div>\n\n";
        
        $prompt .= "Use these category types for onclick: old_computers, expired_warranties, outdated_os, missing_data, low_stock\n";
        $prompt .= "START with <div immediately.";
        
        return $prompt;
    }
    
    /**
     * Fallback maintenance recommendations
     */
    private function getFallbackMaintenanceRecommendations($stats, $low_stock_count) {
        $recommendations = '';
        
        if ($stats['old_computers'] > 0) {
            $recommendations .= '<div onclick="showAssetDetails(\'old_computers\')" style="background: #f8f9fa; border-left: 4px solid #dc3545; padding: 15px; margin-bottom: 12px; border-radius: 0 8px 8px 0; cursor: pointer; transition: background 0.2s;" onmouseover="this.style.background=\'#e9ecef\'" onmouseout="this.style.background=\'#f8f9fa\'">';
            $recommendations .= '<div style="font-weight: 600; color: #333; margin-bottom: 5px; display: flex; align-items: center;">';
            $recommendations .= '<span style="margin-right: 8px;">🔴</span>Legacy Equipment Alert</div>';
            $recommendations .= '<div style="color: #555; font-size: 0.95rem;">Replace ' . $stats['old_computers'] . ' aging computers to maintain performance and security standards. <span style="color: #007bff; font-size: 0.85rem;">Click to view details →</span></div>';
            $recommendations .= '</div>';
        }
        
        if ($stats['expired_warranty'] > 0) {
            $recommendations .= '<div onclick="showAssetDetails(\'expired_warranties\')" style="background: #f8f9fa; border-left: 4px solid #ffc107; padding: 15px; margin-bottom: 12px; border-radius: 0 8px 8px 0; cursor: pointer; transition: background 0.2s;" onmouseover="this.style.background=\'#e9ecef\'" onmouseout="this.style.background=\'#f8f9fa\'">';
            $recommendations .= '<div style="font-weight: 600; color: #333; margin-bottom: 5px; display: flex; align-items: center;">';
            $recommendations .= '<span style="margin-right: 8px;">🟡</span>Warranty Management</div>';
            $recommendations .= '<div style="color: #555; font-size: 0.95rem;">Review and renew warranties for ' . $stats['expired_warranty'] . ' assets to ensure coverage. <span style="color: #007bff; font-size: 0.85rem;">Click to view details →</span></div>';
            $recommendations .= '</div>';
        }
        
        if ($stats['outdated_os'] > 0) {
            $recommendations .= '<div onclick="showAssetDetails(\'outdated_os\')" style="background: #f8f9fa; border-left: 4px solid #dc3545; padding: 15px; margin-bottom: 12px; border-radius: 0 8px 8px 0; cursor: pointer; transition: background 0.2s;" onmouseover="this.style.background=\'#e9ecef\'" onmouseout="this.style.background=\'#f8f9fa\'">';
            $recommendations .= '<div style="font-weight: 600; color: #333; margin-bottom: 5px; display: flex; align-items: center;">';
            $recommendations .= '<span style="margin-right: 8px;">🔴</span>Security Risk</div>';
            $recommendations .= '<div style="color: #555; font-size: 0.95rem;">Upgrade ' . $stats['outdated_os'] . ' systems from Windows 7/XP for security compliance. <span style="color: #007bff; font-size: 0.85rem;">Click to view details →</span></div>';
            $recommendations .= '</div>';
        }
        
        if ($low_stock_count > 0) {
            $recommendations .= '<div onclick="showAssetDetails(\'low_stock\')" style="background: #f8f9fa; border-left: 4px solid #28a745; padding: 15px; margin-bottom: 12px; border-radius: 0 8px 8px 0; cursor: pointer; transition: background 0.2s;" onmouseover="this.style.background=\'#e9ecef\'" onmouseout="this.style.background=\'#f8f9fa\'">';
            $recommendations .= '<div style="font-weight: 600; color: #333; margin-bottom: 5px; display: flex; align-items: center;">';
            $recommendations .= '<span style="margin-right: 8px;">🟢</span>Inventory Action</div>';
            $recommendations .= '<div style="color: #555; font-size: 0.95rem;">Restock ' . $low_stock_count . ' items to prevent operational disruptions. <span style="color: #007bff; font-size: 0.85rem;">Click to view details →</span></div>';
            $recommendations .= '</div>';
        }
        
        if (($stats['no_purchase_date'] + $stats['no_manufacturer']) > 0) {
            $total_missing = $stats['no_purchase_date'] + $stats['no_manufacturer'];
            $recommendations .= '<div onclick="showAssetDetails(\'missing_data\')" style="background: #f8f9fa; border-left: 4px solid #ffc107; padding: 15px; margin-bottom: 12px; border-radius: 0 8px 8px 0; cursor: pointer; transition: background 0.2s;" onmouseover="this.style.background=\'#e9ecef\'" onmouseout="this.style.background=\'#f8f9fa\'">';
            $recommendations .= '<div style="font-weight: 600; color: #333; margin-bottom: 5px; display: flex; align-items: center;">';
            $recommendations .= '<span style="margin-right: 8px;">🟡</span>Data Completion</div>';
            $recommendations .= '<div style="color: #555; font-size: 0.95rem;">Complete missing information for ' . $total_missing . ' assets to improve tracking accuracy. <span style="color: #007bff; font-size: 0.85rem;">Click to view details →</span></div>';
            $recommendations .= '</div>';
        }
        
        if (empty($recommendations)) {
            $recommendations = '<div style="background: #d4edda; border-left: 4px solid #28a745; padding: 20px; margin-bottom: 12px; border-radius: 0 8px 8px 0; text-align: center;">';
            $recommendations .= '<div style="font-weight: 600; color: #155724; margin-bottom: 5px; display: flex; align-items: center; justify-content: center;">';
            $recommendations .= '<span style="margin-right: 8px;">✅</span>All Systems Optimal</div>';
            $recommendations .= '<div style="color: #155724; font-size: 0.95rem;">No critical maintenance issues detected. Continue regular monitoring.</div>';
            $recommendations .= '</div>';
        }
        
        return $recommendations;
    }
    
    /**
     * Generate AI insights for Quick Stats
     */
    public function generateAIInsights($asset_counts, $total_assets, $asset_types) {
        try {
            // Generate current data signature
            $current_signature = $this->generateDataSignature($asset_counts, $total_assets);
            
            // Check if we need to regenerate (data changed or no cache)
            if (!$this->hasDataChanged($current_signature)) {
                $cached_data = $_SESSION[$this->session_key];
                // Check if cache is still fresh (less than 5 minutes old)
                if (time() - $cached_data['timestamp'] < 300) {
                    return $cached_data['insights'];
                }
            }
            
            // Prepare data for AI analysis
            $analysis_data = [
                'total_assets' => $total_assets,
                'asset_distribution' => [],
                'categories_with_assets' => count(array_filter($asset_counts)),
                'total_categories' => count($asset_types)
            ];
            
            foreach ($asset_counts as $class => $count) {
                if ($count > 0) {
                    $label = $asset_types[$class]['label'] ?? $class;
                    $analysis_data['asset_distribution'][$label] = $count;
                }
            }
            
            // Create prompt for AI
            $prompt = $this->createAnalysisPrompt($analysis_data);
            
            // Call AI API
            $ai_response = $this->callGeminiAPI($prompt);
            
            if ($ai_response) {
                // Cache the result with signature
                $_SESSION[$this->session_key] = [
                    'insights' => $ai_response,
                    'signature' => $current_signature,
                    'timestamp' => time()
                ];
                return $ai_response;
            }
            
            return $this->getFallbackInsights($analysis_data);
            
        } catch (Exception $e) {
            return $this->getFallbackInsights($analysis_data ?? []);
        }
    }
    
    /**
     * Create analysis prompt for AI
     */
    private function createAnalysisPrompt($data) {
        $prompt = "You are generating HTML content for a dashboard. Respond with ONLY the HTML div elements - no explanations, no markdown, no code blocks.\n\n";
        $prompt .= "Data to analyze:\n";
        $prompt .= "Total Assets: " . $data['total_assets'] . "\n";
        $prompt .= "Asset Distribution:\n";
        
        foreach ($data['asset_distribution'] as $type => $count) {
            $prompt .= "- {$type}: {$count}\n";
        }
        
        $prompt .= "\nCategories in use: {$data['categories_with_assets']} out of {$data['total_categories']}\n\n";
        $prompt .= "CRITICAL: Your response must start immediately with the first <div> tag.\n";
        $prompt .= "CRITICAL: Do NOT use ```html or any markdown formatting.\n";
        $prompt .= "CRITICAL: Do NOT include explanations or extra text.\n\n";
        $prompt .= "Generate exactly 3 insights using this exact format:\n\n";
        $prompt .= "<div style='margin-bottom: 10px; padding: 10px 14px; background: linear-gradient(135deg, #e8f5e8 0%, #f0f9f0 100%); border: 1px solid #c8e6c9; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);'>";
        $prompt .= "<div style='font-size: 0.95rem; font-weight: 600; color: #2e7d32; margin-bottom: 3px; display: flex; align-items: center;'>";
        $prompt .= "<span style='margin-right: 6px;'>📊</span>Short Title</div>";
        $prompt .= "<div style='color: #424242; font-size: 0.85rem; line-height: 1.3;'>Brief insight under 20 words.</div>";
        $prompt .= "</div>\n\n";
        $prompt .= "Use different icons for each insight: 📊 📈 🎯\n";
        $prompt .= "Each insight should be under 20 words and include specific numbers.\n";
        $prompt .= "START YOUR RESPONSE WITH: <div style=";
        
        return $prompt;
    }
    
    /**
     * Call Gemini AI API
     */
    private function callGeminiAPI($prompt) {
        if (empty($this->api_key)) {
            return null;
        }
        
        $data = [
            'contents' => [
                [
                    'parts' => [
                        ['text' => $prompt]
                    ]
                ]
            ],
            'generationConfig' => [
                'temperature' => 0.7,
                'topK' => 40,
                'topP' => 0.95,
                'maxOutputTokens' => 1500
            ]
        ];
        
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->api_url . '?key=' . $this->api_key);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Content-Type: application/json',
        ]);
        curl_setopt($ch, CURLOPT_TIMEOUT, 10);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        
        $response = curl_exec($ch);
        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);
        
        if ($http_code === 200 && $response) {
            $decoded = json_decode($response, true);
            if (isset($decoded['candidates'][0]['content']['parts'][0]['text'])) {
                $ai_text = $decoded['candidates'][0]['content']['parts'][0]['text'];
                
                // Ultra-aggressive cleaning of any markdown artifacts
                $ai_text = $this->cleanAIResponse($ai_text);
                
                return $ai_text;
            }
        }
        
        return null;
    }
    
    /**
     * Aggressively clean AI response of any markdown artifacts
     */
    private function cleanAIResponse($text) {
        // First, find the position of the first <div tag
        $divPosition = strpos($text, '<div');
        
        // If we found a <div, cut everything before it
        if ($divPosition !== false) {
            $text = substr($text, $divPosition);
        }
        
        // Additional cleaning just in case
        $text = preg_replace('/```[a-zA-Z]*\s*/', '', $text);  // Remove ```html, ```css, etc
        $text = preg_replace('/```\s*/', '', $text);          // Remove closing ```
        $text = str_replace('```', '', $text);                // Remove any remaining backticks
        
        // Clean up any remaining artifacts
        $text = preg_replace('/^\s*html\s*$/m', '', $text);
        $text = trim($text);
        
        return $text;
    }
    
    /**
     * Provide fallback insights when AI is not available
     */
    private function getFallbackInsights($data) {
        if (empty($this->api_key)) {
            return '<div style="margin-bottom: 10px; padding: 10px 14px; background: linear-gradient(135deg, #e3f2fd 0%, #f0f8ff 100%); border: 1px solid #90caf9; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">' .
                   '<div style="font-size: 0.95rem; font-weight: 600; color: #1565c0; margin-bottom: 3px; display: flex; align-items: center;"><span style="margin-right: 6px;">�</span>AI Setup Required</div>' .
                   '<div style="color: #424242; font-size: 0.85rem; line-height: 1.3;">Add API key to enable AI insights.</div>' .
                   '</div>';
        }
        
        $insights = '<div style="margin-bottom: 10px; padding: 10px 14px; background: linear-gradient(135deg, #e8f5e8 0%, #f0f9f0 100%); border: 1px solid #c8e6c9; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">';
        $insights .= '<div style="font-size: 0.95rem; font-weight: 600; color: #2e7d32; margin-bottom: 3px; display: flex; align-items: center;"><span style="margin-right: 6px;">📊</span>Total Assets</div>';
        $insights .= '<div style="color: #424242; font-size: 0.85rem; line-height: 1.3;">' . ($data['total_assets'] ?? 0) . ' assets across ' . ($data['categories_with_assets'] ?? 0) . ' categories.</div>';
        $insights .= '</div>';
        
        if (!empty($data['asset_distribution'])) {
            $most_common = array_keys($data['asset_distribution'], max($data['asset_distribution']))[0];
            $most_common_count = max($data['asset_distribution']);
            $percentage = $data['total_assets'] > 0 ? round(($most_common_count / $data['total_assets']) * 100, 1) : 0;
            
            $insights .= '<div style="margin-bottom: 10px; padding: 10px 14px; background: linear-gradient(135deg, #f3e5f5 0%, #fce4ec 100%); border: 1px solid #f48fb1; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">';
            $insights .= '<div style="font-size: 0.95rem; font-weight: 600; color: #ad1457; margin-bottom: 3px; display: flex; align-items: center;"><span style="margin-right: 6px;">📈</span>Top Category</div>';
            $insights .= '<div style="color: #424242; font-size: 0.85rem; line-height: 1.3;">' . $most_common . ' leads with ' . $percentage . '% share.</div>';
            $insights .= '</div>';
            
            // Only show one more insight for balance
            $utilization = $data['total_categories'] > 0 ? round(($data['categories_with_assets'] / $data['total_categories']) * 100, 1) : 0;
            $insights .= '<div style="margin-bottom: 10px; padding: 10px 14px; background: linear-gradient(135deg, #e1f5fe 0%, #f0f9ff 100%); border: 1px solid #81d4fa; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">';
            $insights .= '<div style="font-size: 0.95rem; font-weight: 600; color: #0277bd; margin-bottom: 3px; display: flex; align-items: center;"><span style="margin-right: 6px;">🎯</span>Usage Rate</div>';
            $insights .= '<div style="color: #424242; font-size: 0.85rem; line-height: 1.3;">' . $utilization . '% of available categories in use.</div>';
            $insights .= '</div>';
        }
        
        return $insights;
    }
}
?>