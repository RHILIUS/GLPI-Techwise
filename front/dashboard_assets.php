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
echo '<div style="flex: 1; min-width: 250px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 20px; border-radius: 12px; text-align: center;">';
echo '<h3 style="margin: 0 0 10px 0; font-size: 1.1rem;">Total Assets</h3>';

echo '<div style="font-size: 2.5rem; font-weight: bold;">' . $total_assets . '</div>';
echo '</div>';

$active_assets = array_sum(array_slice($asset_counts, 0, 3)); // Computers + Monitors + Printers
echo '<div style="flex: 1; min-width: 250px; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); color: white; padding: 20px; border-radius: 12px; text-align: center;">';
echo '<h3 style="margin: 0 0 10px 0; font-size: 1.1rem;">Active Hardware</h3>';
echo '<div style="font-size: 2.5rem; font-weight: bold;">' . $active_assets . '</div>';
echo '</div>';

$software_count = ($asset_counts['glpi_softwares'] ?? 0) + ($asset_counts['glpi_softwarelicenses'] ?? 0);
echo '<div style="flex: 1; min-width: 250px; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); color: white; padding: 20px; border-radius: 12px; text-align: center;">';
echo '<h3 style="margin: 0 0 10px 0; font-size: 1.1rem;">Software & Licenses</h3>';
echo '<div style="font-size: 2.5rem; font-weight: bold;">' . $software_count . '</div>';
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

// Quick Stats
echo '<div style="flex: 1; min-width: 300px; background: white; padding: 25px; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">';
echo '<h3 style="margin: 0 0 20px 0; color: #333; font-size: 1.3rem;"> Quick Stats</h3>';
echo '<div style="margin-bottom: 15px; padding: 15px; background: #e3f2fd; border-radius: 8px;">';
echo '<div style="font-size: 1.1rem; color: #1976d2; margin-bottom: 5px;">Most Common Asset</div>';
$max_class = array_keys($asset_counts, max($asset_counts))[0];
$max_label = $asset_types[$max_class]['label'] ?? 'N/A';
echo '<div style="font-weight: bold; color: #333;">' . $max_label . ' (' . max($asset_counts) . ' items)</div>';
echo '</div>';

echo '<div style="margin-bottom: 15px; padding: 15px; background: #f3e5f5; border-radius: 8px;">';
echo '<div style="font-size: 1.1rem; color: #7b1fa2; margin-bottom: 5px;">Categories with Assets</div>';
echo '<div style="font-weight: bold; color: #333;">' . count(array_filter($asset_counts)) . ' out of ' . count($asset_types) . '</div>';
echo '</div>';

if ($total_assets > 0) {
    $avg_per_category = round($total_assets / count(array_filter($asset_counts)), 1);
    echo '<div style="padding: 15px; background: #e8f5e8; border-radius: 8px;">';
    echo '<div style="font-size: 1.1rem; color: #388e3c; margin-bottom: 5px;">Average per Category</div>';
    echo '<div style="font-weight: bold; color: #333;">' . $avg_per_category . ' assets</div>';
    echo '</div>';
}
echo '</div>';
echo '</div>';

echo '</div>';

// Close enhanced tab
echo '</div>';

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

// ======================
// COUNT CATEGORIES
// ======================
$critical_count = $maintenance_stats['old_computers'] 
                + $maintenance_stats['expired_warranty'] 
                + $maintenance_stats['outdated_os'];

$warning_count  = $maintenance_stats['no_purchase_date'] 
                + $maintenance_stats['no_manufacturer'];

$total_maintenance_items = $critical_count + $warning_count;

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
echo '<div style="flex: 1; min-width: 250px; background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%); color: white; padding: 25px; border-radius: 15px; text-align: center;">';
echo '<h3>Critical Issues</h3>';
echo '<div style="font-size: 2.5rem; font-weight: bold;">' . $critical_count . '</div>';
echo '<div>Assets need immediate attention</div>';
echo '</div>';

// Warning Issues Card
echo '<div style="flex: 1; min-width: 250px; background: linear-gradient(135deg, #ffa726 0%, #ff9800 100%); color: white; padding: 25px; border-radius: 15px; text-align: center;">';
echo '<h3>Warning Issues</h3>';
echo '<div style="font-size: 2.5rem; font-weight: bold;">' . $warning_count . '</div>';
echo '<div>Assets need review</div>';
echo '</div>';

// Total Issues Card
echo '<div style="flex: 1; min-width: 250px; background: linear-gradient(135deg, #42a5f5 0%, #1976d2 100%); color: white; padding: 25px; border-radius: 15px; text-align: center;">';
echo '<h3>Total Issues</h3>';
echo '<div style="font-size: 2.5rem; font-weight: bold;">' . $total_maintenance_items . '</div>';
echo '<div>Items requiring attention</div>';
echo '</div>';

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

// ======================
// RECOMMENDATIONS
// ======================
echo '<div style="background: white; padding: 30px; border-radius: 15px;">';
echo '<h3 style="color: #4caf50;">Recommendations</h3>';
echo '<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px;">';

if ($maintenance_stats['old_computers'] > 0) {
    echo '<div style="background: #f1f8e9; padding: 20px; border-radius: 10px;">
          <h4>🔄 Plan Equipment Refresh</h4>
          <p>Upgrade legacy systems to avoid performance and security issues.</p>
          </div>';
}
if ($maintenance_stats['expired_warranty'] > 0) {
    echo '<div style="background: #f1f8e9; padding: 20px; border-radius: 10px;">
          <h4>🛡 Renew Warranties</h4>
          <p>Consider extending or replacing assets with expired warranties.</p>
          </div>';
}
if ($maintenance_stats['outdated_os'] > 0) {
    echo '<div style="background: #f1f8e9; padding: 20px; border-radius: 10px;">
          <h4>💻 OS Upgrades</h4>
          <p>Update outdated Windows versions to maintain security compliance.</p>
          </div>';
}
if ($maintenance_stats['no_purchase_date'] > 0 || $maintenance_stats['no_manufacturer'] > 0) {
    echo '<div style="background: #f1f8e9; padding: 20px; border-radius: 10px;">
          <h4>📋 Complete Asset Data</h4>
          <p>Fill missing purchase and manufacturer info for better tracking.</p>
          </div>';
}
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

Html::footer();
