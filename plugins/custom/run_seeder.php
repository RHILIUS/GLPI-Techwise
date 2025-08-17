<?php
// Absolute path to GLPI root
define('GLPI_ROOT', realpath(__DIR__ . '/../../') . '/');

include(GLPI_ROOT . "inc/includes.php");

global $DB;

// Path to SQL file
$sqlFile = GLPI_ROOT . "install/mysql/glpi-seed.sql";

// Read file and split by semicolon
$sqlStatements = explode(";", file_get_contents($sqlFile));

foreach ($sqlStatements as $sql) {
    $sql = trim($sql);
    if (!empty($sql)) {
        try {
            $DB->query($sql);
        } catch (Exception $e) {
            echo "Error executing SQL: " . $e->getMessage() . "\n";
        }
    }
}

echo "Seeder executed!\n";
