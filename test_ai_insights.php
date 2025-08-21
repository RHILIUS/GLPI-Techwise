<?php
// Quick test for AI insights functionality
require_once 'config/ai_config.php';

// Test data
$test_data = [
    'total_assets' => 150,
    'categories_with_assets' => 8,
    'total_categories' => 12,
    'asset_distribution' => [
        'Computers' => 45,
        'Network Equipment' => 30,
        'Monitors' => 25,
        'Printers' => 20,
        'Mobile Devices' => 15,
        'Servers' => 10,
        'Storage' => 3,
        'Other' => 2
    ],
    'recent_changes' => [
        'new_assets' => 5,
        'updated_assets' => 12,
        'retired_assets' => 2
    ],
    'status_breakdown' => [
        'Active' => 120,
        'In Maintenance' => 15,
        'Retired' => 10,
        'Reserved' => 5
    ]
];

$ai_stats = new AIQuickStats();
echo "Testing AI Quick Stats...\n\n";

$insights = $ai_stats->generateInsights($test_data);
echo "Generated Insights:\n";
echo strip_tags($insights) . "\n\n";

echo "Raw HTML Output:\n";
echo $insights . "\n";
?>
