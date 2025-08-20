use glpidb;

-- === COMPUTERS ===
INSERT INTO glpi_computers (
  entities_id,
  name,
  serial,
  otherserial,
  contact,
  contact_num,
  users_id_tech,
  groups_id_tech,
  comment,
  date_mod,
  autoupdatesystems_id,
  locations_id,
  networks_id,
  computermodels_id,
  computertypes_id,
  is_template,
  template_name,
  manufacturers_id,
  is_deleted,
  is_dynamic,
  users_id,
  groups_id,
  states_id,
  ticket_tco,
  uuid,
  date_creation,
  is_recursive,
  last_inventory_update,
  last_boot
) VALUES
(0, 'Workstation-01', 'SN-WKS-0001', 'ALT-WKS-01', 'John Doe', '555-1001', 2, 3, 'Office desktop', NOW(), 0, 1, 1, 1, 1, 0, NULL, 1, 0, 0, 4, 2, 1, 0.0000, UUID(), NOW(), 0, NOW(), NOW()),
(0, 'Workstation-02', 'SN-WKS-0002', 'ALT-WKS-02', 'Jane Smith', '555-1002', 2, 3, 'Office desktop', NOW(), 0, 1, 1, 1, 1, 0, NULL, 1, 0, 0, 4, 2, 1, 0.0000, UUID(), NOW(), 0, NOW(), NOW()),
(0, 'Laptop-01', 'SN-LTP-0001', 'ALT-LTP-01', 'Alice Johnson', '555-2001', 2, 3, 'Mobile laptop', NOW(), 0, 2, 2, 2, 2, 0, NULL, 2, 0, 0, 5, 3, 2, 0.0000, UUID(), NOW(), 0, NOW(), NOW()),
(0, 'Server-01', 'SN-SRV-0001', 'ALT-SRV-01', 'Bob Martin', '555-3001', 2, 3, 'Main server', NOW(), 0, 3, 3, 3, 3, 0, NULL, 3, 0, 0, 6, 4, 3, 0.0000, UUID(), NOW(), 0, NOW(), NOW()),
(0, 'Server-02', 'SN-SRV-0002', 'ALT-SRV-02', 'Clara Lee', '555-3002', 2, 3, 'Backup server', NOW(), 0, 3, 3, 3, 3, 0, NULL, 3, 0, 0, 6, 4, 3, 0.0000, UUID(), NOW(), 0, NOW(), NOW()),

(0, 'Laptop-02', 'SN-LTP-0002', 'ALT-LTP-02', 'David Brown', '555-2002', 2, 3, 'Mobile laptop', NOW(), 0, 2, 2, 2, 2, 0, NULL, 2, 0, 0, 5, 3, 2, 0.0000, UUID(), NOW(), 0, NOW(), NOW()),
(0, 'Workstation-03', 'SN-WKS-0003', 'ALT-WKS-03', 'Emily White', '555-1003', 2, 3, 'Office desktop', NOW(), 0, 1, 1, 1, 1, 0, NULL, 1, 0, 0, 4, 2, 1, 0.0000, UUID(), NOW(), 0, NOW(), NOW()),
(0, 'Server-03', 'SN-SRV-0003', 'ALT-SRV-03', 'Frank Green', '555-3003', 2, 3, 'Test server', NOW(), 0, 3, 3, 3, 3, 0, NULL, 3, 0, 0, 6, 4, 3, 0.0000, UUID(), NOW(), 0, NOW(), NOW()),
(0, 'Laptop-03', 'SN-LTP-0003', 'ALT-LTP-03', 'Grace Lee', '555-2003', 2, 3, 'Mobile laptop', NOW(), 0, 2, 2, 2, 2, 0, NULL, 2, 0, 0, 5, 3, 2, 0.0000, UUID(), NOW(), 0, NOW(), NOW());

-- === INFOCOMS (WARRANTY / PURCHASE DETAILS) ===
-- Link each computer to warranty info (expired, missing and outdated buy dates)
INSERT INTO glpi_infocoms (
  items_id,
  itemtype,
  entities_id,
  is_recursive,
  buy_date,
  use_date,
  warranty_duration,
  warranty_info,
  suppliers_id,
  order_number,
  delivery_number,
  immo_number,
  value,
  warranty_value,
  sink_time,
  sink_type,
  sink_coeff,
  comment,
  bill,
  budgets_id,
  alert,
  order_date,
  delivery_date,
  inventory_date,
  warranty_date,
  date_mod,
  date_creation,
  decommission_date,
  businesscriticities_id
) VALUES
(1, 'Computer', 0, 0, '2022-05-10', NULL, 12, NULL, 0, NULL, NULL, NULL, 1000.0000, 0.0000, 0, 0, 0, 'Warranty expired last year', NULL, 0, 0, NULL, NULL, NULL, '2023-05-10', NOW(), NOW(), NULL, 0),
(2, 'Computer', 0, 0, '2023-02-15', NULL, 12, NULL, 0, NULL, NULL, NULL, 1200.0000, 0.0000, 0, 0, 0, 'Warranty expired earlier this year', NULL, 0, 0, NULL, NULL, NULL, '2024-02-15', NOW(), NOW(), NULL, 0),
(3, 'Computer', 0, 0, '2024-01-01', NULL, 24, NULL, 0, NULL, NULL, NULL, 1500.0000, 0.0000, 0, 0, 0, 'Warranty still active', NULL, 0, 0, NULL, NULL, NULL, '2026-01-01', NOW(), NOW(), NULL, 0),
(4, 'Computer', 0, 0, '2021-08-30', NULL, 12, NULL, 0, NULL, NULL, NULL, 5000.0000, 0.0000, 0, 0, 0, 'Server warranty expired long ago', NULL, 0, 0, NULL, NULL, NULL, '2022-08-30', NOW(), NOW(), NULL, 0),
(5, 'Computer', 0, 0, '2023-06-01', NULL, 24, NULL, 0, NULL, NULL, NULL, 4500.0000, 0.0000, 0, 0, 0, 'Warranty expiring soon', NULL, 0, 0, NULL, NULL, NULL, '2025-06-01', NOW(), NOW(), NULL, 0),

-- Missing buy_date entries for testing
(6, 'Computer', 0, 0, NULL, NULL, 12, NULL, 0, NULL, NULL, NULL, 1100.0000, 0.0000, 0, 0, 0, 'Missing buy_date', NULL, 0, 0, NULL, NULL, NULL, '2023-09-15', NOW(), NOW(), NULL, 0),
(7, 'Computer', 0, 0, NULL, NULL, 12, NULL, 0, NULL, NULL, NULL, 1300.0000, 0.0000, 0, 0, 0, 'Invalid buy_date', NULL, 0, 0, NULL, NULL, NULL, '2023-10-20', NOW(), NOW(), NULL, 0),

-- Outdated buy_date entries (older than 5 years)
(8, 'Computer', 0, 0, '2015-04-12', NULL, 12, NULL, 0, NULL, NULL, NULL, 900.0000, 0.0000, 0, 0, 0, 'Very old computer', NULL, 0, 0, NULL, NULL, NULL, '2016-04-12', NOW(), NOW(), NULL, 0),
(9, 'Computer', 0, 0, '2014-11-23', NULL, 12, NULL, 0, NULL, NULL, NULL, 850.0000, 0.0000, 0, 0, 0, 'Outdated asset', NULL, 0, 0, NULL, NULL, NULL, '2015-11-23', NOW(), NOW(), NULL, 0);

-- === COMPUTER MODELS ===
INSERT INTO glpi_computermodels (name, comment, date_mod)
VALUES
  ('OptiPlex 7090', 'Dell desktop', NOW()),
  ('EliteBook 850', 'HP laptop', NOW()),
  ('ThinkPad X1', 'Lenovo laptop', NOW()),
  ('MacBook Pro 16', 'Apple laptop', NOW());

-- === COMPUTER TYPES ===
INSERT INTO glpi_computertypes (name, comment, date_mod)
VALUES
  ('Desktop', 'Standard desktop computer', NOW()),
  ('Laptop', 'Portable computer', NOW()),
  ('Server', 'Rack or tower server', NOW());

-- === STATES ===
INSERT INTO glpi_states (
  name, entities_id, is_recursive, comment, states_id, completename, level,
  ancestors_cache, sons_cache,
  is_visible_computer, is_visible_monitor, is_visible_networkequipment, is_visible_peripheral,
  is_visible_phone, is_visible_printer, is_visible_softwareversion, is_visible_softwarelicense,
  is_visible_line, is_visible_certificate, is_visible_rack, is_visible_passivedcequipment,
  is_visible_enclosure, is_visible_pdu, is_visible_cluster, is_visible_contract,
  is_visible_appliance, is_visible_databaseinstance, is_visible_cable, is_visible_unmanaged,
  date_mod, date_creation
) VALUES
  ('In Use', 0, 0, 'Currently assigned and operational', 0, 'In Use', 1, '', '',
   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
   1, 1, 1, 1, 1, 1, 1, 1,
   NOW(), NOW()),

  ('In Stock', 0, 0, 'Available in storage', 0, 'In Stock', 1, '', '',
   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
   1, 1, 1, 1, 1, 1, 1, 1,
   NOW(), NOW()),

  ('Retired', 0, 0, 'Decommissioned or retired asset', 0, 'Retired', 1, '', '',
   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
   1, 1, 1, 1, 1, 1, 1, 1,
   NOW(), NOW());

-- === LOCATIONS ===
INSERT INTO glpi_locations (
  entities_id, is_recursive, name, locations_id, completename, comment,
  level, ancestors_cache, sons_cache,
  address, postcode, town, state, country, building, room,
  latitude, longitude, altitude, date_mod, date_creation
)
VALUES
(0, 1, 'Server Room', 0, 'Server Room', 'Main server room', 1, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()),
(0, 1, 'IT Office', 0, 'IT Office', 'Primary IT office', 1, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()),
(0, 1, 'Branch Office', 0, 'Branch Office', 'Remote branch office', 1, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW());

-- Update computers to set model, type, status, location
UPDATE glpi_computers SET computermodels_id=1, computertypes_id=1, states_id=1, locations_id=1 WHERE id=1;
UPDATE glpi_computers SET computermodels_id=1, computertypes_id=1, states_id=1, locations_id=2 WHERE id=2;
UPDATE glpi_computers SET computermodels_id=2, computertypes_id=2, states_id=1, locations_id=2 WHERE id=3;
UPDATE glpi_computers SET computermodels_id=3, computertypes_id=2, states_id=1, locations_id=3 WHERE id=4;
UPDATE glpi_computers SET computermodels_id=3, computertypes_id=3, states_id=1, locations_id=1 WHERE id=5;
UPDATE glpi_computers SET computermodels_id=2, computertypes_id=2, states_id=2, locations_id=2 WHERE id=6;
UPDATE glpi_computers SET computermodels_id=1, computertypes_id=1, states_id=2, locations_id=1 WHERE id=7;
UPDATE glpi_computers SET computermodels_id=4, computertypes_id=2, states_id=3, locations_id=3 WHERE id=8;
UPDATE glpi_computers SET computermodels_id=4, computertypes_id=2, states_id=3, locations_id=3 WHERE id=9;

-- Add processor models
INSERT INTO glpi_deviceprocessormodels (name) VALUES
  ('Intel Core i7-11700'), ('Intel Xeon E5-2620'), ('Apple M1');

-- Add processors
INSERT INTO glpi_deviceprocessors (designation, deviceprocessormodels_id, manufacturers_id, entities_id)
VALUES
  ('Intel Core i7-11700', 1, 1, 0),
  ('Intel Xeon E5-2620', 2, 1, 0),
  ('Apple M1', 3, 4, 0);

-- Link processors to computers
INSERT INTO glpi_items_deviceprocessors (items_id, itemtype, deviceprocessors_id, entities_id, nbcores, nbthreads)
VALUES
  (1, 'Computer', 1, 0, 8, 16),
  (2, 'Computer', 1, 0, 8, 16),
  (3, 'Computer', 1, 0, 8, 16),
  (4, 'Computer', 2, 0, 12, 24),
  (5, 'Computer', 2, 0, 12, 24),
  (6, 'Computer', 1, 0, 8, 16),
  (7, 'Computer', 1, 0, 8, 16),
  (8, 'Computer', 3, 0, 8, 8),
  (9, 'Computer', 3, 0, 8, 8);

-- Add memory models
INSERT INTO glpi_devicememorymodels (name) VALUES ('Kingston 16GB DDR4');

-- Add memory modules
INSERT INTO glpi_devicememories (designation, size_default, devicememorymodels_id, manufacturers_id, entities_id)
VALUES ('16GB DDR4 RAM', 16384, 1, 1, 0);

-- Link memory to computers
INSERT INTO glpi_items_devicememories (items_id, itemtype, devicememories_id, size, entities_id)
VALUES
  (1, 'Computer', 1, 16384, 0),
  (2, 'Computer', 1, 16384, 0),
  (3, 'Computer', 1, 16384, 0),
  (4, 'Computer', 1, 16384, 0),
  (5, 'Computer', 1, 16384, 0),
  (6, 'Computer', 1, 16384, 0),
  (7, 'Computer', 1, 16384, 0),
  (8, 'Computer', 1, 16384, 0),
  (9, 'Computer', 1, 16384, 0);

-- === MANUFACTURERS TEST DATA ===
INSERT INTO glpi_manufacturers (
  id,
  name,
  comment,
  date_mod
) VALUES
(1, 'Dell', 'Leading PC manufacturer', NOW()),
(2, 'HP', 'Hewlett-Packard', NOW()),
(3, 'Lenovo', 'Popular laptop brand', NOW()),
(4, 'Apple', 'Premium Apple devices', NOW()),
(5, 'Asus', 'Known for motherboards and laptops', NOW()),
(6, 'Acer', 'Budget-friendly computers', NOW()),
(7, 'Microsoft', 'Surface devices and software', NOW());

-- === OPERATING SYSTEMS ===
INSERT INTO glpi_operatingsystems (name) VALUES
('Windows XP'),
('Windows 7'),
('Windows 10'),
('Windows 11');

-- === LINK COMPUTERS TO OS ===
-- Assume the first inserted computer IDs are 1, 2, 3, 4, 5
-- Map outdated OS to some computers
INSERT INTO glpi_items_operatingsystems (items_id, itemtype, operatingsystems_id)
SELECT c.id, 'Computer', os.id
FROM glpi_computers c
JOIN glpi_operatingsystems os ON
  (c.name = 'Workstation-01' AND os.name = 'Windows XP') OR
  (c.name = 'Workstation-02' AND os.name = 'Windows 7') OR
  (c.name = 'Laptop-01' AND os.name = 'Windows 10') OR
  (c.name = 'Server-01' AND os.name = 'Windows 11') OR
  (c.name = 'Server-02' AND os.name = 'Windows 7') OR
  (c.name = 'Laptop-02' AND os.name = 'Windows 10') OR
  (c.name = 'Workstation-03' AND os.name = 'Windows 7') OR
  (c.name = 'Server-03' AND os.name = 'Windows 11') OR
  (c.name = 'Laptop-03' AND os.name = 'Windows 10');

-- === MONITORS ===
INSERT INTO glpi_monitors (
  entities_id,
  name,
  date_mod,
  contact,
  contact_num,
  users_id_tech,
  groups_id_tech,
  comment,
  serial,
  otherserial,
  size,
  have_micro,
  have_speaker,
  have_subd,
  have_bnc,
  have_dvi,
  have_pivot,
  have_hdmi,
  have_displayport,
  locations_id,
  monitortypes_id,
  monitormodels_id,
  manufacturers_id,
  is_global,
  is_deleted,
  is_template,
  template_name,
  users_id,
  groups_id,
  states_id,
  ticket_tco,
  is_dynamic,
  autoupdatesystems_id,
  uuid,
  date_creation,
  is_recursive,
  -- 🚀 New columns
  resolution,
  refresh_rate,
  aspect_ratio
) VALUES
(0, 'Monitor-01', NOW(), 'John Doe', '555-4001', 2, 3, 'Main monitor in office',
 'MON-SN-0001', 'MON-ALT-01', 24.00, 0, 1, 1, 0, 1, 0, 1, 1, 1,
 1, 1, 1, 0, 0, 0, NULL, 4, 2, 1, 0.0000, 0, 0, UUID(), NOW(), 0,
 -- new values
 '1920x1080', 60, '16:9'),

(0, 'Monitor-02', NOW(), 'Jane Smith', '555-4002', 2, 3, 'Spare monitor',
 'MON-SN-0002', 'MON-ALT-02', 22.00, 0, 0, 1, 0, 1, 0, 0, 1, 1,
 1, 1, 1, 0, 0, 0, NULL, 5, 3, 2, 0.0000, 0, 0, UUID(), NOW(), 0,
 -- new values
 '2560x1440', 75, '16:9'),

(0, 'Monitor-03', NOW(), 'Alice Johnson', '555-4003', 2, 3, 'Meeting room display',
 'MON-SN-0003', 'MON-ALT-03', 27.00, 1, 1, 1, 0, 1, 1, 1, 1, 2,
 2, 2, 2, 0, 0, 0, NULL, 6, 4, 3, 0.0000, 0, 0, UUID(), NOW(), 0,
 -- new values
 '3840x2160', 120, '16:9');

-- === MONITOR TYPES ===
INSERT INTO glpi_monitortypes (name, comment, date_mod, date_creation)
VALUES
  ('LCD', 'Standard LCD monitor', NOW(), NOW()),
  ('LED', 'LED-backlit monitor', NOW(), NOW()),
  ('OLED', 'OLED monitor', NOW(), NOW()),
  ('Curved', 'Curved widescreen monitor', NOW(), NOW()),
  ('Touchscreen', 'Interactive touch display', NOW(), NOW());

-- === MONITOR MODELS ===
INSERT INTO glpi_monitormodels (name, comment, date_mod, date_creation)
VALUES
  ('Dell P2419H', '24-inch LED monitor', NOW(), NOW()),
  ('HP EliteDisplay E243', '23.8-inch LED monitor', NOW(), NOW()),
  ('Lenovo ThinkVision T24i', '24-inch IPS LED monitor', NOW(), NOW()),
  ('Samsung Odyssey G7', '27-inch curved QHD gaming monitor', NOW(), NOW()),
  ('LG UltraFine 5K', '27-inch 5K IPS monitor', NOW(), NOW()),
  ('ASUS ProArt PA32UCX', '32-inch HDR professional OLED monitor', NOW(), NOW());

-- === SOFTWARE PRODUCTS ===
INSERT INTO glpi_softwares (id, entities_id, name, is_recursive, comment, date_mod, date_creation, manufacturers_id)
VALUES
  (1, 0, 'Microsoft Office', 1, 'Office productivity suite', NOW(), NOW(), 1),
  (2, 0, 'Adobe Photoshop', 1, 'Image editing software', NOW(), NOW(), 2),
  (3, 0, 'Visual Studio Code', 1, 'Source code editor', NOW(), NOW(), 3),
  (4, 0, 'Google Chrome', 1, 'Web browser', NOW(), NOW(), 4),
  (5, 0, 'Mozilla Firefox', 1, 'Web browser', NOW(), NOW(), 5);

-- === SOFTWARE VERSIONS ===
INSERT INTO glpi_softwareversions (id, softwares_id, name, comment, date_mod, date_creation, operatingsystems_id)
VALUES
  (1, 1, 'Office 2019', 'Perpetual license edition', NOW(), NOW(), 1),
  (2, 1, 'Office 365', 'Subscription-based edition', NOW(), NOW(), 1),

  (3, 2, 'Photoshop 2023', 'Creative Cloud edition', NOW(), NOW(), 2),
  (4, 2, 'Photoshop 2021', 'Older version', NOW(), NOW(), 2),

  (5, 3, 'VS Code 1.85', 'Latest stable build', NOW(), NOW(), 3),
  (6, 3, 'VS Code 1.70', 'Older build', NOW(), NOW(), 3),

  (7, 4, 'Chrome 120', 'Latest stable release', NOW(), NOW(), 4),
  (8, 4, 'Chrome 110', 'Older release', NOW(), NOW(), 4),

  (9, 5, 'Firefox 115 ESR', 'Extended Support Release', NOW(), NOW(), 2),
  (10, 5, 'Firefox 100', 'Older version', NOW(), NOW(), 3);

-- === SOFTWARE LICENSE TYPES ===
INSERT INTO glpi_softwarelicensetypes (name, date_creation, date_mod, entities_id, is_recursive)
VALUES
  ('Volume License', NOW(), NOW(), 0, 1),
  ('Subscription', NOW(), NOW(), 0, 1),
  ('Free / Open Source', NOW(), NOW(), 0, 1);

-- === SOFTWARE LICENSES SEEDER ===
INSERT INTO glpi_softwarelicenses (
  id,
  softwares_id,
  softwarelicenses_id,
  completename,
  level,
  ancestors_cache,
  sons_cache,
  entities_id,
  is_recursive,
  number,
  softwarelicensetypes_id,
  name,
  serial,
  otherserial,               -- Inventory/Asset Number
  softwareversions_id_buy,
  softwareversions_id_use,
  expire,
  comment,
  date_mod,
  is_valid,
  date_creation,
  is_deleted,
  locations_id,
  users_id_tech,
  users_id,
  groups_id_tech,
  groups_id,
  is_helpdesk_visible,
  is_template,
  template_name,
  states_id,
  manufacturers_id,
  contact,
  contact_num,
  allow_overquota,
  pictures
) VALUES
-- Office
(1, 1, 0, 'Office 2021 Volume License', 0, NULL, NULL, 0, 1, 50, 1,
 'Office 2021 Volume License',
 'XXXXX-XXXXX-XXXXX-XXXXX', 'INV-OFF-001', -- otherserial = Inventory Number
 0, 0, NULL,
 'Volume licensing for Office',
 NOW(), 1, NOW(), 0,
 1, 0, 0, 0, 0, 1, 0, NULL,
 0, 0, 'Microsoft', 'support@microsoft.com', 0, NULL),

-- Adobe Photoshop
(2, 2, 0, 'Adobe Photoshop CC License', 0, NULL, NULL, 0, 1, 25, 1,
 'Adobe Photoshop CC License',
 'ADOBE-1234-5678-9876', 'INV-ADOBE-002',
 0, 0, '2025-12-31',
 'Creative Cloud subscription',
 NOW(), 1, NOW(), 0,
 1, 0, 0, 0, 0, 1, 0, NULL,
 0, 0, 'Adobe', 'support@adobe.com', 0, NULL),

-- VS Code
(3, 3, 0, 'VS Code Free License', 0, NULL, NULL, 0, 1, 30, 1,
 'VS Code Free License',
 NULL, 'INV-VSC-003',
 0, 0, NULL,
 'Open-source MIT license',
 NOW(), 1, NOW(), 0,
 1, 0, 0, 0, 0, 1, 0, NULL,
 0, 0, 'Microsoft', 'opensource@microsoft.com', 0, NULL),

-- Google Chrome
(4, 4, 0, 'Google Chrome Free License', 0, NULL, NULL, 0, 1, 51, 1,
 'Google Chrome Free License',
 NULL, 'INV-GC-004',
 0, 0, NULL,
 'Free software',
 NOW(), 1, NOW(), 0,
 1, 0, 0, 0, 0, 1, 0, NULL,
 0, 0, 'Google', 'support@google.com', 0, NULL),

-- Mozilla Firefox
(5, 5, 0, 'Mozilla Firefox Free License', 0, NULL, NULL, 0, 1, 65, 1,
 'Mozilla Firefox Free License',
 NULL, 'INV-FF-005',
 0, 0, NULL,
 'Free software',
 NOW(), 1, NOW(), 0,
 1, 0, 0, 0, 0, 1, 0, NULL,
 0, 0, 'Mozilla', 'support@mozilla.org', 0, NULL);


INSERT INTO glpi_items_softwareversions (
   items_id,          -- the computer id
   itemtype,          -- must be 'Computer'
   softwareversions_id,
   is_deleted,
   entities_id,
   is_dynamic
) VALUES
-- Workstations
(1, 'Computer', 1, 0, 0, 0),  -- Workstation-01 has Office 2019
(1, 'Computer', 7, 0, 0, 0),  -- Workstation-01 has Chrome 120
(2, 'Computer', 2, 0, 0, 0),  -- Workstation-02 has Office 365
(2, 'Computer', 9, 0, 0, 0),  -- Workstation-02 has Firefox 115 ESR
(7, 'Computer', 1, 0, 0, 0),  -- Workstation-03 has Office 2019
(7, 'Computer', 10, 0, 0, 0), -- Workstation-03 has Firefox 100
-- Laptops
(3, 'Computer', 5, 0, 0, 0),  -- Laptop-01 has VS Code 1.85
(3, 'Computer', 7, 0, 0, 0),  -- Laptop-01 has Chrome 120
(6, 'Computer', 6, 0, 0, 0),  -- Laptop-02 has VS Code 1.70
(6, 'Computer', 8, 0, 0, 0),  -- Laptop-02 has Chrome 110
(9, 'Computer', 5, 0, 0, 0),  -- Laptop-03 has VS Code 1.85
(9, 'Computer', 9, 0, 0, 0),  -- Laptop-03 has Firefox 115 ESR
-- Servers
(4, 'Computer', 3, 0, 0, 0),  -- Server-01 has Photoshop 2023
(4, 'Computer', 7, 0, 0, 0),  -- Server-01 has Chrome 120
(5, 'Computer', 4, 0, 0, 0),  -- Server-02 has Photoshop 2021
(5, 'Computer', 10, 0, 0, 0), -- Server-02 has Firefox 100
(8, 'Computer', 3, 0, 0, 0),  -- Server-03 has Photoshop 2023
(8, 'Computer', 9, 0, 0, 0);  -- Server-03 has Firefox 115 ESR

-- === NETWORK EQUIPMENT TYPES ===
INSERT INTO glpi_networkequipmenttypes (name, comment, date_mod, date_creation)
VALUES
  ('Switch', 'Layer 2/3 network switch', NOW(), NOW()),
  ('Router', 'Routing device', NOW(), NOW()),
  ('Firewall', 'Security firewall device', NOW(), NOW()),
  ('Access Point', 'Wireless AP device', NOW(), NOW()),
  ('Load Balancer', 'Traffic distribution device', NOW(), NOW());

-- === NETWORK EQUIPMENT MODELS ===
INSERT INTO glpi_networkequipmentmodels (name, comment, date_mod, date_creation)
VALUES
  ('Cisco Catalyst 2960', 'Cisco Layer 2 switch', NOW(), NOW()),
  ('Cisco Catalyst 9300', 'Cisco enterprise switch', NOW(), NOW()),
  ('Juniper MX480', 'Juniper router model', NOW(), NOW()),
  ('Fortinet FortiGate 100E', 'UTM firewall', NOW(), NOW()),
  ('MikroTik hAP ac2', 'Wireless router/AP', NOW(), NOW()),
  ('Ubiquiti UniFi AP AC Pro', 'Enterprise wireless AP', NOW(), NOW()),
  ('F5 BIG-IP i2600', 'Application delivery controller / load balancer', NOW(), NOW());

-- === NETWORK EQUIPMENT ===
INSERT INTO glpi_networkequipments (
  entities_id,
  is_recursive,
  name,
  ram,
  serial,
  otherserial,
  contact,
  contact_num,
  users_id_tech,
  groups_id_tech,
  date_mod,
  comment,
  locations_id,
  networks_id,
  networkequipmenttypes_id,
  networkequipmentmodels_id,
  manufacturers_id,
  is_deleted,
  is_template,
  template_name,
  users_id,
  groups_id,
  states_id,
  ticket_tco,
  is_dynamic,
  uuid,
  date_creation,
  autoupdatesystems_id,
  sysdescr,
  cpu,
  uptime,
  last_inventory_update,
  snmpcredentials_id
) VALUES
-- Switch-01
(0, 0, 'Switch-01', 512, 'SW-0001', 'ALT-SW-01', 'Mark Reyes', '555-5001', 2, 3, NOW(), 'Core network switch in server room', 1, 1, 1, 1, 1, 0, 0, NULL, 4, 2, 1, 0.0000, 0, UUID(), NOW(), 0, 'Cisco Catalyst 2960 Series', 2, '15 days', NOW(), 0),

-- Router-01
(0, 0, 'Router-01', 256, 'RT-0001', 'ALT-RT-01', 'Ana Cruz', '555-5002', 2, 3, NOW(), 'Main router for WAN connection', 2, 1, 2, 2, 2, 0, 0, NULL, 5, 2, 1, 0.0000, 0, UUID(), NOW(), 0, 'MikroTik RB4011', 4, '30 days', NOW(), 0),

-- Firewall-01
(0, 0, 'Firewall-01', 1024, 'FW-0001', 'ALT-FW-01', 'Leo Santos', '555-5003', 2, 3, NOW(), 'Firewall for external traffic', 3, 1, 3, 3, 3, 0, 0, NULL, 6, 2, 1, 0.0000, 0, UUID(), NOW(), 0, 'pfSense running on custom appliance', 2, '45 days', NOW(), 0);

INSERT INTO glpi_devicefirmwares (
  designation, comment, manufacturers_id, version, devicefirmwaretypes_id, entities_id, date_creation
) VALUES
('Cisco IOS', 'Catalyst 2960 firmware', 1, '15.0(2)SE11', 1, 0, NOW()),
('RouterOS', 'Firmware for MikroTik routers', 2, 'v7.12', 1, 0, NOW()),
('pfSense Plus', 'Firewall firmware', 3, '23.05', 1, 0, NOW());

INSERT INTO glpi_items_devicefirmwares (
  items_id, itemtype, devicefirmwares_id, entities_id
) VALUES
(1, 'NetworkEquipment', 1, 0), -- Switch-01 with Cisco IOS 15.0(2)SE11
(2, 'NetworkEquipment', 2, 0), -- Router-01 with RouterOS v7.12
(3, 'NetworkEquipment', 3, 0); -- Firewall-01 with pfSense Plus 23.05

-- Types
INSERT INTO glpi_peripheraltypes (name, date_mod)
VALUES
('Barcode Scanner', NOW()),
('Webcam', NOW()),
('External HDD', NOW());

-- Models
INSERT INTO glpi_peripheralmodels (name, date_mod)
VALUES
('Zebra DS2208', NOW()),       -- Barcode Scanner model
('Logitech C920', NOW()),      -- Webcam model
('Seagate Backup Plus', NOW()); -- External HDD model

-- Peripherals
INSERT INTO glpi_peripherals (
  entities_id, name, date_mod, contact, contact_num,
  users_id_tech, groups_id_tech, comment, serial, otherserial,
  locations_id, peripheraltypes_id, peripheralmodels_id, brand, manufacturers_id,
  is_global, is_deleted, is_template, template_name, users_id,
  groups_id, states_id, ticket_tco, is_dynamic, autoupdatesystems_id,
  uuid, date_creation, is_recursive
) VALUES
-- Barcode Scanner
(0, 'Barcode Scanner', NOW(), 'Tech Support', '09171234567',
 0, 0, 'Used at reception', 'BS-123456', 'ALT-BS-987654',
 1, 1, 1, 'Zebra', 1,
 0, 0, 0, NULL, 0,
 0, 1, 0.0000, 0, 0,
 UUID(), NOW(), 0),

-- Webcam
(0, 'Webcam', NOW(), 'Tech Support', '09171234567',
 0, 0, 'Mounted on desktop', 'WC-223344', 'ALT-WC-554433',
 1, 2, 2, 'Logitech', 2,
 0, 0, 0, NULL, 0,
 0, 1, 0.0000, 0, 0,
 UUID(), NOW(), 0),

-- External HDD
(0, 'External HDD', NOW(), 'Tech Support', '09171234567',
 0, 0, 'Used for backups', 'EHDD-778899', 'ALT-EHDD-998877',
 1, 3, 3, 'Seagate', 3,
 0, 0, 0, NULL, 0,
 0, 1, 0.0000, 0, 0,
 UUID(), NOW(), 0);

-- === PRINTER TYPES ===
INSERT INTO glpi_printertypes (name, date_mod, date_creation)
VALUES
('Laser Printer', NOW(), NOW()),
('Inkjet Printer', NOW(), NOW());

-- === PRINTER MODELS ===
INSERT INTO glpi_printermodels (name, date_mod, date_creation)
VALUES
('HP LaserJet 400', NOW(), NOW()),
('Brother HL-L2350DW', NOW(), NOW());

-- === PRINTERS ===
INSERT INTO glpi_printers (
  entities_id, is_recursive, name, date_mod, printertypes_id, printermodels_id, manufacturers_id, locations_id, states_id
) VALUES
(0, 0, 'HP LaserJet 400 - Front Office', NOW(), 1, 1, 1, 1, 1),
(0, 0, 'Brother HL-L2350DW - Conference Room', NOW(), 2, 2, 2, 2, 1);

-- === CARTRIDGE ITEM TYPES ===
INSERT INTO glpi_cartridgeitemtypes (name, date_mod, date_creation)
VALUES
('Black Ink Cartridge', NOW(), NOW()),
('Color Ink Cartridge', NOW(), NOW());

-- === CARTRIDGE ITEMS ===
INSERT INTO glpi_cartridgeitems (
  entities_id, is_recursive, name, ref, locations_id, cartridgeitemtypes_id, 
  manufacturers_id, users_id_tech, groups_id_tech, is_deleted, comment, 
  alarm_threshold, stock_target, date_mod, date_creation, pictures
) VALUES
(0, 0, 'Black Ink', 'B-INK-01', 1, 1, 1, 0, 0, 0, 'Standard black ink cartridge', 10, 50, NOW(), NOW(), NULL),
(0, 0, 'Color Ink', 'C-INK-01', 2, 2, 2, 0, 0, 0, 'Standard color ink cartridge', 10, 30, NOW(), NOW(), NULL);

-- === LINK CARTRIDGES TO PRINTER MODELS ===
INSERT INTO glpi_cartridgeitems_printermodels (cartridgeitems_id, printermodels_id)
VALUES
(1, 1),  -- Black Ink → HP LaserJet 400
(2, 2);  -- Color Ink → Brother HL-L2350DW

-- === CARTRIDGES USAGE ===
INSERT INTO glpi_cartridges (
  entities_id, cartridgeitems_id, printers_id,
  date_in, date_use, date_out, pages,
  date_mod, date_creation
) VALUES
(0, 1, 1, '2025-08-01', '2025-08-02', NULL, 500, NOW(), NOW()),  -- Black Ink in HP LaserJet 400
(0, 2, 2, '2025-08-03', '2025-08-04', NULL, 300, NOW(), NOW()); -- Color Ink in Brother HL-L2350DW

-- === CONSUMABLE ITEM TYPES ===
INSERT INTO glpi_consumableitemtypes (name, date_mod, date_creation)
VALUES
('Paper', NOW(), NOW()),
('Staples', NOW(), NOW());

-- === CONSUMABLE ITEMS ===
INSERT INTO glpi_consumableitems (
  entities_id, is_recursive, name, ref, locations_id, consumableitemtypes_id,
  manufacturers_id, users_id_tech, groups_id_tech, is_deleted, comment,
  alarm_threshold, stock_target, date_mod, date_creation, otherserial, pictures
) VALUES
(0, 0, 'A4 Paper Pack', 'PAPER-A4', 1, 1, 1, 0, 0, 0, 'A4 size printing paper', 10, 100, NOW(), NOW(), 'SN-PAPER-001', NULL),
(0, 0, 'Staples Box', 'STAPLES-01', 2, 2, 2, 0, 0, 0, 'Standard office staples', 10, 50, NOW(), NOW(), 'SN-STAPLE-001', NULL);

-- === CONSUMABLES USAGE ===
INSERT INTO glpi_consumables (
  entities_id, consumableitems_id,
  date_in, date_out, itemtype, items_id, date_mod, date_creation
) VALUES
(0, 1, '2025-08-01', NULL, NULL, 0, NOW(), NOW()),  -- Paper
(0, 2, '2025-08-02', NULL, NULL, 0, NOW(), NOW());  -- Staples

-- === PHONETYPES ===
INSERT INTO glpi_phonetypes (name, date_mod, date_creation)
VALUES
('IP Phone', NOW(), NOW()),
('VoIP Phone', NOW(), NOW());

-- === PHONEMODELS ===
INSERT INTO glpi_phonemodels (name, product_number, date_mod, date_creation)
VALUES
('Cisco 8841', 'CISCO-8841', NOW(), NOW()),
('Polycom VVX 450', 'POLY-VVX450', NOW(), NOW());

-- === PHONES ===
INSERT INTO glpi_phones (
  entities_id, name, date_mod, contact, contact_num,
  users_id_tech, groups_id_tech, comment, serial, otherserial,
  locations_id, phonetypes_id, phonemodels_id, brand, phonepowersupplies_id,
  number_line, have_headset, have_hp, manufacturers_id, is_global,
  is_deleted, is_template, template_name, users_id, groups_id,
  states_id, ticket_tco, is_dynamic, autoupdatesystems_id, uuid,
  date_creation, is_recursive, last_inventory_update
) VALUES
(
  0, 'Cisco IP Phone 8841', NOW(), 'John Doe', '1234567890',
  0, 0, 'Used in reception area', 'CISCO-8841-SN001', 'CISCO-8841-OSN001',
  1, 1, 1, 'Cisco', 0,
  '101', 1, 0, 1, 0,
  0, 0, NULL, 0, 0,
  1, 0.0000, 0, 0, 'uuid-cisco-001',
  NOW(), 0, NOW()
),
(
  0, 'Polycom VVX 450', NOW(), 'Jane Smith', '9876543210',
  0, 0, 'Used in conference room', 'POLY-VVX450-SN002', 'POLY-VVX450-OSN002',
  2, 2, 2, 'Polycom', 0,
  '102', 0, 1, 2, 0,
  0, 0, NULL, 0, 0,
  1, 0.0000, 0, 0, 'uuid-polycom-002',
  NOW(), 0, NOW()
);

INSERT INTO glpi_rackmodels (name, comment, date_mod, date_creation)
VALUES
('42U Server Rack', 'Standard 42-unit rack', NOW(), NOW()),
('48U Backup Rack', 'Standard 48-unit backup rack', NOW(), NOW());

INSERT INTO glpi_racktypes (name, comment, date_mod, date_creation)
VALUES
('Server Rack', 'Used for servers', NOW(), NOW()),
('Networking Rack', 'Used for network equipment', NOW(), NOW());

INSERT INTO glpi_dcrooms (name, locations_id, date_mod, date_creation)
VALUES
('Main Server Room', 1, NOW(), NOW()),
('Backup Room', 2, NOW(), NOW());

-- === RACKS ===
INSERT INTO glpi_racks (
  name, comment, entities_id, is_recursive, locations_id,
  serial, otherserial, rackmodels_id, manufacturers_id, racktypes_id,
  states_id, users_id_tech, groups_id_tech, width, height,
  depth, number_units, is_template, template_name, is_deleted,
  dcrooms_id, room_orientation, position, bgcolor, max_power,
  mesured_power, max_weight, date_mod, date_creation
) VALUES
(
  'Rack-01', 'Main server room rack', 0, 0, 1,
  'RACK-SN-001', 'RACK-OSN-001', 1, 1, 1,
  1, 0, 0, 600, 42,
  1000, 42, 0, NULL, 0,
  1, 0, 'A1', '#FFFFFF', 10000,
  5000, 800, NOW(), NOW()
),
(
  'Rack-02', 'Backup room rack', 0, 0, 2,
  'RACK-SN-002', 'RACK-OSN-002', 2, 2, 1,
  1, 0, 0, 600, 48,
  1200, 48, 0, NULL, 0,
  2, 1, 'B2', '#EEEEEE', 12000,
  6500, 1000, NOW(), NOW()
);

INSERT INTO glpi_enclosuremodels (name, comment, date_mod, date_creation)
VALUES
('Dell M1000e', 'Dell Blade Enclosure Model', NOW(), NOW()),
('HP BladeSystem c7000', 'HP Blade Enclosure Model', NOW(), NOW());

-- === ENCLOSURES ===
INSERT INTO glpi_enclosures (
  name, entities_id, is_recursive, locations_id,
  serial, otherserial, enclosuremodels_id, users_id_tech,
  groups_id_tech, is_template, template_name, is_deleted,
  orientation, power_supplies, states_id, comment,
  manufacturers_id, date_mod, date_creation
) VALUES
(
  'Enclosure-01', 0, 0, 0,
  'ENC-SN-001', 'ENC-OSN-001', 1, 0,
  0, 0, NULL, 0,
  0, 2, 0, 'Primary enclosure for compute blades',
  1, NOW(), NOW()
),
(
  'Enclosure-02', 0, 0, 0,
  'ENC-SN-002', 'ENC-OSN-002', 2, 0,
  0, 0, NULL, 0,
  1, 1, 0, 'Secondary enclosure in rack B2',
  2, NOW(), NOW()
);

INSERT INTO glpi_pdutypes (name, comment, date_mod, date_creation)
VALUES
('Basic PDU', 'Standard power distribution unit', NOW(), NOW()),
('Switched PDU', 'Remotely managed PDU', NOW(), NOW());

INSERT INTO glpi_pdumodels (name, comment, date_mod, date_creation)
VALUES
('APC AP7921', 'APC Basic Rack PDU', NOW(), NOW()),
('CyberPower PDU81005', 'CyberPower Switched PDU', NOW(), NOW());

-- === PDUS ===
INSERT INTO glpi_pdus (
  name, entities_id, is_recursive, locations_id,
  serial, otherserial, pdumodels_id, users_id_tech,
  groups_id_tech, is_template, template_name, is_deleted,
  states_id, comment, manufacturers_id, pdutypes_id,
  date_mod, date_creation
) VALUES
(
  'PDU-01', 0, 0, 0,
  'PDU-SN-001', 'PDU-OSN-001', 1, 0,
  0, 0, NULL, 0,
  0, 'Primary PDU for Rack A1', 1, 1,
  NOW(), NOW()
),
(
  'PDU-02', 0, 0, 0,
  'PDU-SN-002', 'PDU-OSN-002', 2, 0,
  0, 0, NULL, 0,
  0, 'Backup PDU unit', 2, 2,
  NOW(), NOW()
);

INSERT INTO glpi_passivedcequipmentmodels (name, comment, date_mod, date_creation)
VALUES
('PP24', '24-port copper patch panel', NOW(), NOW()),
('FPP12', '12-port fiber patch panel', NOW(), NOW());

-- === PASSIVE DC EQUIPMENT ===
INSERT INTO glpi_passivedcequipments (
  name, entities_id, is_recursive, locations_id,
  serial, otherserial, passivedcequipmentmodels_id, passivedcequipmenttypes_id,
  users_id_tech, groups_id_tech, is_template, template_name,
  is_deleted, states_id, comment, manufacturers_id,
  date_mod, date_creation
) VALUES
(
  'Patch Panel 24p', 0, 0, 0,
  'PP24-SN-001', 'PP24-OSN-001', 1, 1,
  0, 0, 0, NULL,
  0, 0, 'Standard copper patch panel', 1,
  NOW(), NOW()
),
(
  'Fiber Patch Panel', 0, 0, 0,
  'FPP-SN-001', 'FPP-OSN-001', 2, 2,
  0, 0, 0, NULL,
  0, 0, '12-port fiber patch panel', 2,
  NOW(), NOW()
);

-- === UNMANAGED ASSETS ===
INSERT INTO glpi_unmanageds (
  entities_id, is_recursive, name,
  serial, otherserial, contact, contact_num,
  date_mod, comment, locations_id, networks_id,
  manufacturers_id, is_deleted, users_id, groups_id,
  states_id, users_id_tech, groups_id_tech, is_dynamic,
  date_creation, autoupdatesystems_id, sysdescr,
  agents_id, itemtype, accepted, hub, ip,
  snmpcredentials_id, last_inventory_update
) VALUES
(
  0, 0, 'Unknown Device 1',
  'UD1-SN-001', 'UD1-OSN-001', 'Technician A', '09171234567',
  NOW(), 'First unknown device in the network.', 1, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  NOW(), 0, 'Unidentified network hardware.',
  0, NULL, 0, 0, '192.168.1.201',
  0, NOW()
),
(
  0, 0, 'Unknown Device 2',
  'UD2-SN-002', 'UD2-OSN-002', 'Technician B', '09179876543',
  NOW(), 'Second unidentified asset.', 2, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  NOW(), 0, 'Possibly a switch or bridge.',
  0, NULL, 0, 0, '192.168.1.202',
  0, NOW()
);

-- =========================
-- === CABLE TYPES ===
-- =========================
INSERT INTO glpi_cabletypes (name, comment, date_mod, date_creation)
VALUES
('Ethernet', 'Cat5/Cat6 copper cables', NOW(), NOW()),
('Fiber Optic', 'Single-mode or multi-mode fiber cables', NOW(), NOW());

-- =========================
-- === CABLE STRANDS ===
-- =========================
INSERT INTO glpi_cablestrands (name)
VALUES
('Strand A'), ('Strand B');

-- =========================
-- === SOCKETS ===
-- =========================
INSERT INTO glpi_sockets (name, locations_id)
VALUES
('Wall Jack 1A', 1),
('Patch Panel Port 1', 2),
('Wall Jack 2B', 2),
('Patch Panel Port 2', 4);

-- =========================
-- === CABLES ===
-- =========================
INSERT INTO glpi_cables (
  name, entities_id, is_recursive,
  itemtype_endpoint_a, itemtype_endpoint_b,
  items_id_endpoint_a, items_id_endpoint_b,
  sockets_id_endpoint_a, sockets_id_endpoint_b,
  cabletypes_id, comment, date_mod, date_creation, color, users_id_tech, otherserial, states_id
) VALUES
(
  'Cat6 Patch Cable', 0, 0,
  'Computer', 'Computer',
  1, 2,   -- Associated Items (A: Computer id 1, B: Patch Panel id 2)
  1, 2,   -- Sockets (A: Socket id 1, B: Socket id 2)
  1, 'Standard Cat6 patch cable for office use.', NOW(), NOW(), 'Blue', 5, 'CABLE-001', 2
);

-- === ITEMS DEVICES SIMCARDS ===
INSERT INTO glpi_items_devicesimcards (
  items_id, itemtype, devicesimcards_id, is_deleted, is_dynamic,
  entities_id, is_recursive, serial, otherserial, states_id,
  locations_id, lines_id, users_id, groups_id,
  pin, pin2, puk, puk2, msin, comment
) VALUES
(1, 'Computer', 1, 0, 0, 0, 0, 'SIM123456789', 'ALT987654321', 1, 1, 1, 1, 1, '1234', '4321', '11111111', '22222222', 'MSIN001', 'Assigned to work laptop'),

(2, 'Phone', 2, 0, 0, 0, 0, 'SIM223456789', 'ALT887654321', 2, 2, 2, 2, 2, '5678', '8765', '33333333', '44444444', 'MSIN002', 'Assigned to field agent'),

(3, 'Tablet', 3, 0, 0, 0, 0, 'SIM323456789', 'ALT777654321', 1, 3, 3, 3, 3, '9999', '0000', '55555555', '66666666', 'MSIN003', 'Used for remote access');

-- =========================
-- === GLPI ITIL CATEGORIES SEEDER ===
-- =========================

INSERT INTO glpi_itilcategories (
  entities_id, is_recursive, itilcategories_id, name, completename, comment, level,
  knowbaseitemcategories_id, users_id, groups_id, code, ancestors_cache, sons_cache,
  is_helpdeskvisible, tickettemplates_id_incident, tickettemplates_id_demand,
  changetemplates_id, problemtemplates_id, is_incident, is_request, is_problem,
  is_change, date_mod, date_creation
)
VALUES
-- Printing Category
(0, 0, 1, 'Printing', 'Printing', NULL, 0,
 0, 0, 0, NULL, NULL, NULL,
 1, 0, 0,
 0, 0, 1, 1, 1,
 1, NULL, NOW()
),
-- Networking Category
(0, 0, 2, 'Networking', 'Networking', NULL, 0,
 0, 0, 0, NULL, NULL, NULL,
 1, 0, 0,
 0, 0, 1, 1, 1,
 1, NULL, NOW()
),
-- Power Category
(0, 0, 3, 'Power', 'Power', NULL, 0,
 0, 0, 0, NULL, NULL, NULL,
 1, 0, 0,
 0, 0, 1, 1, 1,
 1, NULL, NOW()
);

-- =========================
-- === GLPI TICKETS SEEDER WITH ALL STATUSES ===
-- =========================

INSERT INTO glpi_tickets (
  entities_id, name, date, closedate, solvedate,
  users_id_lastupdater, users_id_recipient, requesttypes_id, content,
  urgency, impact, priority, itilcategories_id, time_to_resolve, date_mod, status
)
VALUES
-- Incoming Ticket (New)
(0, 'Printer jam', NOW(), NULL, NULL,
 6, 6, 1, 'User reports printer jammed on floor 2.',
 2, 2, 2, 1, DATE_ADD(NOW(), INTERVAL 2 HOUR), NOW(), 1
),
-- Pending Ticket
(0, 'Cannot print', NOW(), NULL, NULL,
 4, 4, 1, 'User cannot print from workstation.',
 2, 2, 2, 1, DATE_ADD(NOW(), INTERVAL 2 HOUR), NOW(), 1
),
-- Assigned Ticket
(0, 'Network down', NOW(), NULL, NULL,
 3, 3, 2, 'Entire office is offline. No internet connectivity.',
 3, 3, 3, 2, DATE_ADD(NOW(), INTERVAL 4 HOUR), NOW(), 2
),
-- Planned Ticket
(0, 'Software install', DATE_ADD(NOW(), INTERVAL 1 DAY), NULL, NULL,
 4, 2, 1, 'Request to install licensed Photoshop.',
 1, 1, 1, 1, DATE_ADD(NOW(), INTERVAL 3 HOUR), NOW(), 3
),
-- Solved Ticket
(0, 'Email not syncing', NOW(), NULL, NOW(),
 5, 5, 1, 'Mailbox was not syncing properly.',
 2, 2, 2, 2, DATE_ADD(NOW(), INTERVAL 2 HOUR), NOW(), 4
),
-- Closed Ticket
(0, 'VPN access request', NOW(), NOW(), NOW(),
 3, 3, 1, 'User requested VPN access.',
 1, 1, 1, 3, DATE_ADD(NOW(), INTERVAL 30 MINUTE), NOW(), 5
),
-- Late Ticket
(0, 'Server OS upgrade', DATE_SUB(NOW(), INTERVAL 1 DAY), NULL, NULL,
 4, 2, 2, 'Scheduled OS upgrade for server (late).',
 3, 3, 3, 2, DATE_ADD(DATE_SUB(NOW(), INTERVAL 1 DAY), INTERVAL 4 HOUR), NOW(), 6
);

-- === ASSIGN REQUESTERS TO TICKETS (for UI display) ===
INSERT INTO glpi_tickets_users (tickets_id, users_id, type, use_notification)
VALUES
(1, 4, 1, 1), -- Ticket 1, Requester: tech-1 (users_id=4)
(2, 3, 1, 1), -- Ticket 2, Requester: post-only-1 (users_id=3)
(3, 2, 1, 1), -- Ticket 3, Requester: glpi-1 (users_id=2)
(4, 5, 1, 1), -- Ticket 4, Requester: normal-1 (users_id=5)
(5, 3, 1, 1), -- Ticket 5, Requester: post-only-1 (users_id=3)
(6, 2, 1, 1), -- Ticket 6, Requester: glpi-1 (users_id=2)
(7, 5, 1, 1); -- Ticket 7, Requester: normal-1 (users_id=5)

-- === ASSIGN USERS TO TICKETS ===
INSERT INTO glpi_tickets_users (tickets_id, users_id, type, use_notification)
VALUES
(1, 3, 2, 1), -- Technician assigned to 'Cannot print'
(2, 4, 2, 1),
(3, 5, 2, 1),
(4, 6, 2, 1),
(5, 7, 2, 1),
(6, 8, 2, 1),
(7, 9, 2, 1);

-- === LINK TICKETS (RELATED TICKETS) ===
INSERT INTO glpi_tickets_tickets (tickets_id_1, tickets_id_2, link)
VALUES
(1, 2, 1), -- Cannot print is related to Network down
(3, 5, 2); -- Software install linked to VPN access

-- === TICKET SATISFACTION ===
INSERT INTO glpi_ticketsatisfactions (tickets_id, type, date_begin, date_answered, satisfaction, comment)
VALUES
(4, 1, NOW(), NOW(), 5, 'User happy with resolution.'),
(5, 1, NOW(), NOW(), 4, 'VPN access provided successfully.');

-- === TICKET TASKS ===
INSERT INTO glpi_tickettasks (uuid, tickets_id, taskcategories_id, date, users_id, users_id_editor, content, is_private, actiontime, state, users_id_tech, groups_id_tech, date_mod, date_creation)
VALUES
('task-001', 1, 1, NOW(), 2, 2, 'Check printer connection and drivers.', 0, 30, 1, 3, 0, NOW(), NOW()),
('task-002', 2, 2, NOW(), 4, 4, 'Restart network switch and check cables.', 0, 60, 1, 5, 0, NOW(), NOW()),
('task-003', 3, 1, NOW(), 3, 3, 'Install Photoshop on user workstation.', 0, 120, 1, 5, 0, NOW(), NOW()),
('task-004', 4, 3, NOW(), 6, 6, 'Check mailbox sync and server logs.', 0, 45, 2, 7, 0, NOW(), NOW());

-- =========================
-- === PROBLEMS ===
-- =========================
INSERT INTO glpi_problems (
  name,
  entities_id,
  is_recursive,
  is_deleted,
  status,
  content,
  date_mod,
  date,
  solvedate,
  closedate,
  time_to_resolve,
  users_id_recipient,
  users_id_lastupdater,
  urgency,
  impact,
  priority,
  itilcategories_id, -- Category
  impactcontent,
  causecontent,
  symptomcontent,
  actiontime,
  begin_waiting_date,
  waiting_duration,
  close_delay_stat,
  solve_delay_stat,
  date_creation,
  locations_id
) VALUES
-- Problem 1
(
  'Recurring printer jam',
  0,
  0,
  0,
  1, -- New
  'Printer in the admin office jams frequently after printing more than 5 pages.',
  NOW(),
  NOW(),
  NULL,
  NULL,
  DATE_ADD(NOW(), INTERVAL 4 HOUR), -- Time to resolve
  2, -- Requester
  3, -- Technician
  2, -- Urgency
  2, -- Impact
  2, -- Priority
  1, -- Category (Printing)
  'Affects printing operations for administrative staff.',
  'Possible worn-out roller or sensor failure.',
  'Pages get stuck mid-print.',
  0,
  NULL,
  0,
  0,
  0,
  NOW(),
  1
),
-- Problem 2
(
  'Intermittent network outage',
  0,
  0,
  0,
  2, -- Assigned/In Progress
  'Network drops multiple times a day in the west wing. Users report disconnections.',
  NOW(),
  NOW(),
  NULL,
  NULL,
  DATE_ADD(NOW(), INTERVAL 6 HOUR), -- Time to resolve
  4, -- Requester
  5, -- Technician
  3, -- Urgency
  3, -- Impact
  3, -- Priority
  2, -- Category (Networking)
  'Affects entire west wing productivity.',
  'Suspected faulty switch or power fluctuation.',
  'Users randomly lose connection for 2–3 minutes.',
  0,
  NULL,
  0,
  0,
  0,
  NOW(),
  2
);

-- =========================
-- === CHANGES ===
-- =========================
INSERT INTO glpi_changes (
  name,
  entities_id,
  is_recursive,
  is_deleted,
  status,
  content,
  date_mod,
  date,
  solvedate,
  closedate,
  time_to_resolve,
  users_id_recipient,
  users_id_lastupdater,
  urgency,
  impact,
  priority,
  itilcategories_id, -- Category
  impactcontent,
  controlistcontent,
  rolloutplancontent,
  backoutplancontent,
  checklistcontent,
  global_validation,
  validation_percent,
  actiontime,
  begin_waiting_date,
  waiting_duration,
  close_delay_stat,
  solve_delay_stat,
  date_creation,
  locations_id
) VALUES
-- Change 1: Upgrade Switch Firmware
(
  'Upgrade Switch Firmware',
  0,
  0,
  0,
  1, -- New
  'Upgrade firmware on all core network switches to latest stable version to fix known bugs and security issues.',
  NOW(),
  NOW(),
  NULL,
  NULL,
  DATE_ADD(NOW(), INTERVAL 6 HOUR), -- Time to resolve
  2, -- Requester
  3, -- Technician
  2, -- Urgency
  3, -- Impact
  3, -- Priority
  1, -- Category (Networking)
  'Network availability may be temporarily affected during reboot.',
  'Verify backup configuration and network redundancy.',
  'Schedule upgrade during low-traffic hours and notify staff.',
  'If upgrade fails, revert to previous firmware from backup.',
  '✔ Backup taken\n✔ Maintenance window approved\n✔ Notification sent',
  1, -- Global validation
  100, -- Validation percent
  0,
  NULL,
  0,
  0,
  0,
  NOW(),
  1
),
-- Change 2: Replace UPS
(
  'Replace UPS',
  0,
  0,
  0,
  1, -- Assigned/In Progress
  'Replace the outdated UPS in the server room to ensure continuous power backup and prevent equipment damage.',
  NOW(),
  NOW(),
  NULL,
  NULL,
  DATE_ADD(NOW(), INTERVAL 8 HOUR), -- Time to resolve
  4, -- Requester
  5, -- Technician
  3, -- Urgency
  2, -- Impact
  3, -- Priority
  2, -- Category (Power)
  'Unplanned power loss can cause data corruption and hardware failure.',
  'Ensure compatible replacement, notify IT and facilities team.',
  'Install new UPS with downtime coordination.',
  'Retain old UPS in case replacement fails.',
  '✔ Power tested\n✔ Old unit decommissioned\n✔ Logs updated',
  2, -- Global validation
  50, -- Validation percent
  0,
  NULL,
  0,
  0,
  0,
  NOW(),
  2
);

-- =========================
-- === RECURRING TICKETS ===
-- =========================

INSERT INTO glpi_ticketrecurrents (
  name,
  comment,
  entities_id,
  is_recursive,
  is_active,
  tickettemplates_id,
  begin_date,
  periodicity,
  create_before,
  next_creation_date,
  calendars_id,
  end_date
) VALUES
-- Monthly Backup Check
(
  'Monthly Backup Check',
  'Verify all backup systems and logs are functional.',
  0,
  0,
  1,
  1,  -- references Template 1
  '2025-08-01 08:00:00',
  '1 MONTH',
  2,
  '2025-09-01 08:00:00',
  0,
  NULL
),
-- Quarterly Patch
(
  'Quarterly Patch',
  'Install OS and software patches on all production servers.',
  0,
  0,
  1,
  1,  -- references Template 1
  '2025-07-01 09:00:00',
  '3 MONTH',
  5,
  '2025-10-01 09:00:00',
  0,
  NULL
);

-- === RECURRING CHANGES ===
INSERT INTO glpi_recurrentchanges (
  name,
  comment,
  entities_id,
  is_recursive,
  is_active,
  changetemplates_id,
  begin_date,
  periodicity,
  create_before,
  next_creation_date,
  calendars_id,
  end_date
) VALUES
(
  'Annual License Renewal',                             -- name
  'Renew all software licenses for compliance.',        -- comment
  0,                                                    -- entities_id
  0,                                                    -- is_recursive
  1,                                                    -- is_active
  0,                                                    -- changetemplates_id (none linked)
  '2025-01-01 10:00:00',                                -- begin_date
  '1 YEAR',                                             -- periodicity
  14,                                                   -- create_before (days before due date)
  '2026-01-01 10:00:00',                                -- next_creation_date
  0,                                                    -- calendars_id
  NULL                                                  -- end_date
);

-- === BUDGET TYPES ===
INSERT INTO glpi_budgettypes (
  name,
  comment,
  date_mod,
  date_creation
) VALUES
('IT Budget', 'Budget for IT operations', NOW(), NOW()),
('Hardware Budget', 'Budget for hardware purchases', NOW(), NOW()),
('Software Budget', 'Budget for software licenses', NOW(), NOW());

-- === BUDGETS ===
INSERT INTO glpi_budgets (
  name,
  entities_id,
  is_recursive,
  comment,
  is_deleted,
  begin_date,
  end_date,
  value,
  is_template,
  template_name,
  date_mod,
  date_creation,
  locations_id,
  budgettypes_id
) VALUES
(
  'IT Budget 2025',
  0,
  0,
  'Budget for IT operations in 2025.',
  0,
  '2025-01-01',
  '2025-12-31',
  10000.0000,
  0,
  NULL,
  NOW(),
  NOW(),
  1,    -- Location ID
  1     -- IT Budget
),
(
  'Hardware Budget',
  0,
  0,
  'Allocated for hardware upgrades.',
  0,
  '2025-01-01',
  '2025-06-30',
  5000.0000,
  0,
  NULL,
  NOW(),
  NOW(),
  2,    -- Location ID
  2     -- Hardware Budget
);

-- === SUPPLIER TYPES ===
INSERT INTO glpi_suppliertypes (
  name,
  comment,
  date_mod,
  date_creation
) VALUES
('IT Equipment Supplier', 'Suppliers for IT hardware and peripherals.', NOW(), NOW()),
('Office Supplies Supplier', 'Suppliers for office stationery and furniture.', NOW(), NOW()),
('Software Vendor', 'Suppliers for software licenses and subscriptions.', NOW(), NOW());

-- === SUPPLIERS ===
INSERT INTO glpi_suppliers (
  entities_id,
  is_recursive,
  name,
  suppliertypes_id,
  registration_number,
  address,
  postcode,
  town,
  state,
  country,
  website,
  phonenumber,
  comment,
  is_deleted,
  fax,
  email,
  date_mod,
  date_creation,
  is_active,
  pictures
) VALUES
(
  0,                          -- entities_id
  0,                          -- is_recursive
  'Tech Supplies Inc.',       -- name
  1,                          -- suppliertypes_id
  'TSI-2025-001',             -- registration_number
  '123 Tech Park, Block A',   -- address
  '1001',                     -- postcode
  'Metro City',               -- town
  'Metro State',              -- state
  'Philippines',              -- country
  'https://www.techsupplies.example', -- website
  '+63 912 345 6789',         -- phonenumber
  'Primary IT supplier.',     -- comment
  0,                          -- is_deleted
  '+63 912 345 6790',         -- fax
  'contact@techsupplies.example', -- email
  NOW(),                      -- date_mod
  NOW(),                      -- date_creation
  1,                          -- is_active
  NULL                        -- pictures
),
(
  0,                          -- entities_id
  0,                          -- is_recursive
  'Office Depot',             -- name
  2,                          -- suppliertypes_id
  'ODP-2025-002',             -- registration_number
  '456 Office Ave, Unit B',   -- address
  '2002',                     -- postcode
  'Business Town',            -- town
  'Capital Region',           -- state
  'Philippines',              -- country
  'https://www.officedepot.example', -- website
  '+63 933 456 7890',         -- phonenumber
  'Provides office supplies and furniture.', -- comment
  0,                          -- is_deleted
  '+63 933 456 7891',         -- fax
  'sales@officedepot.example',-- email
  NOW(),                      -- date_mod
  NOW(),                      -- date_creation
  1,                          -- is_active
  NULL                        -- pictures
);

-- === CONTACT TYPES ===
INSERT INTO glpi_contacttypes (
  name,
  comment,
  date_mod,
  date_creation
) VALUES
('IT', 'IT-related contacts', NOW(), NOW()),
('Procurement', 'Procurement and finance contacts', NOW(), NOW()),
('HR', 'Human Resources contacts', NOW(), NOW());

-- === USER TITLES ===
INSERT INTO glpi_usertitles (
  name,
  comment,
  date_mod,
  date_creation
) VALUES
('Manager', 'Manager title', NOW(), NOW()),
('Officer', 'Officer title', NOW(), NOW()),
('Staff', 'Staff title', NOW(), NOW());

-- === CONTACTS ===
INSERT INTO glpi_contacts (
  entities_id,
  is_recursive,
  name,
  firstname,
  registration_number,
  phone,
  phone2,
  mobile,
  fax,
  email,
  contacttypes_id,
  comment,
  is_deleted,
  usertitles_id,
  address,
  postcode,
  town,
  state,
  country,
  date_mod,
  date_creation,
  pictures
) VALUES
(
  0,                          -- entities_id
  0,                          -- is_recursive
  'John Doe',                 -- name
  'John',                     -- firstname
  'JD-2025-001',              -- registration_number
  '+63 900 123 4567',         -- phone
  '+63 900 765 4321',         -- phone2
  '+63 917 111 2233',         -- mobile
  '+63 900 123 0000',         -- fax
  'john@example.com',         -- email
  1,                          -- contacttypes_id
  'IT Manager contact.',      -- comment
  0,                          -- is_deleted
  1,                          -- usertitles_id
  '123 Corporate Street',     -- address
  '1200',                     -- postcode
  'Metro City',               -- town
  'Metro State',              -- state
  'Philippines',              -- country
  NOW(),                      -- date_mod
  NOW(),                      -- date_creation
  NULL                        -- pictures
),
(
  0,                          -- entities_id
  0,                          -- is_recursive
  'Jane Smith',               -- name
  'Jane',                     -- firstname
  'JS-2025-002',              -- registration_number
  '+63 933 222 3333',         -- phone
  '+63 933 444 5555',         -- phone2
  '+63 918 222 3344',         -- mobile
  '+63 933 222 0000',         -- fax
  'jane@example.com',         -- email
  2,                          -- contacttypes_id
  'Procurement Officer contact.', -- comment
  0,                          -- is_deleted
  2,                          -- usertitles_id
  '456 Business Avenue',      -- address
  '1300',                     -- postcode
  'Business Town',            -- town
  'Capital Region',           -- state
  'Philippines',              -- country
  NOW(),                      -- date_mod
  NOW(),                      -- date_creation
  NULL                        -- pictures
);

-- === CONTRACT TYPES ===
INSERT INTO glpi_contracttypes (
  name,
  comment,
  date_mod,
  date_creation
) VALUES
('Lease', 'Equipment lease contract', NOW(), NOW()),
('Support', 'IT support contract', NOW(), NOW()),
('Maintenance', 'Maintenance contract', NOW(), NOW());

-- ====================================
-- == INSERT SEED DATA: ContractCosts ==
-- ====================================
INSERT INTO `glpi_contractcosts` (
  contracts_id,
  name,
  comment,
  begin_date,
  end_date,
  cost,
  budgets_id,
  entities_id,
  is_recursive
) VALUES
-- Cost entry for Printer Lease contract
(
  1,  -- contracts_id (Printer Lease from glpi_contracts)
  'Printer Lease Annual Fee',
  'Annual lease payment for printers in 2025',
  '2025-01-01',
  '2025-12-31',
  1200.00,
  1,   -- budgets_id
  0,
  0
),
-- Cost entry for Support Agreement contract
(
  2,  -- contracts_id (Support Agreement from glpi_contracts)
  'IT Support Service Fee',
  'Yearly support service cost for 2025–2026',
  '2025-02-01',
  '2026-01-31',
  5000.00,
  2,   -- budgets_id
  0,
  0
);

-- === CONTRACTS ===
INSERT INTO glpi_contracts (
  entities_id,
  is_recursive,
  name,
  num,
  contracttypes_id,
  locations_id,
  begin_date,
  duration,
  notice,
  periodicity,
  billing,
  comment,
  accounting_number,
  is_deleted,
  week_begin_hour,
  week_end_hour,
  saturday_begin_hour,
  saturday_end_hour,
  use_saturday,
  sunday_begin_hour,
  sunday_end_hour,
  use_sunday,
  max_links_allowed,
  alert,
  renewal,
  template_name,
  is_template,
  states_id,
  date_mod,
  date_creation
) VALUES
(
  0, 0,
  'Printer Lease', 'PL-2025-001', 1, 1,
  '2025-01-01', 12, 1, 0, 1,
  'Annual printer lease contract for 2025.', 'ACCT-PL001',
  0,
  '08:00:00', '17:00:00', '09:00:00', '12:00:00', 1,
  '00:00:00', '00:00:00', 0,
  5, 1, 1, NULL, 0, 1, NOW(), NOW()
),
(
  0, 0,
  'Support Agreement', 'SA-2025-002', 2, 2,
  '2025-02-01', 24, 2, 0, 1,
  'IT support services for 2 years.', 'ACCT-SA002',
  0,
  '09:00:00', '18:00:00', '00:00:00', '00:00:00', 0,
  '00:00:00', '00:00:00', 0,
  10, 1, 1, NULL, 0, 2, NOW(), NOW()
);

-- =============================
-- === SEED DOCUMENT CATEGORIES
-- =============================
INSERT INTO glpi_documentcategories (id, name, comment, documentcategories_id, completename, level, date_creation, date_mod)
VALUES
-- Root Categories (parent = 0)
(1, 'Manuals', 'User and technical manuals', 0, 'Manuals', 1, NOW(), NOW()),
(2, 'Diagrams', 'Network and architecture diagrams', 0, 'Diagrams', 1, NOW(), NOW()),
(3, 'Reports', 'Incident and activity reports', 0, 'Reports', 1, NOW(), NOW()),
(4, 'Policies', 'Company and IT policies', 0, 'Policies', 1, NOW(), NOW()),
(5, 'Contracts', 'Service and vendor contracts', 0, 'Contracts', 1, NOW(), NOW()),

-- Subcategories for Manuals
(6, 'User Manuals', 'End-user guides', 1, 'Manuals > User Manuals', 2, NOW(), NOW()),
(7, 'Technical Manuals', 'Admin and technical setup guides', 1, 'Manuals > Technical Manuals', 2, NOW(), NOW()),

-- Subcategories for Diagrams
(8, 'Network Diagrams', 'LAN/WAN diagrams', 2, 'Diagrams > Network Diagrams', 2, NOW(), NOW()),
(9, 'System Architecture', 'Application and server architecture diagrams', 2, 'Diagrams > System Architecture', 2, NOW(), NOW()),

-- Subcategories for Reports
(10, 'Incident Reports', 'Security and issue reports', 3, 'Reports > Incident Reports', 2, NOW(), NOW()),
(11, 'Activity Reports', 'Monthly or weekly activity logs', 3, 'Reports > Activity Reports', 2, NOW(), NOW()),

-- Subcategories for Policies
(12, 'IT Policies', 'Policies related to IT use', 4, 'Policies > IT Policies', 2, NOW(), NOW()),
(13, 'HR Policies', 'Employee and HR related policies', 4, 'Policies > HR Policies', 2, NOW(), NOW()),

-- Subcategories for Contracts
(14, 'Vendor Contracts', 'Contracts with vendors', 5, 'Contracts > Vendor Contracts', 2, NOW(), NOW()),
(15, 'Service Agreements', 'Service level agreements (SLAs)', 5, 'Contracts > Service Agreements', 2, NOW(), NOW());

-- ==================
-- == DOCUMENTS SEED
-- ==================
INSERT INTO glpi_documents (
  entities_id,
  is_recursive,
  name,
  filename,
  filepath,
  documentcategories_id,
  mime,
  date_mod,
  comment,
  is_deleted,
  link,
  users_id,
  tickets_id,
  sha1sum,
  is_blacklisted,
  tag,
  date_creation
) VALUES
(
  0, 0,
  'User Guide',
  'user_guide.pdf',
  '/files/user_guide.pdf',
  1,  -- documentcategories_id → Manuals
  'application/pdf',
  NOW(),
  'Comprehensive user manual.',
  0,
  'https://docs.example.com/user_guide',
  1,
  0,
  NULL,
  0,
  'manual',
  NOW()
),
(
  0, 0,
  'Network Diagram',
  'network_diagram.png',
  '/files/network_diagram.png',
  2,  -- documentcategories_id → Diagrams
  'image/png',
  NOW(),
  'Logical and physical network layout.',
  0,
  'https://docs.example.com/network_diagram',
  2,
  0,
  NULL,
  0,
  'diagram',
  NOW()
);

-- === DOCUMENT RELATIONS (linking documents to items, e.g. Computer or Ticket) ===
INSERT INTO glpi_documents_items (documents_id, items_id, itemtype, entities_id, is_recursive, date_mod, users_id, timeline_position, date_creation, date)
VALUES
(1, 1, 'Computer', 0, 0, NOW(), 1, 0, NOW(), NOW()),   -- Link User Guide PDF to Computer ID 1
(2, 2, 'Ticket',   0, 0, NOW(), 2, 0, NOW(), NOW());   -- Link Network Diagram PNG to Ticket ID 2

-- === LINES ===
INSERT INTO glpi_lines (
  name,
  entities_id,
  is_recursive,
  is_deleted,
  caller_num,
  caller_name,
  users_id,
  groups_id,
  lineoperators_id,
  locations_id,
  states_id,
  linetypes_id,
  date_creation,
  date_mod,
  comment
) VALUES
(
  'Main Line',      -- name
  0,                -- entities_id
  0,                -- is_recursive
  0,                -- is_deleted
  '09171234567',    -- caller_num
  'John Doe',       -- caller_name
  1,                -- users_id
  1,                -- groups_id
  1,                -- lineoperators_id
  1,                -- locations_id
  1,                -- states_id
  1,                -- linetypes_id
  NOW(),            -- date_creation
  NOW(),            -- date_mod
  'Primary business line'  -- comment
),
(
  'Backup Line',    -- name
  0,                -- entities_id
  0,                -- is_recursive
  0,                -- is_deleted
  '09179876543',    -- caller_num
  'Jane Smith',     -- caller_name
  2,                -- users_id
  2,                -- groups_id
  2,                -- lineoperators_id
  2,                -- locations_id
  2,                -- states_id
  2,                -- linetypes_id
  NOW(),            -- date_creation
  NOW(),            -- date_mod
  'Backup emergency line'  -- comment
);

-- === CERTIFICATES ===
INSERT INTO glpi_certificates (
  name,
  serial,
  otherserial,
  entities_id,
  is_recursive,
  comment,
  is_deleted,
  is_template,
  template_name,
  certificatetypes_id,
  dns_name,
  dns_suffix,
  users_id_tech,
  groups_id_tech,
  locations_id,
  manufacturers_id,
  contact,
  contact_num,
  users_id,
  groups_id,
  is_autosign,
  date_expiration,
  states_id,
  command,
  certificate_request,
  certificate_item,
  date_creation,
  date_mod
) VALUES
(
  'Wildcard SSL',      -- name
  'ABC123456789',      -- serial
  'XYZ987654321',      -- otherserial
  0,                   -- entities_id
  0,                   -- is_recursive
  'Wildcard SSL for all subdomains', -- comment
  0,                   -- is_deleted
  0,                   -- is_template
  NULL,                -- template_name
  1,                   -- certificatetypes_id
  '*.example.com',     -- dns_name
  'example.com',       -- dns_suffix
  1,                   -- users_id_tech
  1,                   -- groups_id_tech
  1,                   -- locations_id
  1,                   -- manufacturers_id
  'IT Admin',          -- contact
  '+639171234567',     -- contact_num
  1,                   -- users_id
  1,                   -- groups_id
  0,                   -- is_autosign
  '2026-12-31',        -- date_expiration
  1,                   -- states_id
  'openssl genrsa -out wildcard.key 2048', -- command
  '-----BEGIN CERTIFICATE REQUEST-----\n...', -- certificate_request
  '-----BEGIN CERTIFICATE-----\n...', -- certificate_item
  NOW(),                -- date_creation
  NOW()                 -- date_mod
),
(
  'VPN Cert',          -- name
  'DEF987654321',      -- serial
  'LMN123456789',      -- otherserial
  0,                   -- entities_id
  0,                   -- is_recursive
  'VPN client certificate', -- comment
  0,                   -- is_deleted
  0,                   -- is_template
  NULL,                -- template_name
  2,                   -- certificatetypes_id
  'vpn.example.com',   -- dns_name
  'example.com',       -- dns_suffix
  2,                   -- users_id_tech
  2,                   -- groups_id_tech
  2,                   -- locations_id
  2,                   -- manufacturers_id
  'Network Admin',     -- contact
  '+639199876543',     -- contact_num
  2,                   -- users_id
  2,                   -- groups_id
  0,                   -- is_autosign
  '2025-12-31',        -- date_expiration
  2,                   -- states_id
  'openssl genrsa -out vpn.key 2048', -- command
  '-----BEGIN CERTIFICATE REQUEST-----\n...', -- certificate_request
  '-----BEGIN CERTIFICATE-----\n...', -- certificate_item
  NOW(),                -- date_creation
  NOW()                 -- date_mod
);

-- === DATA CENTERS ===
INSERT INTO glpi_datacenters (
  name,
  entities_id,
  is_recursive,
  locations_id,
  is_deleted,
  date_mod,
  date_creation,
  pictures
) VALUES
(
  'Main DC',         -- name
  0,                 -- entities_id
  0,                 -- is_recursive
  1,                 -- locations_id
  0,                 -- is_deleted
  NOW(),             -- date_mod
  NOW(),             -- date_creation
  NULL               -- pictures
),
(
  'Backup DC',       -- name
  0,                 -- entities_id
  0,                 -- is_recursive
  2,                 -- locations_id
  0,                 -- is_deleted
  NOW(),             -- date_mod
  NOW(),             -- date_creation
  NULL               -- pictures
);

-- === CLUSTERS ===
INSERT INTO glpi_clusters (
  entities_id,
  is_recursive,
  name,
  uuid,
  version,
  users_id_tech,
  groups_id_tech,
  is_deleted,
  states_id,
  comment,
  clustertypes_id,
  autoupdatesystems_id,
  date_mod,
  date_creation
) VALUES
(
  0,                  -- entities_id
  0,                  -- is_recursive
  'VM Cluster 1',     -- name
  UUID(),             -- uuid (generates a random UUID)
  'vSphere 7.0',      -- version
  0,                  -- users_id_tech
  0,                  -- groups_id_tech
  0,                  -- is_deleted
  1,                  -- states_id
  'Main virtualization cluster.', -- comment
  1,                  -- clustertypes_id
  1,                  -- autoupdatesystems_id
  NOW(),              -- date_mod
  NOW()               -- date_creation
),
(
  0,                  -- entities_id
  0,                  -- is_recursive
  'DB Cluster',       -- name
  UUID(),             -- uuid
  'PostgreSQL 14',    -- version
  0,                  -- users_id_tech
  0,                  -- groups_id_tech
  0,                  -- is_deleted
  2,                  -- states_id
  'Cluster for database high availability.', -- comment
  2,                  -- clustertypes_id
  2,                  -- autoupdatesystems_id
  NOW(),              -- date_mod
  NOW()               -- date_creation
);

-- === DOMAIN TYPES SEEDER ===
INSERT INTO glpi_domaintypes (
  name,
  entities_id,
  is_recursive,
  comment
) VALUES
(
  'Public Domain',   -- id = 1
  0,                 -- entities_id
  0,                 -- is_recursive
  'Internet-facing domains (e.g., example.com)'
),
(
  'Internal Domain', -- id = 2
  0,
  0,
  'Internal/Private domains (e.g., corp.local, AD domains)'
),
(
  'Test Domain',     -- id = 3
  0,
  0,
  'Domains used for testing or staging environments'
),
(
  'Service Domain',  -- id = 4
  0,
  0,
  'Domains tied to specific services or sub-brands'
);

-- === DOMAINS UPDATED ===
INSERT INTO glpi_domains (
  name,
  entities_id,
  is_recursive,
  domaintypes_id,
  date_expiration,
  date_domaincreation,
  users_id_tech,
  groups_id_tech,
  is_deleted,
  comment,
  is_template,
  template_name,
  is_active,
  date_mod,
  date_creation
) VALUES
(
  'example.com',   -- name
  0,               -- entities_id
  0,               -- is_recursive
  1,               -- domaintypes_id (e.g., Public)
  '2030-12-31',    -- date_expiration
  '2015-01-01',    -- date_domaincreation
  2,               -- users_id_tech (glpi)
  0,               -- groups_id_tech
  0,               -- is_deleted
  'Public-facing domain for web services.', -- comment
  0,               -- is_template
  NULL,            -- template_name
  1,               -- is_active
  NOW(),           -- date_mod
  NOW()            -- date_creation
),
(
  'corp.local',    -- name
  0,               -- entities_id
  0,               -- is_recursive
  2,               -- domaintypes_id (e.g., Internal)
  '2035-12-31',    -- date_expiration
  '2010-06-15',    -- date_domaincreation
  4,               -- users_id_tech (tech)
  0,               -- groups_id_tech
  0,               -- is_deleted
  'Internal domain for Active Directory.', -- comment
  0,               -- is_template
  NULL,            -- template_name
  1,               -- is_active
  NOW(),           -- date_mod
  NOW()            -- date_creation
);

-- === APPLIANCE TYPES ===
INSERT INTO glpi_appliancetypes (entities_id, is_recursive, name, comment, externalidentifier) VALUES
(0, 0, 'Firewall', 'Appliance providing network security', NULL),
(0, 0, 'NAS', 'Network-attached storage appliance', NULL);

-- === APPLIANCE ENVIRONMENTS ===
INSERT INTO glpi_applianceenvironments (name, comment) VALUES
('Production', 'Used in live/production environment'),
('Test/Dev', 'Used for testing and development');

-- === APPLIANCES ===
INSERT INTO glpi_appliances (
  entities_id,
  is_recursive,
  name,
  is_deleted,
  appliancetypes_id,
  comment,
  locations_id,
  manufacturers_id,
  applianceenvironments_id,
  users_id,
  users_id_tech,
  groups_id,
  groups_id_tech,
  date_mod,
  date_creation,
  states_id,
  externalidentifier,
  serial,
  otherserial,
  contact,
  contact_num,
  is_helpdesk_visible,
  pictures
) VALUES
(
  0, 0, 'Firewall Appliance', 0,
  1, 'Network edge firewall appliance',
  1, 1, 1, 
  2, 4, 0, 0,
  NOW(), NOW(),
  1, NULL, 'FW123456', NULL,
  'IT Department', '123-456-7890', 1, NULL
),
(
  0, 0, 'NAS Appliance', 0,
  2, 'Storage appliance for backup and archiving',
  2, 2, 2,
  3, 4, 0, 0,
  NOW(), NOW(),
  1, NULL, 'NAS987654', NULL,
  'Storage Team', '987-654-3210', 1, NULL
);

-- === APPLIANCES ITEMS (example links to existing items like computers/servers) ===
INSERT INTO glpi_appliances_items (appliances_id, items_id, itemtype) VALUES
(1, 1, 'Computer'), -- Firewall linked to Computer ID 1
(2, 2, 'Computer');   -- NAS linked to Device ID 2

-- === APPLIANCES ITEMS RELATIONS (optional cross-links) ===
INSERT INTO glpi_appliances_items_relations (appliances_items_id, itemtype, items_id) VALUES
(1, 'NetworkEquipment', 1), -- Relates Firewall appliance item to a NetworkEquipment
(2, 'Peripheral', 2);       -- Relates NAS appliance item to a Peripheral

-- === DATABASES ===
INSERT INTO glpi_databases (
  entities_id,
  is_recursive,
  name,
  size,
  databaseinstances_id,
  is_onbackup,
  is_active,
  is_deleted,
  is_dynamic,
  date_creation,
  date_mod,
  date_update,
  date_lastbackup
) VALUES
(
  0,                 -- entities_id
  0,                 -- is_recursive
  'GLPI DB',         -- name
  2048,              -- size (e.g., 2048 MB)
  1,                 -- databaseinstances_id
  1,                 -- is_onbackup
  1,                 -- is_active
  0,                 -- is_deleted
  0,                 -- is_dynamic
  NOW(),             -- date_creation
  NOW(),             -- date_mod
  NOW(),             -- date_update
  NOW()              -- date_lastbackup
),
(
  0,                 -- entities_id
  0,                 -- is_recursive
  'Reporting DB',    -- name
  1024,              -- size (e.g., 1024 MB)
  2,                 -- databaseinstances_id
  1,                 -- is_onbackup
  1,                 -- is_active
  0,                 -- is_deleted
  0,                 -- is_dynamic
  NOW(),             -- date_creation
  NOW(),             -- date_mod
  NOW(),             -- date_update
  NOW()              -- date_lastbackup
);

-- === USERS ===
INSERT INTO glpi_users (
   name, realname, firstname, is_active,
   locations_id, use_mode, auths_id, authtype,
   is_deleted, profiles_id, usertitles_id, usercategories_id,
   is_deleted_ldap, groups_id, users_id_supervisor,
   phone, mobile
) VALUES
  ('admin-1', 'Admin', 'Super', 1, FLOOR(1 + RAND()*2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '123-456-1001', '09170001001'),
  ('glpi-1', 'GLPI', 'System', 1, FLOOR(1 + RAND()*2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '123-456-1002', '09170001002'),
  ('post-only-1', 'Post', 'Only', 1, FLOOR(1 + RAND()*2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '123-456-1003', '09170001003'),
  ('tech-1', 'Tech', 'User', 1, FLOOR(1 + RAND()*2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '123-456-1004', '09170001004'),
  ('normal-1', 'Normal', 'User', 1, FLOOR(1 + RAND()*2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '123-456-1005', '09170001005'),
  ('glpi-system-1', 'GLPI', 'System', 1, FLOOR(1 + RAND()*2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '123-456-1006', '09170001006'),
  ('adminsuper-1', 'Admin', 'Super', 1, FLOOR(1 + RAND()*2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '123-456-1007', '09170001007'),
  ('jdoe-1', 'Doe', 'John', 1, FLOOR(1 + RAND()*2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '123-456-1008', '09170001008'),
  ('jsmith-1', 'Smith', 'Jane', 1, FLOOR(1 + RAND()*2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '123-456-1009', '09170001009');

  -- === USER EMAILS ===
INSERT INTO glpi_useremails (users_id, email, is_default)
VALUES
  ((SELECT id FROM glpi_users WHERE name='admin-1'), 'admin1@example.com', 1),
  ((SELECT id FROM glpi_users WHERE name='glpi-1'), 'glpi1@example.com', 1),
  ((SELECT id FROM glpi_users WHERE name='post-only-1'), 'postonly1@example.com', 1),
  ((SELECT id FROM glpi_users WHERE name='tech-1'), 'tech1@example.com', 1),
  ((SELECT id FROM glpi_users WHERE name='normal-1'), 'normal1@example.com', 1),
  ((SELECT id FROM glpi_users WHERE name='glpi-system-1'), 'glpisystem1@example.com', 1),
  ((SELECT id FROM glpi_users WHERE name='adminsuper-1'), 'adminsuper1@example.com', 1),
  ((SELECT id FROM glpi_users WHERE name='jdoe-1'), 'jdoe1@example.com', 1),
  ((SELECT id FROM glpi_users WHERE name='jsmith-1'), 'jsmith1@example.com', 1);

-- === GROUPS ===
INSERT INTO glpi_groups (
  entities_id, is_recursive, name, comment, ldap_field, ldap_value, ldap_group_dn,
  date_mod, groups_id, completename, level, ancestors_cache, sons_cache,
  is_requester, is_watcher, is_assign, is_task, is_notify, is_itemgroup,
  is_usergroup, is_manager, date_creation
) VALUES
  (0, 0, 'IT Department', NULL, NULL, NULL, NULL, NULL, 0, 'IT Department', 0, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, NULL),
  (0, 0, 'Support Team', NULL, NULL, NULL, NULL, NULL, 0, 'Support Team', 0, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, NULL),
  (0, 0, 'Developers', NULL, NULL, NULL, NULL, NULL, 0, 'Developers', 0, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, NULL),
  (0, 1, 'Managers', NULL, NULL, NULL, NULL, NULL, 0, 'Managers', 0, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, NULL);

-- === PROFILES ===
INSERT INTO glpi_profiles (
  name, interface, is_default, helpdesk_hardware, helpdesk_item_type, ticket_status,
  date_mod, comment, problem_status, create_ticket_on_login,
  tickettemplates_id, changetemplates_id, problemtemplates_id, change_status,
  managed_domainrecordtypes, date_creation
) VALUES
  (
    'Super-Admin', 'central', 1, 0, NULL, NULL,
    NOW(), 'Full access to all features', NULL, 0,
    0, 0, 0, NULL,
    NULL, NOW()
  ),
  (
    'Technician', 'helpdesk', 0, 0, NULL, NULL,
    NOW(), 'Handles tickets and assets', NULL, 0,
    0, 0, 0, NULL,
    NULL, NOW()
  ),
  (
    'User', 'central', 0, 0, NULL, NULL,
    NOW(), 'Basic user with limited rights', NULL, 0,
    0, 0, 0, NULL,
    NULL, NOW()
  ),
  (
    'Observer', 'helpdesk', 0, 0, NULL, NULL,
    NOW(), 'Read-only access', NULL, 0,
    0, 0, 0, NULL,
    NULL, NOW()
  );

-- === PROJECTS ===
INSERT INTO glpi_projects (
  name, code, priority, entities_id, is_recursive, projects_id, projectstates_id, 
  projecttypes_id, date, date_mod, users_id, groups_id, plan_start_date, 
  plan_end_date, real_start_date, real_end_date, percent_done, auto_percent_done, 
  show_on_global_gantt, content, comment, is_deleted, date_creation, 
  projecttemplates_id, is_template, template_name
) VALUES
  (
    'Migration Project', 'MIG2025', 1, 0, 0, 0, 1, 
    0, NOW(), NOW(), 0, 0, NULL, 
    NULL, NULL, NULL, 25, 0, 
    0, 'Migration from legacy system to new platform', 'Initial setup of migration plan', 0, NOW(), 
    0, 0, NULL
  ),
  (
    'Upgrade Project', 'UPG2025', 1, 0, 0, 0, 1, 
    0, NOW(), NOW(), 0, 0, NULL, 
    NULL, NULL, NULL, 50, 0, 
    0, 'System upgrade to latest stable release', 'Ongoing upgrade activities', 0, NOW(), 
    0, 0, NULL
  );

-- === REMINDERS ===
INSERT INTO glpi_reminders (
  uuid, date, users_id, name, text, begin, end,
  is_planned, date_mod, state, begin_view_date, end_view_date, date_creation
) VALUES
('a1b2c3d4-e5f6-7890-abcd-000000000001', NOW(), 2, 'Monthly Maintenance', 'Perform routine maintenance on servers', '2025-08-10 09:00:00', '2025-08-10 12:00:00', 1, NOW(), 0, '2025-08-08 00:00:00', '2025-08-10 12:00:00', NOW()),

('a1b2c3d4-e5f6-7890-abcd-000000000002', NOW(), 3, 'License Renewal', 'Renew antivirus licenses before expiration', '2025-08-15 08:00:00', '2025-08-15 10:00:00', 1, NOW(), 1, '2025-08-10 00:00:00', '2025-08-15 10:00:00', NOW()),

('a1b2c3d4-e5f6-7890-abcd-000000000003', NOW(), 4, 'Team Meeting', 'Discuss Q3 project updates', '2025-08-12 14:00:00', '2025-08-12 15:30:00', 1, NOW(), 0, '2025-08-10 00:00:00', '2025-08-12 15:30:00', NOW());

-- === RSS FEEDS ===
INSERT INTO glpi_rssfeeds (
  name, users_id, comment, url, refresh_rate, max_items,
  have_error, is_active, date_mod, date_creation
) VALUES
('GLPI News Feed', 2, 'Official GLPI project updates and news.', 'https://glpi-project.org/news/feed/', 86400, 20, 0, 1, NOW(), NOW()),

('TechCrunch - Startups', 3, 'Startup news and articles from TechCrunch.', 'https://techcrunch.com/startups/feed/', 43200, 15, 0, 1, NOW(), NOW()),

('Security Weekly', 4, 'Cybersecurity alerts and research from Security Weekly.', 'https://securityweekly.com/feed/', 86400, 25, 0, 1, NOW(), NOW());

-- === KNOWLEDGE BASE ===
INSERT INTO glpi_knowbaseitems (
  name, answer, users_id, date_creation, date_mod
) VALUES
('How to reset password', 'Go to login page and click "Forgot password".', 2, NOW(), NOW()),
('Printer troubleshooting', 'Check paper tray and toner.', 3, NOW(), NOW());

-- === RESERVATIONS ===
INSERT INTO glpi_reservationitems (itemtype, entities_id, is_recursive, items_id, comment, is_active)
VALUES
  ('Computer', 0, 0, 1, 'Workstation-01 available', 1),
  ('Computer', 0, 0, 2, 'Workstation-02 available', 1),
  ('Computer', 0, 0, 3, 'Laptop-01 for travel use', 1);

INSERT INTO glpi_reservations (reservationitems_id, begin, end, users_id, comment, `group`)
VALUES
  (1, '2025-08-06 08:00:00', '2025-08-06 10:00:00', 2, 'Reserved by user for reports', 0),
  (2, '2025-08-07 13:00:00', '2025-08-07 17:00:00', 3, 'Afternoon reservation', 0),
  (3, '2025-08-08 09:00:00', '2025-08-08 11:00:00', 4, 'For meeting usage', 0);

-- === SAVED SEARCHES ===
INSERT INTO glpi_savedsearches (
  name, type, itemtype, users_id,
  is_private, entities_id, is_recursive,
  query, last_execution_time, do_count,
  last_execution_date, counter
) VALUES
(
  'Open Tickets', 0, 'Ticket', 2,
  1, 0, 0,
  'status=1&priority=2', 1690000000, 2,
  NOW(), 5
),
(
  'All Computers', 0, 'Computer', 3,
  1, 0, 0,
  'is_deleted=0', 1690000500, 2,
  NOW(), 12
);

-- === SAVED SEARCHES USERS ===
INSERT INTO glpi_savedsearches_users (
  users_id, itemtype, savedsearches_id
) VALUES
  -- Link User 2 to "Open Tickets"
  (2, 'Ticket', (SELECT id FROM glpi_savedsearches WHERE name = 'Open Tickets' LIMIT 1)),
  
  -- Link User 3 to "All Computers"
  (3, 'Computer', (SELECT id FROM glpi_savedsearches WHERE name = 'All Computers' LIMIT 1));

-- === NOTIFICATION QUEUE ===
INSERT INTO glpi_queuednotifications (
  itemtype, items_id, notificationtemplates_id, entities_id, is_deleted,
  sent_try, create_time, send_time, sent_time, name,
  sender, sendername, recipient, recipientname, replyto,
  replytoname, headers, body_html, body_text, messageid,
  documents, mode, event
) VALUES
  (
    'Ticket', 1, 1, 0, 0,   -- Notification for Ticket ID 1
    0, NOW(), NULL, NULL, 'New Ticket Created',
    'no-reply@example.com', 'GLPI System', 'admin@example.com', 'Administrator', NULL,
    NULL, NULL, '<p>A new ticket has been created.</p>', 'A new ticket has been created.', '<MSGID-001>',
    NULL, 'mail', 'ticket_create'
  ),
  (
    'Ticket', 2, 2, 0, 0,   -- Notification for Ticket ID 2
    1, NOW(), NULL, NULL, 'Ticket Assigned',
    'no-reply@example.com', 'GLPI System', 'support@example.com', 'Support Team', NULL,
    NULL, NULL, '<p>Your ticket has been assigned.</p>', 'Your ticket has been assigned.', '<MSGID-002>',
    NULL, 'mail', 'ticket_assign'
  ),
  (
    'Computer', 1, 3, 0, 0,  -- Notification for Computer ID 1
    0, NOW(), NULL, NULL, 'Computer Maintenance Reminder',
    'no-reply@example.com', 'GLPI System', 'tech@example.com', 'Technician', NULL,
    NULL, NULL, '<p>Scheduled maintenance reminder.</p>', 'Scheduled maintenance reminder.', '<MSGID-003>',
    NULL, 'mail', 'computer_maintenance'
  );

-- === LOGS ===
INSERT INTO glpi_logs (
  itemtype, items_id, itemtype_link, linked_action,
  user_name, date_mod, id_search_option, old_value, new_value
) VALUES
  ('Ticket', 1, '', 2,     -- no linked itemtype, just leave empty string
   'admin', NOW(), 12, 'Pending', 'Solved'),

  ('Computer', 5, '', 2,   -- no linked itemtype, just leave empty string
   'tech1', NOW(), 3, 'Dell', 'Lenovo');

-- === UNIQUENESS (for field unicity) ===
INSERT INTO glpi_fieldunicities (name, is_recursive, itemtype, entities_id, fields, is_active, action_refuse, action_notify) VALUES
  ('Unique Serial', 0, 'Computer', 0, 'serial', 1, 1, 0),
  ('Unique Email', 1, 'User', 0, 'email', 1, 1, 1);

-- === SERVICE LEVELS ===
INSERT INTO `glpi_slms` (
  `name`, `entities_id`, `is_recursive`, `comment`, 
  `use_ticket_calendar`, `calendars_id`, `date_mod`, `date_creation`
) VALUES
-- SLM for general support
('Standard Support SLM', 0, 1, 'SLM for standard tickets including general IT support.', 
  0, 0, NOW(), NOW()),

-- SLM with calendar usage
('Business Hours SLM', 0, 1, 'SLM used during business hours with calendar integration.', 
  1, 1, NOW(), NOW()),

-- SLM for critical cases
('Critical Support SLM', 0, 1, 'SLM for critical cases, using dedicated calendar.', 
  1, 2, NOW(), NOW());

-- === MAIL COLLECTORS ===
INSERT INTO `glpi_mailcollectors` (
  `name`, `host`, `login`, `filesize_max`, `is_active`,
  `date_mod`, `comment`, `passwd`, `accepted`, `refused`,
  `errors`, `use_mail_date`, `date_creation`, `requester_field`,
  `add_cc_to_observer`, `collect_only_unread`, `last_collect_date`
) VALUES
-- IT Helpdesk Receiver
('IT Helpdesk', 'imap.example.com', 'it_helpdesk@example.com', 2097152, 1,
  NOW(), 'Receives emails from staff for IT issues', 'secret123', 'support@example.com', NULL,
  0, 1, NOW(), 0,
  1, 1, NULL),

-- HR Support Receiver
('HR Support', 'imap.hrserver.com', 'hr_support@example.com', 2097152, 1,
  NOW(), 'Handles HR-related tickets', 'hrpasswd', NULL, NULL,
  0, 0, NOW(), 0,
  0, 1, NULL),

-- General Contact Receiver
('General Contact', 'mail.example.com', 'contact@example.com', 2097152, 1,
  NOW(), 'General inquiries', 'contactpwd', NULL, 'spam@example.com',
  1, 1, NOW(), 0,
  0, 1, NULL);

-- === EXTERNAL LINKS ===
INSERT INTO glpi_links (
  entities_id, is_recursive, name, link, data, open_window, date_mod, date_creation
) VALUES
  (0, 1, 'GLPI Documentation', 'https://glpi-project.org', '', 1, NOW(), NOW()),
  (0, 1, 'Company Support Portal', 'https://support.company.com', '', 1, NOW(), NOW());

-- End of seed file