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
 * ---------------------------------------------------------------------
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

// Define asset types to count
$asset_types = [
    'Computer' => ['label' => 'Computers', 'color' => '#FF6B6B'],
    'Monitor' => ['label' => 'Monitors', 'color' => '#4ECDC4'],
    'Printer' => ['label' => 'Printers', 'color' => '#45B7D1'],
    'NetworkEquipment' => ['label' => 'Network devices', 'color' => '#96CEB4'],
    'Phone' => ['label' => 'Phones', 'color' => '#FFEAA7'],
    'Software' => ['label' => 'Software', 'color' => '#DDA0DD'],
    'SoftwareLicense' => ['label' => 'Licenses', 'color' => '#98D8C8']
];

// Count each asset type
foreach ($asset_types as $class => $info) {
    if (class_exists($class)) {
        $item = new $class();
        $table = $item->getTable();
        
        $query = "SELECT COUNT(*) as count FROM `$table`";
        $conditions = [];
        
        // Add entity restriction if needed
        if ($item->isEntityAssign()) {
            $entities = $_SESSION['glpiactiveentities'] ?? [0];
            $conditions[] = "`entities_id` IN (" . implode(',', array_map('intval', $entities)) . ")";
        }
        
        // Add deleted restriction
        if ($item->maybeDeleted()) {
            $conditions[] = "`is_deleted` = 0";
        }
        
        if (!empty($conditions)) {
            $query .= " WHERE " . implode(' AND ', $conditions);
        }
        
        $result = $DB->query($query);
        if ($result && $row = $DB->fetchAssoc($result)) {
            $asset_counts[$class] = intval($row['count']);
            $total_assets += $asset_counts[$class];
        } else {
            $asset_counts[$class] = 0;
        }
    } else {
        $asset_counts[$class] = 0;
    }
}

// Calculate conic-gradient segments for pie chart
$segments = [];
$current_angle = 0;

foreach ($asset_types as $class => $info) {
    $count = $asset_counts[$class];
    if ($count > 0 && $total_assets > 0) {
        $percentage = ($count / $total_assets) * 100;
        $angle = ($percentage / 100) * 360;
        $end_angle = $current_angle + $angle;
        
        $segments[] = $info['color'] . ' ' . $current_angle . 'deg ' . $end_angle . 'deg';
        $current_angle = $end_angle;
    }
}

$gradient = empty($segments) ? '#ddd 0deg 360deg' : implode(', ', $segments);

// Add a pie chart section with real data
echo '<div style="position: fixed; top: 100px; right: 20px; width: 350px; background: white; border: 2px solid #007cba; border-radius: 10px; padding: 15px; box-shadow: 0 4px 20px rgba(0,0,0,0.15); z-index: 1000;">';
echo '<h3 style="margin: 0 0 15px 0; color: #007cba; text-align: center;">📊 Assets Pie Chart</h3>';

// Pie chart using real data
if ($total_assets > 0) {
    echo '<div style="width: 200px; height: 200px; border-radius: 50%; margin: 0 auto 15px; background: conic-gradient(' . $gradient . '); border: 3px solid white; box-shadow: 0 2px 10px rgba(0,0,0,0.1);"></div>';
} else {
    echo '<div style="width: 200px; height: 200px; border-radius: 50%; margin: 0 auto 15px; background: #f0f0f0; border: 3px solid white; box-shadow: 0 2px 10px rgba(0,0,0,0.1); display: flex; align-items: center; justify-content: center; color: #666; font-size: 14px;">No Data</div>';
}

// Legend with real data
foreach ($asset_types as $class => $info) {
    $count = $asset_counts[$class];
    if ($count > 0) {
        echo '<div style="display: flex; align-items: center; margin: 5px 0; font-size: 12px;">';
        echo '<div style="width: 12px; height: 12px; background: ' . $info['color'] . '; border-radius: 2px; margin-right: 8px;"></div>';
        echo '<span><strong>' . $info['label'] . ':</strong> ' . $count . '</span>';
        echo '</div>';
    }
}

if ($total_assets == 0) {
    echo '<div style="text-align: center; color: #666; font-style: italic; font-size: 12px;">No assets found in current entities</div>';
} else {
    echo '<div style="text-align: center; margin-top: 10px; font-size: 11px; color: #666;">Total: ' . $total_assets . ' assets</div>';
}

echo '<button onclick="this.parentElement.style.display=\'none\'" style="position: absolute; top: 5px; right: 5px; background: #dc3545; color: white; border: none; border-radius: 3px; width: 20px; height: 20px; font-size: 12px; cursor: pointer;">×</button>';
echo '</div>';

// Display the original dashboard
$grid = new Glpi\Dashboard\Grid($default);
$grid->showDefault();

Html::footer();
