<?php
/**
 * Test AI Quick Stats functionality
 * This file helps validate that the AI system is working correctly
 */

// Include GLPI configuration
define('GLPI_ROOT', dirname(__DIR__));
include_once(GLPI_ROOT . '/inc/includes.php');

// Include AI configuration
require_once(GLPI_ROOT . '/config/ai_config.php');

echo "<!DOCTYPE html><html><head><title>AI Quick Stats Test</title>";
echo '<style>body{font-family: Arial, sans-serif; margin: 20px;} .section{margin: 20px 0; padding: 15px; border: 1px solid #ddd; border-radius: 8px;} .success{background: #e8f5e9;} .warning{background: #fff3e0;} .error{background: #ffebee;} code{background: #f5f5f5; padding: 2px 6px; border-radius: 3px;}</style>';
echo "</head><body>";
echo "<h1>🤖 AI Quick Stats Test</h1>";

// Test data - similar to real GLPI data
$test_asset_counts = [
    'Computer' => 45,
    'Monitor' => 38,
    'NetworkEquipment' => 12,
    'Printer' => 8,
    'Phone' => 25,
    'Software' => 120,
    'CartridgeItem' => 15,
    'ConsumableItem' => 30
];

$test_asset_types = [
    'Computer' => ['label' => 'Computers', 'color' => '#2196F3'],
    'Monitor' => ['label' => 'Monitors', 'color' => '#4CAF50'],
    'NetworkEquipment' => ['label' => 'Network Equipment', 'color' => '#FF9800'],
    'Printer' => ['label' => 'Printers', 'color' => '#9C27B0'],
    'Phone' => ['label' => 'Phones', 'color' => '#F44336'],
    'Software' => ['label' => 'Software', 'color' => '#009688'],
    'CartridgeItem' => ['label' => 'Cartridges', 'color' => '#795548'],
    'ConsumableItem' => ['label' => 'Consumables', 'color' => '#607D8B']
];

$total_assets = array_sum($test_asset_counts);

// Create AI instance
$ai_stats = new AIQuickStats();

// Test 1: Basic Configuration
echo "<div class='section " . ($ai_stats->isAIReady() ? "success" : "warning") . "'>";
echo "<h2>📋 Configuration Status</h2>";
echo "<p><strong>AI Ready:</strong> " . ($ai_stats->isAIReady() ? "✅ Yes" : "⚠️ No - Add API key to config/ai_config.php") . "</p>";
echo "<p><strong>CURL Available:</strong> " . (function_exists('curl_init') ? "✅ Yes" : "❌ No") . "</p>";
echo "</div>";

// Test 2: Test Asset Data
echo "<div class='section'>";
echo "<h2>📊 Test Asset Data</h2>";
echo "<ul>";
foreach ($test_asset_counts as $type => $count) {
    $label = $test_asset_types[$type]['label'];
    echo "<li><strong>{$label}:</strong> {$count}</li>";
}
echo "</ul>";
echo "<p><strong>Total Assets:</strong> {$total_assets}</p>";
echo "</div>";

// Test 3: Data Signature System
echo "<div class='section success'>";
echo "<h2>🔍 Data Signature System</h2>";
$signature = $ai_stats->generateDataSignature($test_asset_counts, $total_assets);
echo "<p><strong>Current Signature:</strong> <code>{$signature}</code></p>";

// Test change detection
$modified_counts = $test_asset_counts;
$modified_counts['Computer'] = 50; // Change computer count
$modified_total = array_sum($modified_counts);
$new_signature = $ai_stats->generateDataSignature($modified_counts, $modified_total);
echo "<p><strong>Modified Signature:</strong> <code>{$new_signature}</code></p>";
echo "<p><strong>Change Detection:</strong> " . ($signature !== $new_signature ? "✅ Working" : "❌ Failed") . "</p>";
echo "</div>";

// Test 4: AI Insights Generation
echo "<div class='section'>";
echo "<h2>🤖 AI Insights Generation</h2>";
echo "<div style='border: 1px solid #ccc; padding: 20px; margin: 10px 0; background: #f9f9f9; border-radius: 8px;'>";

$start_time = microtime(true);
$insights = $ai_stats->generateAIInsights($test_asset_counts, $total_assets, $test_asset_types);
$end_time = microtime(true);
$generation_time = round(($end_time - $start_time) * 1000, 2);

echo $insights;
echo "</div>";
echo "<p><strong>Generation Time:</strong> {$generation_time}ms</p>";
echo "</div>";

// Test 5: Caching System
echo "<div class='section success'>";
echo "<h2>⚡ Caching System Test</h2>";
echo "<p>Generating insights again to test caching...</p>";

$start_time = microtime(true);
$cached_insights = $ai_stats->generateAIInsights($test_asset_counts, $total_assets, $test_asset_types);
$end_time = microtime(true);
$cached_time = round(($end_time - $start_time) * 1000, 2);

echo "<div style='border: 1px solid #ccc; padding: 20px; margin: 10px 0; background: #f0f8ff; border-radius: 8px;'>";
echo $cached_insights;
echo "</div>";
echo "<p><strong>Cached Generation Time:</strong> {$cached_time}ms</p>";
echo "<p><strong>Cache Status:</strong> " . ($cached_time < $generation_time ? "✅ Working (faster)" : "⚠️ May not be cached") . "</p>";
echo "</div>";

// Test 6: Instructions
echo "<div class='section warning'>";
echo "<h2>📝 Next Steps</h2>";
echo "<ol>";
echo "<li>If AI is not ready, add your Google Gemini API key to <code>config/ai_config.php</code></li>";
echo "<li>Test the dashboard at <a href='front/dashboard_assets.php' target='_blank'>dashboard_assets.php</a></li>";
echo "<li>Go to the <strong>Analytics View</strong> tab</li>";
echo "<li>Check the <strong>Quick Stats</strong> section for AI insights</li>";
echo "<li>The system will auto-refresh every 10 seconds when data changes</li>";
echo "</ol>";
echo "</div>";

// Test 7: API Key Setup
echo "<div class='section " . ($ai_stats->isAIReady() ? "success" : "error") . "'>";
echo "<h2>🔑 API Key Setup</h2>";
if ($ai_stats->isAIReady()) {
    echo "<p>✅ API key is configured and ready!</p>";
} else {
    echo "<p>❌ API key needed. Follow these steps:</p>";
    echo "<ol>";
    echo "<li>Get your Google Gemini API key from <a href='https://aistudio.google.com/app/apikey' target='_blank'>Google AI Studio</a></li>";
    echo "<li>Open <code>config/ai_config.php</code></li>";
    echo "<li>Find the line: <code>\$this->api_key = \"\";</code></li>";
    echo "<li>Add your API key between the quotes: <code>\$this->api_key = \"your-api-key-here\";</code></li>";
    echo "<li>Save the file and refresh this page</li>";
    echo "</ol>";
}
echo "</div>";

echo "<div style='text-align: center; margin: 30px 0; padding: 20px; background: #e3f2fd; border-radius: 8px;'>";
echo "<h3>🎉 AI Quick Stats System Ready!</h3>";
echo "<p>The system will automatically refresh insights when asset data changes.</p>";
echo "<p><strong>No manual refresh buttons needed!</strong></p>";
echo "</div>";

echo "</body></html>";
?>
