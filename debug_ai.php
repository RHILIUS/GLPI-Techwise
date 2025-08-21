<?php
// Temporary debug script to see what AI is actually returning
session_start();

define('GLPI_ROOT', dirname(__DIR__));
include_once(GLPI_ROOT . '/inc/includes.php');
require_once(GLPI_ROOT . '/config/ai_config.php');

$ai_stats = new AIQuickStats();
$ai_stats->clearCache(); // Clear any cached data

// Test data
$test_data = [
    'total_assets' => 25,
    'asset_distribution' => [
        'Computers' => 10,
        'Monitors' => 8,
        'Printers' => 4,
        'Network Equipment' => 3
    ],
    'categories_with_assets' => 4,
    'total_categories' => 8
];

echo "<h2>AI Response Debug</h2>\n";
echo "<h3>Raw AI Response:</h3>\n";
echo "<pre style='background: #f5f5f5; padding: 10px; border: 1px solid #ddd;'>\n";

// Get the raw response from AI
if ($ai_stats->isAIReady()) {
    // Temporarily modify the class to return raw response
    $reflection = new ReflectionClass($ai_stats);
    $method = $reflection->getMethod('callGeminiAPI');
    $method->setAccessible(true);
    
    $promptMethod = $reflection->getMethod('createAnalysisPrompt');
    $promptMethod->setAccessible(true);
    
    $prompt = $promptMethod->invoke($ai_stats, $test_data);
    echo "PROMPT SENT:\n" . htmlspecialchars($prompt) . "\n\n";
    echo "RAW AI RESPONSE:\n";
    
    $raw_response = $method->invoke($ai_stats, $prompt);
    echo htmlspecialchars($raw_response);
    
} else {
    echo "AI not available - no API key configured";
}

echo "</pre>\n";
echo "<h3>Final Processed Response:</h3>\n";
echo "<div style='border: 1px solid #ddd; padding: 10px; background: white;'>\n";

$final_response = $ai_stats->generateInsights($test_data);
echo $final_response;

echo "</div>\n";
?>
