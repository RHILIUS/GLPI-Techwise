<?php

/**
 * ---------------------------------------------------------------------
 *
 * GLPI - Gestionnaire Libre de Parc Informatique
 *
 * http://glpi-project.org
 *
 * @copyright 2015-2025 Teclib' and contributors.
 * @copyright 2003-2014 by the INDEPNET Development Team.
 * @licence   https://www.gnu.org/licenses/gpl-3.0.html
 *
 * ---------------------------// Cri// Cri// Cri// Critical Issues Details
echo '<div style="flex: 1; min-width: 400px; background: white; padding: 30px; border-radius: 15px; box-shadow: 0 6px 25px rgba(0,0,0,0.1);">';
echo '<h3 style="margin: 0 0 25px 0; color: #ff6b6b; font-size: 1.4rem; display: flex; align-items: center;"><span style="margin-right: 10px;">🚨</span>Critical Issues</h3>';al Issues Deta// Warning Issues Details
ech// Recommendations Section
echo '<div style="background: white; padding: 30px; border-radius: 15px; box-shadow: 0 6px 25px rgba(0,0,0,0.1);">';
echo '<h3 style="margin: 0 0 25px 0; color: #4caf50; font-size: 1.4rem; display: flex; align-items: center;"><span style="margin-right: 10px;">💡</span>Recommendations</h3>';<div style="flex: 1; min-width: 400px; background: white; padding: 30px; border-radius: 15px; box-shadow: 0 6px 25px rgba(0,0,0,0.1);">';
echo '<h3 style="margin: 0 0 25px 0; color: #ffa726; font-size: 1.4rem; display: flex; align-items: center;"><span style="margin-right: 10px;">⚠️</span>Warning Issues</h3>';
echo '<div style="flex: 1; min-width: 400px; background: white; padding: 30px; border-radius: 15px; box-shadow: 0 6px 25px rgba(0,0,0,0.1);">';
echo '<h3 style="margin: 0 0 25px 0; color: #ff6b6b; font-size: 1.4rem; display: flex; align-items: center;"><span style="margin-right: 10px;">🚨</span>Critical Issues</h3>';al Issues Deta// Warning Issues Details
ech// Recommendations Section
echo '<div style="background: white; padding: 30px; border-radius: 15px; box-shadow: 0 6px 25px rgba(0,0,0,0.1);">';
echo '<h3 style="margin: 0 0 25px 0; color: #4caf50; font-size: 1.4rem; display: flex; align-items: center;"><span style="margin-right: 10px;">💡</span>Recommendations</h3>';<div style="flex: 1; min-width: 400px; background: white; padding: 30px; border-radius: 15px; box-shadow: 0 6px 25px rgba(0,0,0,0.1);">';
echo '<h3 style="margin: 0 0 25px 0; color: #ffa726; font-size: 1.4rem; display: flex; align-items: center;"><span style="margin-right: 10px;">⚠️</span>Warning Issues</h3>';
echo '<div style="flex: 1; min-width: 400px; background: white; padding: 30px; border-radius: 15px; box-shadow: 0 6px 25px rgba(0,0,0,0.1);">';
echo '<h3 style="margin: 0 0 25px 0; color: #ff6b6b; font-size: 1.4rem; display: flex; align-items: center;"><span style="margin-right: 10px;">🚨</span>Critical Issues</h3>';al Issues Deta// Warning Issues Details
ech// Recommendations Section
echo '<div style="background: white; padding: 30px; border-radius: 15px; box-shadow: 0 6px 25px rgba(0,0,0,0.1);">';
echo '<h3 style="margin: 0 0 25px 0; color: #4caf50; font-size: 1.4rem; display: flex; align-items: center;"><span style="margin-right: 10px;">💡</span>Recommendations</h3>';<div style="flex: 1; min-width: 400px; background: white; padding: 30px; border-radius: 15px; box-shadow: 0 6px 25px rgba(0,0,0,0.1);">';
echo '<h3 style="margin: 0 0 25px 0; color: #ffa726; font-size: 1.4rem; display: flex; align-items: center;"><span style="margin-right: 10px;">⚠️</span>Warning Issues</h3>';
echo '<div style="flex: 1; min-width: 400px; background: white; padding: 30px; border-radius: 15px; box-shadow: 0 6px 25px rgba(0,0,0,0.1);">';
echo '<h3 style="margin: 0 0 25px 0; color: #ff6b6b; font-size: 1.4rem; display: flex; align-items: center;"><span style="margin-right: 10px;">🚨</span>Critical Issues</h3>';---------------------------------------
 *
 * LICENSE
 *
 * This file is part of GLPI.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 * ---------------------------------------------------------------------
 */

use Glpi\Dashboard\Dashboard;

/** @var array $CFG_GLPI */
global $CFG_GLPI;

include('../inc/includes.php');

Session::checkCentralAccess();

// Handle AJAX request for AI Quick Stats refresh
if (isset($_POST['refresh_ai']) && isset($_SERVER['HTTP_X_REQUESTED_WITH']) && $_SERVER['HTTP_X_REQUESTED_WITH'] === 'XMLHttpRequest') {
    // Load AI configuration
    require_once(GLPI_ROOT . '/config/ai_config.php');
    
    // Get updated asset data
    global $DB;
    $asset_types = [
        'Computer' => ['label' => 'Computers', 'color' => '#2196F3'],
        'Monitor' => ['label' => 'Monitors', 'color' => '#4CAF50'],
        'NetworkEquipment' => ['label' => 'Network Equipment', 'color' => '#FF9800'],
        'Printer' => ['label' => 'Printers', 'color' => '#9C27B0'],
        'Phone' => ['label' => 'Phones', 'color' => '#F44336'],
        'Software' => ['label' => 'Software', 'color' => '#009688'],
        'CartridgeItem' => ['label' => 'Cartridges', 'color' => '#795548'],
        'ConsumableItem' => ['label' => 'Consumables', 'color' => '#607D8B']
    ];
    
    $asset_counts = [];
    $total_assets = 0;
    
    foreach ($asset_types as $class => $info) {
        $table = 'glpi_' . strtolower($class) . 's';
        if ($class === 'NetworkEquipment') $table = 'glpi_networkequipments';
        if ($class === 'CartridgeItem') $table = 'glpi_cartridgeitems';
        if ($class === 'ConsumableItem') $table = 'glpi_consumableitems';
        
        $query = "SELECT COUNT(*) as count FROM `$table` WHERE `is_deleted` = 0";
        $result = $DB->query($query);
        $count = ($result && $row = $DB->fetchAssoc($result)) ? (int)$row['count'] : 0;
        
        $asset_counts[$class] = $count;
        $total_assets += $count;
    }
    
    // Generate AI insights
    $ai_stats = new AIQuickStats();
    
    // Clear cache to ensure fresh generation with updated cleaning
    $ai_stats->clearCache();
    
    if ($ai_stats->isAIReady()) {
        $ai_insights = $ai_stats->generateAIInsights($asset_counts, $total_assets, $asset_types);
        echo $ai_insights;
    } else {
        $ai_insights = $ai_stats->getFallbackInsights(['total_assets' => $total_assets, 'asset_distribution' => []]);
        echo $ai_insights;
    }
    exit();
}

// Handle AJAX request for Maintenance AI Recommendations refresh
if (isset($_POST['refresh_maintenance_ai']) && isset($_SERVER['HTTP_X_REQUESTED_WITH']) && $_SERVER['HTTP_X_REQUESTED_WITH'] === 'XMLHttpRequest') {
    // Ensure proper session and auth
    Session::checkCentralAccess();
    
    // Simple approach - just return cached or fallback recommendations
    require_once(GLPI_ROOT . '/config/ai_config.php');
    $ai_maintenance = new AIQuickStats();
    
    // Create minimal maintenance stats for demo
    $maintenance_stats = [
        'old_computers' => 2,
        'no_purchase_date' => 1,
        'no_manufacturer' => 1,
        'expired_warranty' => 1,
        'outdated_os' => 0,
        'low_stock_consumables' => 1,
        'low_stock_cartridges' => 1
    ];
    $low_stock_count = 2;
    
    $ai_recommendations = $ai_maintenance->generateMaintenanceRecommendations($maintenance_stats, $low_stock_count);
    echo $ai_recommendations;
    exit();
}



$default = Glpi\Dashboard\Grid::getDefaultDashboardForMenu('assets');

// Redirect to "/front/computer.php" if no dashboard found
if ($default == "") {
    Html::redirect($CFG_GLPI["root_doc"] . "/front/computer.php");
}

$dashboard = new Dashboard($default);
if (!$dashboard->canViewCurrent()) {
    Html::displayRightError();
    exit();
}

Html::header(__('Assets Dashboard'), $_SERVER['PHP_SELF'], "assets", "dashboard");

// Get real asset counts from database
global $DB;
$asset_counts = [];
$total_assets = 0;

// Use GLPI's actual table names instead of raw class names
$asset_types = [
    'glpi_computers'         => ['label' => 'Computers', 'color' => '#FF6B6B'],
    'glpi_monitors'          => ['label' => 'Monitors', 'color' => '#4ECDC4'],
    'glpi_printers'          => ['label' => 'Printers', 'color' => '#45B7D1'],
    'glpi_networkequipments' => ['label' => 'Network devices', 'color' => '#96CEB4'],
    'glpi_phones'            => ['label' => 'Phones', 'color' => '#FFEAA7'],
    'glpi_softwares'         => ['label' => 'Software', 'color' => '#DDA0DD'],
    'glpi_softwarelicenses'  => ['label' => 'Licenses', 'color' => '#98D8C8']
];

foreach ($asset_types as $table => $info) {
    $query = "SELECT COUNT(*) as count FROM `$table` WHERE is_deleted = 0";
    $result = $DB->query($query);
    if ($result && $row = $DB->fetchAssoc($result)) {
        $asset_counts[$table] = intval($row['count']);
        $total_assets += $asset_counts[$table];
    } else {
        $asset_counts[$table] = 0;
    }
}

// Build chart gradient
$segments = [];
$current_angle = 0;
foreach ($asset_types as $table => $info) {
    $count = $asset_counts[$table];
    if ($count > 0 && $total_assets > 0) {
        $percentage = ($count / $total_assets) * 100;
        $angle = ($percentage / 100) * 360;
        $end_angle = $current_angle + $angle;

        $segments[] = $info['color'] . ' ' . $current_angle . 'deg ' . $end_angle . 'deg';
        $current_angle = $end_angle;
    }
}
$gradient = empty($segments) ? '#ddd 0deg 360deg' : implode(', ', $segments);

// Collect detailed data for card modals
$card_details = [];

// Total Assets Details
$card_details['total_assets'] = [];
foreach ($asset_types as $table => $info) {
    if ($asset_counts[$table] > 0) {
        // Handle different column names for different tables
        if ($table == 'glpi_softwares') {
            $query = "SELECT id, name, comment as serial, date_creation FROM `$table` WHERE is_deleted = 0 ORDER BY name LIMIT 50";
        } elseif ($table == 'glpi_softwarelicenses') {
            $query = "SELECT id, name, number as serial, date_creation FROM `$table` WHERE is_deleted = 0 ORDER BY name LIMIT 50";
        } else {
            $query = "SELECT id, name, serial, date_creation FROM `$table` WHERE is_deleted = 0 ORDER BY name LIMIT 50";
        }
        $result = $DB->query($query);
        $items = [];
        if ($result) {
            while ($row = $DB->fetchAssoc($result)) {
                $items[] = $row;
            }
        }
        $card_details['total_assets'][$info['label']] = [
            'count' => $asset_counts[$table],
            'color' => $info['color'],
            'items' => $items
        ];
    }
}

// Active Hardware Details (Computers, Monitors, Printers)
$card_details['active_hardware'] = [];
$hardware_types = ['glpi_computers', 'glpi_monitors', 'glpi_printers'];
foreach ($hardware_types as $table) {
    if (isset($asset_counts[$table]) && $asset_counts[$table] > 0) {
        $query = "SELECT id, name, serial, date_creation FROM `$table` WHERE is_deleted = 0 ORDER BY name LIMIT 50";
        $result = $DB->query($query);
        $items = [];
        if ($result) {
            while ($row = $DB->fetchAssoc($result)) {
                $items[] = $row;
            }
        }
        $card_details['active_hardware'][$asset_types[$table]['label']] = [
            'count' => $asset_counts[$table],
            'color' => $asset_types[$table]['color'],
            'items' => $items
        ];
    }
}

// Software & Licenses Details
$card_details['software_licenses'] = [];
$software_types = ['glpi_softwares', 'glpi_softwarelicenses'];
foreach ($software_types as $table) {
    if (isset($asset_counts[$table]) && $asset_counts[$table] > 0) {
        if ($table == 'glpi_softwares') {
            $query = "SELECT id, name, comment as serial, date_creation FROM `$table` WHERE is_deleted = 0 ORDER BY name LIMIT 50";
        } else {
            $query = "SELECT id, name, number as serial, date_creation FROM `$table` WHERE is_deleted = 0 ORDER BY name LIMIT 50";
        }
        $result = $DB->query($query);
        $items = [];
        if ($result) {
            while ($row = $DB->fetchAssoc($result)) {
                $items[] = $row;
            }
        }
        $card_details['software_licenses'][$asset_types[$table]['label']] = [
            'count' => $asset_counts[$table],
            'color' => $asset_types[$table]['color'],
            'items' => $items
        ];
    }
}

// Add tabbed interface CSS and JavaScript
echo '<style>
.dashboard-tabs {
    display: flex;
    background: #f8f9fa;
    border-bottom: 2px solid #dee2e6;
    margin-bottom: 20px;
}
.tab-button {
    background: none;
    border: none;
    padding: 15px 25px;
    cursor: pointer;
    font-size: 16px;
    font-weight: 500;
    color: #666;
    border-bottom: 3px solid transparent;
    transition: all 0.3s ease;
}
.tab-button:hover {
    background: #e9ecef;
    color: #333;
}
.tab-button.active {
    color: #007cba;
    border-bottom-color: #007cba;
    background: white;
}
.tab-content {
    display: none;
}
.tab-content.active {
    display: block;
}
.dashboard {
    max-height: 800px !important;
    overflow-y: auto;
}
.grid-stack {
    max-height: 700px !important;
    overflow-y: auto;
}
.grid-stack-item {
    min-height: 120px !important;
}
.grid-stack-item .card {
    min-height: 100px !important;
}
</style>';

// Create tabbed interface
echo '<div class="dashboard-tabs">';
echo '<button class="tab-button active" onclick="switchTab(\'original\', this)">Standard View</button>';
echo '<button class="tab-button" onclick="switchTab(\'enhanced\', this)">Analytics View</button>';
echo '<button class="tab-button" onclick="switchTab(\'maintenance\', this)">Maintenance View</button>';
echo '</div>';

// Tab 1: Original Dashboard
echo '<div id="original-tab" class="tab-content active">';
$grid = new Glpi\Dashboard\Grid(dashboard_key: $default);
$grid->showDefault();
echo '</div>';

// Tab 2: Enhanced Dashboard
echo '<div id="enhanced-tab" class="tab-content">';

// Add comprehensive dashboard enhancements below the main grid
echo '<div style="max-width: 1200px; margin: 40px auto; padding: 20px;">';

// Row 1: Summary Cards
echo '<div style="display: flex; gap: 20px; margin-bottom: 30px; flex-wrap: wrap;">';
echo '<div style="flex: 1; min-width: 250px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 20px; border-radius: 12px; text-align: center; cursor: pointer; transition: all 0.3s ease; position: relative;" onclick="showCardDetails(\'total_assets\')" onmouseover="this.style.transform=\'translateY(-5px)\'; this.style.boxShadow=\'0 8px 25px rgba(102, 126, 234, 0.4)\'" onmouseout="this.style.transform=\'translateY(0)\'; this.style.boxShadow=\'none\'">';
echo '<h3 style="margin: 0 0 10px 0; font-size: 1.1rem;">Total Assets</h3>';

echo '<div style="font-size: 2.5rem; font-weight: bold;">' . $total_assets . '</div>';
echo '<div style="position: absolute; bottom: 10px; left: 50%; transform: translateX(-50%); font-size: 0.8rem; opacity: 0.8;">Click to view details</div>';
echo '</div>';

$active_assets = array_sum(array_slice($asset_counts, 0, 3)); // Computers + Monitors + Printers
echo '<div style="flex: 1; min-width: 250px; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); color: white; padding: 20px; border-radius: 12px; text-align: center; cursor: pointer; transition: all 0.3s ease; position: relative;" onclick="showCardDetails(\'active_hardware\')" onmouseover="this.style.transform=\'translateY(-5px)\'; this.style.boxShadow=\'0 8px 25px rgba(240, 147, 251, 0.4)\'" onmouseout="this.style.transform=\'translateY(0)\'; this.style.boxShadow=\'none\'">';
echo '<h3 style="margin: 0 0 10px 0; font-size: 1.1rem;">Active Hardware</h3>';
echo '<div style="font-size: 2.5rem; font-weight: bold;">' . $active_assets . '</div>';
echo '<div style="position: absolute; bottom: 10px; left: 50%; transform: translateX(-50%); font-size: 0.8rem; opacity: 0.8;">Click to view details</div>';
echo '</div>';

$software_count = ($asset_counts['glpi_softwares'] ?? 0) + ($asset_counts['glpi_softwarelicenses'] ?? 0);
echo '<div style="flex: 1; min-width: 250px; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); color: white; padding: 20px; border-radius: 12px; text-align: center; cursor: pointer; transition: all 0.3s ease; position: relative;" onclick="showCardDetails(\'software_licenses\')" onmouseover="this.style.transform=\'translateY(-5px)\'; this.style.boxShadow=\'0 8px 25px rgba(79, 172, 254, 0.4)\'" onmouseout="this.style.transform=\'translateY(0)\'; this.style.boxShadow=\'none\'">';
echo '<h3 style="margin: 0 0 10px 0; font-size: 1.1rem;">Software & Licenses</h3>';
echo '<div style="font-size: 2.5rem; font-weight: bold;">' . $software_count . '</div>';
echo '<div style="position: absolute; bottom: 10px; left: 50%; transform: translateX(-50%); font-size: 0.8rem; opacity: 0.8;">Click to view details</div>';
echo '</div>';
echo '</div>';

// Row 2: Charts Section
echo '<div style="display: flex; gap: 30px; margin-bottom: 30px; flex-wrap: wrap;">';

// Pie Chart
echo '<div style="flex: 1; min-width: 300px; background: white; padding: 25px; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">';
echo '<h3 style="margin: 0 0 20px 0; color: #333; font-size: 1.3rem; text-align: center;"> Asset Distribution</h3>';
echo '<div style="display: flex; align-items: center; gap: 25px;">';

if ($total_assets > 0) {
    echo '<div style="width: 180px; height: 180px; border-radius: 50%; background: conic-gradient(' . $gradient . '); flex-shrink: 0; box-shadow: 0 4px 15px rgba(0,0,0,0.2);"></div>';
} else {
    echo '<div style="width: 180px; height: 180px; border-radius: 50%; background: #f0f0f0; display: flex; align-items: center; justify-content: center; color: #666; font-size: 14px; flex-shrink: 0;">No Data</div>';
}

echo '<div style="flex: 1;">';
foreach ($asset_types as $class => $info) {
    $count = $asset_counts[$class];
    if ($count > 0) {
        $percentage = round(($count / $total_assets) * 100, 1);
        echo '<div style="display: flex; align-items: center; justify-content: space-between; margin: 8px 0; font-size: 14px; padding: 5px 0;">';
        echo '<div style="display: flex; align-items: center;">';
        echo '<div style="width: 16px; height: 16px; background: ' . $info['color'] . '; border-radius: 3px; margin-right: 10px;"></div>';
        echo '<span><strong>' . $info['label'] . '</strong></span>';
        echo '</div>';
        echo '<span style="color: #666;">' . $count . ' (' . $percentage . '%)</span>';
        echo '</div>';
    }
}
echo '</div>';
echo '</div>';
echo '</div>';

// Bar Chart using Chart.js
echo '<div style="flex: 1; min-width: 300px; background: white; padding: 25px; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">';
echo '<h3 style="margin: 0 0 20px 0; color: #333; font-size: 1.3rem; text-align: center;"> Asset Breakdown</h3>';
echo '<canvas id="assetBarChart" width="400" height="200"></canvas>';
echo '</div>';
echo '</div>';

// Row 3: Additional Info
echo '<div style="display: flex; gap: 20px; flex-wrap: wrap;">';

// Asset Status Table
echo '<div style="flex: 1; min-width: 400px; background: white; padding: 25px; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">';
echo '<h3 style="margin: 0 0 20px 0; color: #333; font-size: 1.3rem;"> Asset Summary</h3>';
echo '<table style="width: 100%; border-collapse: collapse;">';
echo '<thead><tr style="background: #f8f9fa;"><th style="padding: 12px; text-align: left; border-bottom: 2px solid #dee2e6;">Category</th><th style="padding: 12px; text-align: center; border-bottom: 2px solid #dee2e6;">Count</th><th style="padding: 12px; text-align: center; border-bottom: 2px solid #dee2e6;">Percentage</th></tr></thead>';
echo '<tbody>';
foreach ($asset_types as $class => $info) {
    $count = $asset_counts[$class];
    $percentage = $total_assets > 0 ? round(($count / $total_assets) * 100, 1) : 0;
    $row_bg = $count > 0 ? '#fff' : '#f8f9fa';
    echo '<tr style="background: ' . $row_bg . ';">';
    echo '<td style="padding: 10px; border-bottom: 1px solid #dee2e6;"><div style="display: flex; align-items: center;"><div style="width: 12px; height: 12px; background: ' . $info['color'] . '; border-radius: 2px; margin-right: 8px;"></div>' . $info['label'] . '</div></td>';
    echo '<td style="padding: 10px; text-align: center; border-bottom: 1px solid #dee2e6; font-weight: bold;">' . $count . '</td>';
    echo '<td style="padding: 10px; text-align: center; border-bottom: 1px solid #dee2e6;">' . $percentage . '%</td>';
    echo '</tr>';
}
echo '</tbody></table>';
echo '</div>';

// Quick Stats - AI Dynamic Insights Only
echo '<div style="flex: 1; min-width: 300px; background: white; padding: 25px; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);" id="quickstats-container">';
echo '<h3 style="margin: 0 0 20px 0; color: #2c3e50; font-size: 1.3rem; font-weight: 600; display: flex; align-items: center;">';
echo '<span style="margin-right: 10px; font-size: 1.4rem;">🤖</span> Quick Stats';
echo '<span id="ai-loading" style="margin-left: 10px; font-size: 0.8rem; color: #666; display: none; font-weight: 400;">Analyzing...</span>';
echo '</h3>';

// Load AI configuration
require_once(GLPI_ROOT . '/config/ai_config.php');
$ai_stats = new AIQuickStats();

// Generate current data signature for auto-refresh detection
$current_signature = $ai_stats->generateDataSignature($asset_counts, $total_assets);

echo '<div id="quickstats-content" data-signature="' . $current_signature . '">';
echo '<div id="ai-insights">';

// Clear cache to ensure fresh generation with updated cleaning
$ai_stats->clearCache();

$ai_insights = $ai_stats->generateAIInsights($asset_counts, $total_assets, $asset_types);
echo $ai_insights;
echo '</div>';
echo '</div>'; // Close quickstats-content

echo '</div>'; // Close quickstats-container
echo '</div>';

echo '</div>';

// Close enhanced tab
echo '</div>';

// Card Details Modal
echo '
<div id="cardDetailsModal" style="display: none; position: fixed; z-index: 10000; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgba(0,0,0,0.4); backdrop-filter: blur(5px);">
    <div style="background-color: #fefefe; margin: 3% auto; padding: 0; border-radius: 15px; width: 90%; max-width: 1200px; box-shadow: 0 10px 50px rgba(0,0,0,0.3); animation: slideIn 0.3s ease;">
        <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 25px; border-radius: 15px 15px 0 0; position: relative;">
            <h2 id="cardModalTitle" style="margin: 0; font-size: 1.5rem; display: flex; align-items: center;">Asset Details</h2>
            <span onclick="closeCardDetails()" style="position: absolute; right: 20px; top: 20px; font-size: 28px; font-weight: bold; cursor: pointer; color: white; opacity: 0.8; transition: opacity 0.3s;" onmouseover="this.style.opacity=\'1\'" onmouseout="this.style.opacity=\'0.8\'">×</span>
        </div>
        <div id="cardModalContent" style="padding: 30px; max-height: 70vh; overflow-y: auto;">
            Loading...
        </div>
    </div>
</div>

<style>
@keyframes slideIn {
    from { opacity: 0; transform: translateY(-50px); }
    to { opacity: 1; transform: translateY(0); }
}
</style>
';

// Tab 3: Maintenance View
echo '<div id="maintenance-tab" class="tab-content">';
echo '<div style="max-width: 1200px; margin: 40px auto; padding: 20px;">';

// ======================
// MAINTENANCE TAB DATA
// ======================

// Thresholds
$current_date        = date('Y-m-d');
$old_asset_threshold = date('Y-m-d', strtotime('-5 years')); // Older than 5 years
$warranty_threshold  = date('Y-m-d', strtotime('+6 months')); // Expiring soon

// Stats container
$maintenance_stats = [
    'old_computers'     => 0,
    'no_purchase_date'  => 0,
    'no_manufacturer'   => 0,
    'expired_warranty'  => 0,
    'outdated_os'       => 0
];

// Old computers
$query = "
    SELECT COUNT(*) AS cnt
    FROM glpi_computers c
    LEFT JOIN glpi_infocoms i ON c.id = i.items_id AND i.itemtype = 'Computer'
    WHERE i.buy_date < '$old_asset_threshold'
      AND c.is_deleted = 0
";
if ($res = $DB->query($query)) {
    $maintenance_stats['old_computers'] = intval($DB->fetchAssoc($res)['cnt']);
}

// Missing purchase date
$query = "
    SELECT COUNT(*) AS cnt
    FROM glpi_computers c
    LEFT JOIN glpi_infocoms i ON c.id = i.items_id AND i.itemtype = 'Computer'
    WHERE (i.buy_date IS NULL OR i.items_id IS NULL)
    AND c.is_deleted = 0
";
if ($res = $DB->query($query)) {
    $maintenance_stats['no_purchase_date'] = intval($DB->fetchAssoc($res)['cnt']);
}

// Missing manufacturer (still from glpi_computers)
$query = "
    SELECT COUNT(*) AS cnt
    FROM glpi_computers
    WHERE manufacturers_id = 0
      AND is_deleted = 0
";
if ($res = $DB->query($query)) {
    $maintenance_stats['no_manufacturer'] = intval($DB->fetchAssoc($res)['cnt']);
}

// Expired warranty
$query = "
    SELECT COUNT(*) AS cnt 
    FROM glpi_computers c
    JOIN glpi_infocoms i 
      ON i.items_id = c.id 
     AND i.itemtype = 'Computer'
    WHERE i.warranty_date IS NOT NULL
      AND i.warranty_date < CURDATE()
      AND c.is_deleted = 0
";
if ($res = $DB->query($query)) {
    $maintenance_stats['expired_warranty'] = intval($DB->fetchAssoc($res)['cnt']);
}

// Outdated OS
$query = "
    SELECT COUNT(*) AS cnt
    FROM glpi_computers c
    INNER JOIN glpi_items_operatingsystems ios
        ON ios.items_id = c.id
       AND ios.itemtype = 'Computer'
    INNER JOIN glpi_operatingsystems os
        ON os.id = ios.operatingsystems_id
    WHERE os.name LIKE '%Windows 7%'
       OR os.name LIKE '%Windows XP%'
";
if ($res = $DB->query($query)) {
    $maintenance_stats['outdated_os'] = intval($DB->fetchAssoc($res)['cnt']);
}

// Low Stock Items (Consumables and Cartridges)
$low_stock_threshold = 5; // Items with stock <= 5 are considered low
$maintenance_stats['low_stock_consumables'] = 0;
$maintenance_stats['low_stock_cartridges'] = 0;

// Low stock consumables
$query = "
    SELECT COUNT(*) AS cnt
    FROM glpi_consumableitems ci
    WHERE ci.is_deleted = 0
    AND (
        SELECT COUNT(*) 
        FROM glpi_consumables c 
        WHERE c.consumableitems_id = ci.id 
        AND c.date_out IS NULL
    ) <= $low_stock_threshold
";
if ($res = $DB->query($query)) {
    $maintenance_stats['low_stock_consumables'] = intval($DB->fetchAssoc($res)['cnt']);
}

// Low stock cartridges
$query = "
    SELECT COUNT(*) AS cnt
    FROM glpi_cartridgeitems ci
    WHERE ci.is_deleted = 0
    AND (
        SELECT COUNT(*) 
        FROM glpi_cartridges c 
        WHERE c.cartridgeitems_id = ci.id 
        AND c.date_use IS NULL
    ) <= $low_stock_threshold
";
if ($res = $DB->query($query)) {
    $maintenance_stats['low_stock_cartridges'] = intval($DB->fetchAssoc($res)['cnt']);
}

// ======================
// COUNT CATEGORIES
// ======================
$critical_count = $maintenance_stats['old_computers'] 
                + $maintenance_stats['expired_warranty'] 
                + $maintenance_stats['outdated_os'];

$warning_count  = $maintenance_stats['no_purchase_date'] 
                + $maintenance_stats['no_manufacturer'];

$low_stock_count = $maintenance_stats['low_stock_consumables'] 
                 + $maintenance_stats['low_stock_cartridges'];

$total_maintenance_items = $critical_count + $warning_count + $low_stock_count;

// ======================
// HEADER
// ======================
echo '<div style="text-align: center; margin-bottom: 40px;">';
echo '<h2 style="color: #333; margin-bottom: 10px;">Asset Maintenance Dashboard</h2>';
echo '<p style="color: #666; font-size: 16px;">Monitor assets requiring immediate attention and maintenance</p>';
echo '</div>';

// ======================
// SUMMARY CARDS
// ======================
echo '<div style="display: flex; gap: 20px; margin-bottom: 40px; flex-wrap: wrap;">';

// Critical Issues Card
echo '<div onclick="showAssetDetails(\'critical_issues\')" style="flex: 1; min-width: 250px; background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%); color: white; padding: 25px; border-radius: 15px; text-align: center; cursor: pointer; transition: all 0.3s ease; position: relative;" onmouseover="this.style.transform=\'translateY(-3px)\'; this.style.boxShadow=\'0 8px 25px rgba(255,107,107,0.3)\'" onmouseout="this.style.transform=\'translateY(0)\'; this.style.boxShadow=\'none\'">';
echo '<h3>Critical Issues</h3>';
echo '<div style="font-size: 2.5rem; font-weight: bold;">' . $critical_count . '</div>';
echo '<div>Assets need immediate attention</div>';
echo '<div style="position: absolute; bottom: 10px; right: 15px; font-size: 0.8rem; opacity: 0.8;">Click to view details</div>';
echo '</div>';

// Warning Issues Card
echo '<div onclick="showAssetDetails(\'warning_issues\')" style="flex: 1; min-width: 250px; background: linear-gradient(135deg, #ffa726 0%, #ff9800 100%); color: white; padding: 25px; border-radius: 15px; text-align: center; cursor: pointer; transition: all 0.3s ease; position: relative;" onmouseover="this.style.transform=\'translateY(-3px)\'; this.style.boxShadow=\'0 8px 25px rgba(255,167,38,0.3)\'" onmouseout="this.style.transform=\'translateY(0)\'; this.style.boxShadow=\'none\'">';
echo '<h3>Warning Issues</h3>';
echo '<div style="font-size: 2.5rem; font-weight: bold;">' . $warning_count . '</div>';
echo '<div>Assets need review</div>';
echo '<div style="position: absolute; bottom: 10px; right: 15px; font-size: 0.8rem; opacity: 0.8;">Click to view details</div>';
echo '</div>';

// Low Stock Card
echo '<div onclick="showAssetDetails(\'low_stock\')" style="flex: 1; min-width: 250px; background: linear-gradient(135deg, #ab47bc 0%, #8e24aa 100%); color: white; padding: 25px; border-radius: 15px; text-align: center; cursor: pointer; transition: all 0.3s ease; position: relative;" onmouseover="this.style.transform=\'translateY(-3px)\'; this.style.boxShadow=\'0 8px 25px rgba(171,71,188,0.3)\'" onmouseout="this.style.transform=\'translateY(0)\'; this.style.boxShadow=\'none\'">';
echo '<h3>Low Stock</h3>';
echo '<div style="font-size: 2.5rem; font-weight: bold;">' . $low_stock_count . '</div>';
echo '<div>Items need restocking</div>';
echo '<div style="position: absolute; bottom: 10px; right: 15px; font-size: 0.8rem; opacity: 0.8;">Click to view details</div>';
echo '</div>';

// Total Issues Card
echo '<div onclick="showAssetDetails(\'total_issues\')" style="flex: 1; min-width: 250px; background: linear-gradient(135deg, #42a5f5 0%, #1976d2 100%); color: white; padding: 25px; border-radius: 15px; text-align: center; cursor: pointer; transition: all 0.3s ease; position: relative;" onmouseover="this.style.transform=\'translateY(-3px)\'; this.style.boxShadow=\'0 8px 25px rgba(66,165,245,0.3)\'" onmouseout="this.style.transform=\'translateY(0)\'; this.style.boxShadow=\'none\'">';
echo '<h3>Total Issues</h3>';
echo '<div style="font-size: 2.5rem; font-weight: bold;">' . $total_maintenance_items . '</div>';
echo '<div>Items requiring attention</div>';
echo '<div style="position: absolute; bottom: 10px; right: 15px; font-size: 0.8rem; opacity: 0.8;">Click to view details</div>';
echo '</div>';

echo '</div>';

// ======================
// LOW STOCK SECTION - SIMPLIFIED WITH MODAL
// ======================
echo '<div style="margin-bottom: 40px;">';

if ($low_stock_count > 0) {
    // Subtle summary card - clickable to open modal
    echo '<div onclick="openLowStockModal()" style="background: white; border: 1px solid #e0e0e0; padding: 25px; border-radius: 15px; cursor: pointer; transition: all 0.2s ease; box-shadow: 0 2px 8px rgba(0,0,0,0.1);" onmouseover="this.style.boxShadow=\'0 4px 15px rgba(0,0,0,0.15)\'; this.style.borderColor=\'#ff9800\'" onmouseout="this.style.boxShadow=\'0 2px 8px rgba(0,0,0,0.1)\'; this.style.borderColor=\'#e0e0e0\'">';
    echo '<div style="display: flex; justify-content: space-between; align-items: center;">';
    echo '<div>';
    echo '<h3 style="margin: 0; font-size: 1.3rem; color: #333; display: flex; align-items: center;"><span style="margin-right: 10px; font-size: 1.5rem;"></span>Low Stock Monitoring</h3>';
    echo '<p style="margin: 8px 0 0 0; color: #666; font-size: 1rem;">' . $low_stock_count . ' items require attention</p>';
    echo '</div>';
    echo '<div style="text-align: right;">';
    echo '<div style="background: #fff3e0; color: #ff9800; padding: 8px 16px; border-radius: 20px; font-weight: 600; font-size: 0.9rem;">View Details</div>';
    echo '</div>';
    echo '</div>';
    
    // Subtle stats bar
    echo '<div style="display: flex; gap: 20px; margin-top: 20px; padding-top: 20px; border-top: 1px solid #f0f0f0;">';
    if ($maintenance_stats['low_stock_consumables'] > 0) {
        echo '<div style="flex: 1; text-align: center; padding: 10px; background: #f8f9fa; border-radius: 8px;">';
        echo '<div style="font-size: 1.5rem; font-weight: bold; color: #ff9800;">' . $maintenance_stats['low_stock_consumables'] . '</div>';
        echo '<div style="font-size: 0.85rem; color: #666;">Consumables</div>';
        echo '</div>';
    }
    if ($maintenance_stats['low_stock_cartridges'] > 0) {
        echo '<div style="flex: 1; text-align: center; padding: 10px; background: #f8f9fa; border-radius: 8px;">';
        echo '<div style="font-size: 1.5rem; font-weight: bold; color: #ff9800;">' . $maintenance_stats['low_stock_cartridges'] . '</div>';
        echo '<div style="font-size: 0.85rem; color: #666;">Cartridges</div>';
        echo '</div>';
    }
    echo '</div>';
    echo '</div>';
    
} else {
    // No low stock - clean success message
    echo '<div style="background: white; padding: 30px; border-radius: 15px; text-align: center; border: 2px solid #4caf50;">';
    echo '<div style="color: #4caf50; font-size: 3rem; margin-bottom: 15px;">✅</div>';
    echo '<h3 style="color: #4caf50; margin: 0 0 10px 0;">All Stock Levels Normal</h3>';
    echo '<p style="color: #666; margin: 0;">All consumables and cartridges are adequately stocked</p>';
    echo '</div>';
}

echo '</div>';

// ======================
// DETAILED ISSUES
// ======================
echo '<div style="display: flex; gap: 30px; margin-bottom: 40px; flex-wrap: wrap;">';

// Critical Issues Column
echo '<div style="flex: 1; min-width: 400px; background: white; padding: 30px; border-radius: 15px;">';
echo '<h3 style="color: #ff6b6b;">Critical Issues</h3>';

if ($maintenance_stats['old_computers'] > 0) {
    echo '<div style="background: #ffebee; padding: 15px; border-radius: 8px; margin-bottom: 15px;">
          <h4>Legacy Equipment</h4>
          <p><strong>' . $maintenance_stats['old_computers'] . '</strong> computers are over 5 years old</p>
          </div>';
}
if ($maintenance_stats['expired_warranty'] > 0) {
    echo '<div style="background: #ffebee; padding: 15px; border-radius: 8px; margin-bottom: 15px;">
          <h4>Expired Warranty</h4>
          <p><strong>' . $maintenance_stats['expired_warranty'] . '</strong> computers have expired warranties</p>
          </div>';
}
if ($maintenance_stats['outdated_os'] > 0) {
    echo '<div style="background: #ffebee; padding: 15px; border-radius: 8px; margin-bottom: 15px;">
          <h4>Outdated OS</h4>
          <p><strong>' . $maintenance_stats['outdated_os'] . '</strong> computers running Windows 7/XP</p>
          </div>';
}
if ($critical_count == 0) {
    echo '<p style="color: #4caf50;">No critical issues found!</p>';
}
echo '</div>';

// Warning Issues Column
echo '<div style="flex: 1; min-width: 400px; background: white; padding: 30px; border-radius: 15px;">';
echo '<h3 style="color: #ffa726;">Warning Issues</h3>';

if ($maintenance_stats['no_purchase_date'] > 0) {
    echo '<div style="background: #fff3e0; padding: 15px; border-radius: 8px; margin-bottom: 15px;">
          <h4>Missing Purchase Date</h4>
          <p><strong>' . $maintenance_stats['no_purchase_date'] . '</strong> computers missing purchase date</p>
          </div>';
}
if ($maintenance_stats['no_manufacturer'] > 0) {
    echo '<div style="background: #fff3e0; padding: 15px; border-radius: 8px; margin-bottom: 15px;">
          <h4>Missing Manufacturer</h4>
          <p><strong>' . $maintenance_stats['no_manufacturer'] . '</strong> computers missing manufacturer info</p>
          </div>';
}
if ($warning_count == 0) {
    echo '<p style="color: #4caf50;">No warning issues found!</p>';
}
echo '</div>';
echo '</div>';

// Modal for detailed low stock information
if ($low_stock_count > 0) {
    echo '
    <!-- Low Stock Modal -->
    <div id="lowStockModal" style="display: none; position: fixed; z-index: 1000; left: 0; top: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.5);">
        <div style="background-color: white; margin: 5% auto; padding: 0; width: 90%; max-width: 800px; border-radius: 15px; max-height: 80vh; overflow-y: auto;">
            <!-- Modal Header -->
            <div style="background: linear-gradient(135deg, #ab47bc 0%, #8e24aa 100%); color: white; padding: 20px; border-radius: 15px 15px 0 0; display: flex; justify-content: space-between; align-items: center;">
                <h2 style="margin: 0; font-size: 1.8rem;"> Low Stock Details</h2>
                <span onclick="closeLowStockModal()" style="color: white; font-size: 28px; font-weight: bold; cursor: pointer; padding: 5px;">&times;</span>
            </div>
            
            <!-- Modal Content -->
            <div style="padding: 25px;">';
    
    // Get all low stock items for modal
    $critical_items = [];
    $warning_items = [];
    
    // Get consumables
    if ($maintenance_stats['low_stock_consumables'] > 0) {
        $query = "
            SELECT ci.name, ci.ref, 'Consumable' as type,
                   (SELECT COUNT(*) FROM glpi_consumables c WHERE c.consumableitems_id = ci.id AND c.date_out IS NULL) as stock_count
            FROM glpi_consumableitems ci
            WHERE ci.is_deleted = 0
            HAVING stock_count <= $low_stock_threshold
            ORDER BY stock_count ASC
        ";
        if ($res = $DB->query($query)) {
            while ($row = $DB->fetchAssoc($res)) {
                if ($row['stock_count'] == 0) {
                    $critical_items[] = $row;
                } else {
                    $warning_items[] = $row;
                }
            }
        }
    }
    
    // Get cartridges
    if ($maintenance_stats['low_stock_cartridges'] > 0) {
        $query = "
            SELECT ci.name, ci.ref, 'Cartridge' as type,
                   (SELECT COUNT(*) FROM glpi_cartridges c WHERE c.cartridgeitems_id = ci.id AND c.date_use IS NULL) as stock_count
            FROM glpi_cartridgeitems ci
            WHERE ci.is_deleted = 0
            HAVING stock_count <= $low_stock_threshold
            ORDER BY stock_count ASC
        ";
        if ($res = $DB->query($query)) {
            while ($row = $DB->fetchAssoc($res)) {
                if ($row['stock_count'] == 0) {
                    $critical_items[] = $row;
                } else {
                    $warning_items[] = $row;
                }
            }
        }
    }
    
    // Display critical items in modal
    if (!empty($critical_items)) {
        echo '<div style="margin-bottom: 30px;">
                <h3 style="color: #d32f2f; margin-bottom: 15px; display: flex; align-items: center;">
                    <span style="margin-right: 10px;"></span>Out of Stock
                </h3>
                <div style="display: grid; gap: 10px;">';
        
        foreach ($critical_items as $item) {
            echo '<div style="display: flex; justify-content: space-between; align-items: center; padding: 15px; background: #fff3f3; border-radius: 10px;">
                    <div>
                        <strong style="color: #333; font-size: 1rem;">' . $item['name'] . '</strong>';
            if ($item['ref']) echo '<br><span style="color: #666; font-size: 0.85rem;">Reference: ' . $item['ref'] . '</span>';
            echo '<br><span style="color: #666; font-size: 0.85rem; background: #e3f2fd; padding: 2px 8px; border-radius: 12px;">' . $item['type'] . '</span>
                    </div>
                    <div style="display: flex; flex-direction: column; align-items: flex-end; gap: 8px;">
                        <div style="background: #d32f2f; color: white; padding: 6px 12px; border-radius: 15px; font-weight: 600; font-size: 0.9rem;">
                            0 units
                        </div>
                        <a href="/GLPI-Techwise/front/ticket.form.php?description=Out%20of%20stock%20alert%20for%20' . urlencode($item['name']) . '%20(' . urlencode($item['type']) . ')&title=Out%20of%20Stock%20-%20' . urlencode($item['name']) . '" target="_blank" style="background: #1976d2; color: white; padding: 6px 16px; border-radius: 15px; font-size: 0.9rem; text-decoration: none; font-weight: 600; transition: background 0.2s;">Submit Ticket</a>
                    </div>
                </div>';
        }
        echo '</div></div>';
    }
    
    // Display warning items in modal
    if (!empty($warning_items)) {
        echo '<div style="margin-bottom: 20px;">
                <h3 style="color: #f57c00; margin-bottom: 15px; display: flex; align-items: center;">
                    <span style="margin-right: 10px;"></span>Low Stock
                </h3>
                <div style="display: grid; gap: 10px;">';
        
        foreach ($warning_items as $item) {
            $urgency_color = $item['stock_count'] <= 2 ? '#ff9800' : '#ff7043';
            echo '<div style="display: flex; justify-content: space-between; align-items: center; padding: 15px; background: #fffbf0; border-radius: 10px;">
                    <div>
                        <strong style="color: #333; font-size: 1rem;">' . $item['name'] . '</strong>';
            if ($item['ref']) echo '<br><span style="color: #666; font-size: 0.85rem;">Reference: ' . $item['ref'] . '</span>';
            echo '<br><span style="color: #666; font-size: 0.85rem; background: #e3f2fd; padding: 2px 8px; border-radius: 12px;">' . $item['type'] . '</span>
                    </div>
                    <div style="display: flex; flex-direction: column; align-items: flex-end; gap: 8px;">
                        <div style="background: ' . $urgency_color . '; color: white; padding: 6px 12px; border-radius: 15px; font-weight: 600; font-size: 0.9rem;">
                            ' . $item['stock_count'] . ' units
                        </div>
                        <a href="/GLPI-Techwise/front/ticket.form.php?content=Low%20stock%20alert%20for%20' . urlencode($item['name']) . '%20(' . urlencode($item['type']) . '),%20current%20stock:%20' . urlencode($item['stock_count']) . '&subject=Low%20Stock%20-%20' . urlencode($item['name']) . '" target="_blank" style="background: #1976d2; color: white; padding: 6px 16px; border-radius: 15px; font-size: 0.9rem; text-decoration: none; font-weight: 600; transition: background 0.2s;">Submit Ticket</a>
                    </div>
                </div>';
        }
        echo '</div></div>';
    }
    
    echo '    <div style="text-align: center; margin-top: 20px; padding-top: 20px; border-top: 1px solid #e0e0e0;">
                    <button onclick="closeLowStockModal()" style="background: #666; color: white; border: none; padding: 10px 25px; border-radius: 20px; font-size: 0.95rem; cursor: pointer; transition: background 0.2s ease;" onmouseover="this.style.background=\'#555\'" onmouseout="this.style.background=\'#666\'">
                        Close
                    </button>
                </div>
            </div>
        </div>
    </div>';
}

// Add JavaScript for modal functionality
echo '<script>
function openLowStockModal() {
    document.getElementById("lowStockModal").style.display = "block";
    document.body.style.overflow = "hidden"; // Prevent background scrolling
}

function closeLowStockModal() {
    document.getElementById("lowStockModal").style.display = "none";
    document.body.style.overflow = "auto"; // Restore scrolling
}

// Close modal when clicking outside of it
window.onclick = function(event) {
    var modal = document.getElementById("lowStockModal");
    if (event.target == modal) {
        closeLowStockModal();
    }
}

// Close modal with Escape key
document.addEventListener("keydown", function(event) {
    if (event.key === "Escape") {
        closeLowStockModal();
    }
});
</script>';

// ======================
// AI-POWERED RECOMMENDATIONS
// ======================
echo '<div style="background: white; padding: 30px; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">';
echo '<h3 style="color: #4caf50; margin-bottom: 20px; display: flex; align-items: center; font-size: 1.4rem;">';
echo '<span style="margin-right: 12px;">🤖</span>AI Maintenance Recommendations';
echo '</h3>';

// Load AI configuration and generate recommendations
require_once(GLPI_ROOT . '/config/ai_config.php');
$ai_maintenance = new AIQuickStats();

// Clear cache to get fresh recommendations
$ai_maintenance->clearCache();

// Pre-load asset data for modal display
$asset_data = [];

// Load old computers data
$query = "
    SELECT c.name, c.id, c.date_creation, c.comment, 
           m.name as manufacturer, mt.name as model
    FROM glpi_computers c
    LEFT JOIN glpi_manufacturers m ON c.manufacturers_id = m.id
    LEFT JOIN glpi_computermodels mt ON c.computermodels_id = mt.id
    WHERE c.is_deleted = 0 
    AND c.is_template = 0
    AND (c.date_creation IS NULL OR c.date_creation < DATE_SUB(NOW(), INTERVAL 5 YEAR))
    LIMIT 20
";
$result = $DB->query($query);
$asset_data['old_computers'] = [];
if ($result) {
    while ($row = $DB->fetchAssoc($result)) {
        $asset_data['old_computers'][] = $row;
    }
}

// Load expired warranties data
$query = "
    SELECT c.name, c.id, i.warranty_date, c.comment,
           m.name as manufacturer, mt.name as model
    FROM glpi_computers c
    LEFT JOIN glpi_manufacturers m ON c.manufacturers_id = m.id
    LEFT JOIN glpi_computermodels mt ON c.computermodels_id = mt.id
    LEFT JOIN glpi_infocoms i ON i.items_id = c.id AND i.itemtype = 'Computer'
    WHERE c.is_deleted = 0 
    AND c.is_template = 0
    AND i.warranty_date IS NOT NULL 
    AND i.warranty_date < CURDATE()
    LIMIT 20
";
$result = $DB->query($query);
$asset_data['expired_warranties'] = [];
if ($result) {
    while ($row = $DB->fetchAssoc($result)) {
        $asset_data['expired_warranties'][] = $row;
    }
}

// Load outdated OS data
$query = "
    SELECT c.name, c.id, c.comment, os.name as os_name,
           m.name as manufacturer, mt.name as model
    FROM glpi_computers c
    LEFT JOIN glpi_manufacturers m ON c.manufacturers_id = m.id
    LEFT JOIN glpi_computermodels mt ON c.computermodels_id = mt.id
    INNER JOIN glpi_items_operatingsystems ios ON ios.items_id = c.id AND ios.itemtype = 'Computer'
    INNER JOIN glpi_operatingsystems os ON os.id = ios.operatingsystems_id
    WHERE c.is_deleted = 0 
    AND c.is_template = 0
    AND (os.name LIKE '%Windows 7%' OR os.name LIKE '%Windows XP%')
    LIMIT 20
";
$result = $DB->query($query);
$asset_data['outdated_os'] = [];
if ($result) {
    while ($row = $DB->fetchAssoc($result)) {
        $asset_data['outdated_os'][] = $row;
    }
}

// Load low stock data
$query = "
    (SELECT ci.name, 'Consumable' as type, ci.id, ci.comment,
        (SELECT COUNT(*) FROM glpi_consumables c WHERE c.consumableitems_id = ci.id AND c.date_out IS NULL) as stock_count
     FROM glpi_consumableitems ci
     WHERE ci.is_deleted = 0
     AND (SELECT COUNT(*) FROM glpi_consumables c WHERE c.consumableitems_id = ci.id AND c.date_out IS NULL) <= 5
     LIMIT 10)
    UNION
    (SELECT ci.name, 'Cartridge' as type, ci.id, ci.comment,
        (SELECT COUNT(*) FROM glpi_cartridges c WHERE c.cartridgeitems_id = ci.id AND c.date_out IS NULL) as stock_count
     FROM glpi_cartridgeitems ci
     WHERE ci.is_deleted = 0
     AND (SELECT COUNT(*) FROM glpi_cartridges c WHERE c.cartridgeitems_id = ci.id AND c.date_out IS NULL) <= 5
     LIMIT 10)
";
$result = $DB->query($query);
$asset_data['low_stock'] = [];
if ($result) {
    while ($row = $DB->fetchAssoc($result)) {
        $asset_data['low_stock'][] = $row;
    }
}

// Load missing data assets
$query = "
    SELECT c.name, c.id, c.comment, i.buy_date, i.warranty_date,
           m.name as manufacturer, mt.name as model
    FROM glpi_computers c
    LEFT JOIN glpi_manufacturers m ON c.manufacturers_id = m.id
    LEFT JOIN glpi_computermodels mt ON c.computermodels_id = mt.id
    LEFT JOIN glpi_infocoms i ON i.items_id = c.id AND i.itemtype = 'Computer'
    WHERE c.is_deleted = 0 
    AND c.is_template = 0
    AND (i.buy_date IS NULL OR c.manufacturers_id IS NULL OR c.manufacturers_id = 0)
    LIMIT 20
";
$result = $DB->query($query);
$asset_data['missing_data'] = [];
if ($result) {
    while ($row = $DB->fetchAssoc($result)) {
        $asset_data['missing_data'][] = $row;
    }
}

// Create combined data arrays for maintenance cards
$asset_data['critical_issues'] = array_merge(
    $asset_data['old_computers'] ?? [],
    $asset_data['expired_warranties'] ?? [],
    $asset_data['outdated_os'] ?? []
);

$asset_data['warning_issues'] = array_merge(
    $asset_data['missing_data'] ?? []
);

$asset_data['total_issues'] = array_merge(
    $asset_data['critical_issues'],
    $asset_data['warning_issues'],
    $asset_data['low_stock'] ?? []
);

echo '<div id="maintenance-recommendations">';
$ai_recommendations = $ai_maintenance->generateMaintenanceRecommendations($maintenance_stats, $low_stock_count);
echo $ai_recommendations;
echo '</div>';

echo '</div>';

echo '</div>';
echo '</div>';

// JavaScript for tab switching
echo '<script>
function switchTab(tabName, buttonElement) {
    // Hide all tab contents
    const tabContents = document.querySelectorAll(".tab-content");
    tabContents.forEach(tab => tab.classList.remove("active"));
    
    // Remove active class from all buttons
    const tabButtons = document.querySelectorAll(".tab-button");
    tabButtons.forEach(button => button.classList.remove("active"));
    
    // Show selected tab content
    document.getElementById(tabName + "-tab").classList.add("active");
    
    // Add active class to clicked button
    buttonElement.classList.add("active");
}

// Card Details Data
const cardDetails = ' . json_encode($card_details) . ';

// Function to show card details
function showCardDetails(cardType) {
    const modal = document.getElementById("cardDetailsModal");
    const modalTitle = document.getElementById("cardModalTitle");
    const modalContent = document.getElementById("cardModalContent");
    
    // Set modal title based on card type
    const titles = {
        "total_assets": "📊 Total Assets Details",
        "active_hardware": "🖥️ Active Hardware Details",
        "software_licenses": "💿 Software & Licenses Details"
    };
    
    modalTitle.textContent = titles[cardType] || "Asset Details";
    modal.style.display = "block";
    
    // Get the data for this card
    const data = cardDetails[cardType] || {};
    
    if (Object.keys(data).length === 0) {
        modalContent.innerHTML = `
            <div style="text-align: center; padding: 40px;">
                <div style="color: #666; font-size: 18px;">No data available for this category.</div>
            </div>
        `;
        return;
    }
    
    // Build the content
    let html = `<div style="display: flex; flex-wrap: wrap; gap: 20px;">`;
    
    Object.keys(data).forEach(function(category) {
        const categoryData = data[category];
        const items = categoryData.items || [];
        const count = categoryData.count || 0;
        const color = categoryData.color || "#666";
        
        html += `
            <div style="flex: 1; min-width: 300px; background: #f8f9fa; border-radius: 12px; overflow: hidden; border: 1px solid #e9ecef;">
                <div style="background: ${color}; color: white; padding: 20px; text-align: center;">
                    <h3 style="margin: 0; font-size: 1.2rem;">${escapeHtml(category)}</h3>
                    <div style="font-size: 2rem; font-weight: bold; margin-top: 8px;">${count}</div>
                </div>
                <div style="padding: 20px; max-height: 400px; overflow-y: auto;">
        `;
        
        if (items.length > 0) {
            html += `<div style="space-y: 8px;">`;
            items.forEach(function(item, index) {
                if (index < 20) { // Limit to first 20 items
                    html += `
                        <div style="display: flex; justify-content: space-between; align-items: center; padding: 12px; background: white; border-radius: 8px; border: 1px solid #e9ecef; margin-bottom: 8px;">
                            <div>
                                <div style="font-weight: 600; color: #333;">${escapeHtml(item.name || "Unnamed")}</div>
                                <div style="color: #666; font-size: 0.85rem;">${escapeHtml(item.serial || "No serial")}</div>
                            </div>
                            <div style="text-align: right; color: #888; font-size: 0.8rem;">
                                ID: ${item.id}<br>
                                ${item.date_creation ? new Date(item.date_creation).toLocaleDateString() : "N/A"}
                            </div>
                        </div>
                    `;
                }
            });
            
            if (items.length > 20) {
                html += `<div style="text-align: center; color: #666; font-style: italic; margin-top: 15px;">... and ${items.length - 20} more items</div>`;
            }
            
            html += `</div>`;
        } else {
            html += `<div style="text-align: center; color: #666; padding: 20px;">No items found</div>`;
        }
        
        html += `</div></div>`;
    });
    
    html += `</div>`;
    
    html += `<div style="margin-top: 30px; padding-top: 20px; border-top: 1px solid #dee2e6; text-align: center; color: #666; font-size: 0.9rem;">`;
    html += `Showing up to 20 items per category • Last updated: ` + new Date().toLocaleString();
    html += `</div>`;
    
    modalContent.innerHTML = html;
}

// Helper function to escape HTML
function escapeHtml(text) {
    const div = document.createElement("div");
    div.textContent = text;
    return div.innerHTML;
}

// Function to close modal
function closeCardDetails() {
    document.getElementById("cardDetailsModal").style.display = "none";
}

// Close modal when clicking outside
window.onclick = function(event) {
    const modal = document.getElementById("cardDetailsModal");
    if (event.target === modal) {
        modal.style.display = "none";
    }
}
</script>';

// Chart.js Script
echo '<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>';
echo '<script>
document.addEventListener("DOMContentLoaded", function() {
    const ctx = document.getElementById("assetBarChart");
    if (ctx) {
        new Chart(ctx, {
            type: "bar",
            data: {
                labels: [';
                
$labels = [];
$data = [];
$colors = [];
foreach ($asset_types as $class => $info) {
    if ($asset_counts[$class] > 0) {
        $labels[] = '"' . $info['label'] . '"';
        $data[] = $asset_counts[$class];
        $colors[] = '"' . $info['color'] . '"';
    }
}
echo implode(', ', $labels);

echo '],
                datasets: [{
                    label: "Asset Count",
                    data: [' . implode(', ', $data) . '],
                    backgroundColor: [' . implode(', ', $colors) . '],
                    borderWidth: 0,
                    borderRadius: 8
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { display: false }
                },
                scales: {
                    y: { 
                        beginAtZero: true,
                        grid: { color: "#f0f0f0" }
                    },
                    x: {
                        grid: { display: false }
                    }
                }
            }
        });
    }
});
</script>';

// Auto-refresh functionality for AI Quick Stats
echo '<script>
document.addEventListener("DOMContentLoaded", function() {
    let lastSignature = null;
    
    // Get initial signature
    const quickstatsContent = document.getElementById("quickstats-content");
    if (quickstatsContent) {
        lastSignature = quickstatsContent.getAttribute("data-signature");
    }
    
    // Function to check for data changes and refresh AI insights
    function checkForUpdates() {
        // Only check if we are on the Analytics tab
        const analyticsTab = document.getElementById("analytics-tab");
        if (!analyticsTab || !analyticsTab.classList.contains("active")) {
            return;
        }
        
        const currentSignature = quickstatsContent ? quickstatsContent.getAttribute("data-signature") : null;
        
        // If signature changed, refresh the insights
        if (currentSignature && currentSignature !== lastSignature) {
            refreshQuickStats();
            lastSignature = currentSignature;
        }
    }
    
    // Function to refresh AI insights only
    function refreshQuickStats() {
        const aiInsights = document.getElementById("ai-insights");
        const aiLoading = document.getElementById("ai-loading");
        
        if (!aiInsights || !aiLoading) return;
        
        // Show loading indicator
        aiLoading.style.display = "inline";
        
        // Create a hidden form to get updated AI insights
        const form = document.createElement("form");
        form.method = "POST";
        form.style.display = "none";
        
        const actionInput = document.createElement("input");
        actionInput.type = "hidden";
        actionInput.name = "refresh_ai";
        actionInput.value = "1";
        form.appendChild(actionInput);
        
        document.body.appendChild(form);
        
        // Use fetch to get updated insights without full page reload
        const formData = new FormData(form);
        
        fetch(window.location.href, {
            method: "POST",
            body: formData,
            headers: {
                "X-Requested-With": "XMLHttpRequest"
            }
        })
        .then(response => response.text())
        .then(data => {
            // Update AI insights with new content
            aiInsights.innerHTML = data;
            aiLoading.style.display = "none";
            document.body.removeChild(form);
        })
        .catch(error => {
            console.log("AI refresh completed");
            aiLoading.style.display = "none";
            if (document.body.contains(form)) {
                document.body.removeChild(form);
            }
        });
    }
    
    // Monitor for data changes every 10 seconds
    setInterval(checkForUpdates, 10000);
    
    // Also check when tab becomes active
    document.addEventListener("click", function(e) {
        if (e.target && e.target.textContent && e.target.textContent.includes("Analytics")) {
            setTimeout(checkForUpdates, 500);
        }
    });
    
    // Initial check after 2 seconds
    setTimeout(checkForUpdates, 2000);
});
</script>';

// Asset Details Modal and JavaScript
echo '
<!-- Asset Details Modal -->
<div id="assetDetailsModal" style="display: none; position: fixed; z-index: 1000; left: 0; top: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.5);">
    <div style="background-color: white; margin: 5% auto; padding: 0; border-radius: 15px; width: 80%; max-width: 800px; max-height: 80%; overflow-y: auto; box-shadow: 0 10px 30px rgba(0,0,0,0.3);">
        <div style="display: flex; justify-content: space-between; align-items: center; padding: 25px 30px; border-bottom: 1px solid #eee;">
            <h2 id="modalTitle" style="margin: 0; color: #333; font-size: 1.5rem;">Asset Details</h2>
            <button onclick="closeAssetDetails()" style="background: none; border: none; font-size: 24px; cursor: pointer; color: #999; padding: 5px;">&times;</button>
        </div>
        <div id="modalContent" style="padding: 30px;">
            <div style="text-align: center; color: #999;">Loading asset details...</div>
        </div>
    </div>
</div>
';

// Output JavaScript with embedded PHP data
?>
<script>
const assetData = <?php echo json_encode($asset_data); ?>;

// Function to show asset details
function showAssetDetails(category) {
    const modal = document.getElementById("assetDetailsModal");
    const modalTitle = document.getElementById("modalTitle");
    const modalContent = document.getElementById("modalContent");
    
    // Set modal title based on category
    const titles = {
        "old_computers": "🖥️ Old Computers Requiring Replacement",
        "expired_warranties": "📋 Assets with Expired Warranties", 
        "outdated_os": "🔒 Systems with Outdated Operating Systems",
        "low_stock": "📦 Low Stock Items",
        "missing_data": "📝 Assets with Missing Information",
        "critical_issues": "🚨 Critical Issues - Immediate Attention Required",
        "warning_issues": "⚠️ Warning Issues - Assets Need Review",
        "total_issues": "📊 All Issues - Complete Overview"
    };
    
    modalTitle.textContent = titles[category] || "Asset Details";
    modal.style.display = "block";
    
    // Get the data for this category
    const data = assetData[category] || [];
    
    if (data.length === 0) {
        modalContent.innerHTML = `
            <div style="text-align: center; padding: 40px;">
                <div style="color: #28a745; font-size: 18px; margin-bottom: 15px;">✅ All Good!</div>
                <div style="color: #666;">No assets found in this category. Everything appears to be in order.</div>
            </div>
        `;
        return;
    }
    
    // Build the table HTML
    let html = '<div style="overflow-x: auto;">';
    html += '<table style="width: 100%; border-collapse: collapse; margin-top: 15px;">';
    html += '<thead>';
    html += '<tr style="background: #f8f9fa; border-bottom: 2px solid #dee2e6;">';
    html += '<th style="padding: 12px; text-align: left; font-weight: 600; color: #495057;">Name</th>';
    
    if (category === "low_stock") {
        html += '<th style="padding: 12px; text-align: left; font-weight: 600; color: #495057;">Type</th>';
        html += '<th style="padding: 12px; text-align: center; font-weight: 600; color: #495057;">Stock</th>';
    } else {
        html += '<th style="padding: 12px; text-align: left; font-weight: 600; color: #495057;">Manufacturer</th>';
        html += '<th style="padding: 12px; text-align: left; font-weight: 600; color: #495057;">Model</th>';
    }
    
    if (category === "expired_warranties") {
        html += '<th style="padding: 12px; text-align: center; font-weight: 600; color: #495057;">Warranty Expired</th>';
    } else if (category === "outdated_os") {
        html += '<th style="padding: 12px; text-align: left; font-weight: 600; color: #495057;">Operating System</th>';
    } else if (category === "old_computers") {
        html += '<th style="padding: 12px; text-align: center; font-weight: 600; color: #495057;">Age</th>';
    }
    
    html += '<th style="padding: 12px; text-align: left; font-weight: 600; color: #495057;">Notes</th>';
    html += '</tr>';
    html += '</thead>';
    html += '<tbody>';
    
    data.forEach(function(row) {
        html += '<tr style="border-bottom: 1px solid #dee2e6;">';
        html += '<td style="padding: 12px; font-weight: 500;">' + escapeHtml(row.name || '') + '</td>';
        
        if (category === "low_stock") {
            html += '<td style="padding: 12px;">' + escapeHtml(row.type || '') + '</td>';
            html += '<td style="padding: 12px; text-align: center;"><span style="background: #dc3545; color: white; padding: 4px 8px; border-radius: 12px; font-size: 0.85rem;">' + (row.stock_count || 0) + '</span></td>';
        } else {
            html += '<td style="padding: 12px;">' + escapeHtml(row.manufacturer || 'Unknown') + '</td>';
            html += '<td style="padding: 12px;">' + escapeHtml(row.model || 'Unknown') + '</td>';
        }
        
        if (category === "expired_warranties") {
            html += '<td style="padding: 12px; text-align: center; color: #dc3545;">' + escapeHtml(row.warranty_date || '') + '</td>';
        } else if (category === "outdated_os") {
            html += '<td style="padding: 12px; color: #dc3545;">' + escapeHtml(row.os_name || 'Unknown') + '</td>';
        } else if (category === "old_computers") {
            let age = 'Unknown';
            if (row.date_creation) {
                const creationDate = new Date(row.date_creation);
                const now = new Date();
                age = Math.floor((now - creationDate) / (365 * 24 * 60 * 60 * 1000)) + ' years';
            }
            html += '<td style="padding: 12px; text-align: center; color: #dc3545;">' + age + '</td>';
        }
        
        let comment = row.comment || 'No notes';
        if (comment.length > 50) {
            comment = comment.substring(0, 50) + '...';
        }
        html += '<td style="padding: 12px; color: #666; font-style: italic;">' + escapeHtml(comment) + '</td>';
        html += '</tr>';
    });
    
    html += '</tbody>';
    html += '</table>';
    html += '</div>';
    
    html += '<div style="margin-top: 20px; padding-top: 20px; border-top: 1px solid #dee2e6; text-align: center; color: #666; font-size: 0.9rem;">';
    html += 'Showing up to 20 items • Last updated: ' + new Date().toLocaleString();
    html += '</div>';
    
    modalContent.innerHTML = html;
}

// Helper function to escape HTML
function escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}

// Function to close modal
function closeAssetDetails() {
    document.getElementById("assetDetailsModal").style.display = "none";
}

// Close modal when clicking outside
window.onclick = function(event) {
    const modal = document.getElementById("assetDetailsModal");
    if (event.target === modal) {
        modal.style.display = "none";
    }
}
</script>
<?php

Html::footer();

