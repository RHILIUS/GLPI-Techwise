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
(1, 'Workstation-01', 'SN-WKS-0001', 'ALT-WKS-01', 'John Doe', '555-1001', 2, 3, 'Office desktop', NOW(), 0, 1, 1, 1, 1, 0, NULL, 1, 0, 0, 4, 2, 1, 0.0000, UUID(), NOW(), 0, NOW(), NOW()),
(1, 'Workstation-02', 'SN-WKS-0002', 'ALT-WKS-02', 'Jane Smith', '555-1002', 2, 3, 'Office desktop', NOW(), 0, 1, 1, 1, 1, 0, NULL, 1, 0, 0, 4, 2, 1, 0.0000, UUID(), NOW(), 0, NOW(), NOW()),
(1, 'Laptop-01',     'SN-LTP-0001', 'ALT-LTP-01', 'Alice Johnson', '555-2001', 2, 3, 'Mobile laptop', NOW(), 0, 2, 2, 2, 2, 0, NULL, 2, 0, 0, 5, 3, 2, 0.0000, UUID(), NOW(), 0, NOW(), NOW()),
(1, 'Server-01',     'SN-SRV-0001', 'ALT-SRV-01', 'Bob Martin', '555-3001', 2, 3, 'Main server', NOW(), 0, 3, 3, 3, 3, 0, NULL, 3, 0, 0, 6, 4, 3, 0.0000, UUID(), NOW(), 0, NOW(), NOW()),
(1, 'Server-02',     'SN-SRV-0002', 'ALT-SRV-02', 'Clara Lee', '555-3002', 2, 3, 'Backup server', NOW(), 0, 3, 3, 3, 3, 0, NULL, 3, 0, 0, 6, 4, 3, 0.0000, UUID(), NOW(), 0, NOW(), NOW());

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
  is_recursive
) VALUES
(1, 'Monitor-01', NOW(), 'John Doe', '555-4001', 2, 3, 'Main monitor in office', 'MON-SN-0001', 'MON-ALT-01', 24.00, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, NULL, 4, 2, 1, 0.0000, 0, 0, UUID(), NOW(), 0),
(1, 'Monitor-02', NOW(), 'Jane Smith', '555-4002', 2, 3, 'Spare monitor', 'MON-SN-0002', 'MON-ALT-02', 22.00, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, NULL, 5, 3, 2, 0.0000, 0, 0, UUID(), NOW(), 0),
(1, 'Monitor-03', NOW(), 'Alice Johnson', '555-4003', 2, 3, 'Meeting room display', 'MON-SN-0003', 'MON-ALT-03', 27.00, 1, 1, 1, 0, 1, 1, 1, 1, 2, 2, 2, 2, 0, 0, 0, NULL, 6, 4, 3, 0.0000, 0, 0, UUID(), NOW(), 0);

-- === SOFTWARE ===
INSERT INTO glpi_softwares (
  entities_id,
  is_recursive,
  name,
  comment,
  locations_id,
  users_id_tech,
  groups_id_tech,
  is_update,
  softwares_id,
  manufacturers_id,
  is_deleted,
  is_template,
  template_name,
  date_mod,
  users_id,
  groups_id,
  ticket_tco,
  is_helpdesk_visible,
  softwarecategories_id,
  is_valid,
  date_creation,
  pictures
) VALUES
(1, 0, 'Windows 11 Pro', 'Latest Microsoft OS for workstations', 1, 2, 3, 1, 0, 1, 0, 0, NULL, NOW(), 4, 2, 0.0000, 1, 1, 1, NOW(), NULL),
(1, 0, 'Microsoft Office 365', 'Cloud-based office suite', 1, 2, 3, 1, 0, 1, 0, 0, NULL, NOW(), 4, 2, 0.0000, 1, 2, 1, NOW(), NULL),
(1, 0, 'Adobe Photoshop', 'Graphics editing software', 2, 2, 3, 1, 0, 2, 0, 0, NULL, NOW(), 5, 3, 0.0000, 1, 3, 1, NOW(), NULL),
(1, 0, 'LibreOffice', 'Free and open-source office suite', 2, 2, 3, 0, 0, 3, 0, 0, NULL, NOW(), 6, 3, 0.0000, 1, 2, 1, NOW(), NULL),
(1, 0, 'GLPI Agent', 'Inventory and remote management agent', 3, 2, 3, 0, 0, 4, 0, 0, NULL, NOW(), 7, 4, 0.0000, 1, 4, 1, NOW(), NULL);

-- === SOFTWARE LICENSES ===
INSERT INTO glpi_softwarelicenses (
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
  otherserial,
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
(1, 0, 'Windows 11 Pro / Win11Pro Volume', 0, NULL, NULL, 1, 0, 10, 1, 'Win11Pro Volume', 'WIN11-SERIAL-001', 'WIN11-ALT-001', 0, 0, '2027-12-31', 'Volume license for Win11', NOW(), 1, NOW(), 0, 1, 2, 4, 3, 2, 1, 0, NULL, 1, 1, 'John Doe', '555-1001', 0, NULL),
(2, 0, 'Microsoft Office 365 / Office365 E3', 0, NULL, NULL, 1, 0, 20, 2, 'Office365 E3', 'OFFICE365-SERIAL-002', 'OFFICE365-ALT-002', 0, 0, '2026-06-30', 'E3 license for Office365', NOW(), 1, NOW(), 0, 1, 2, 5, 3, 2, 1, 0, NULL, 1, 1, 'Jane Smith', '555-2002', 0, NULL);

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
(1, 0, 'Switch-01', 512, 'SW-0001', 'ALT-SW-01', 'Mark Reyes', '555-5001', 2, 3, NOW(), 'Core network switch in server room', 1, 1, 1, 1, 1, 0, 0, NULL, 4, 2, 1, 0.0000, 0, UUID(), NOW(), 0, 'Cisco Catalyst 2960 Series', 2, '15 days', NOW(), 0),

-- Router-01
(1, 0, 'Router-01', 256, 'RT-0001', 'ALT-RT-01', 'Ana Cruz', '555-5002', 2, 3, NOW(), 'Main router for WAN connection', 2, 1, 2, 2, 2, 0, 0, NULL, 5, 2, 1, 0.0000, 0, UUID(), NOW(), 0, 'MikroTik RB4011', 4, '30 days', NOW(), 0),

-- Firewall-01
(1, 0, 'Firewall-01', 1024, 'FW-0001', 'ALT-FW-01', 'Leo Santos', '555-5003', 2, 3, NOW(), 'Firewall for external traffic', 3, 1, 3, 3, 3, 0, 0, NULL, 6, 2, 1, 0.0000, 0, UUID(), NOW(), 0, 'pfSense running on custom appliance', 2, '45 days', NOW(), 0);


-- === PERIPHERALS ===
INSERT INTO `glpi_peripherals` (
  `entities_id`, `name`, `date_mod`, `contact`, `contact_num`,
  `users_id_tech`, `groups_id_tech`, `comment`, `serial`, `otherserial`,
  `locations_id`, `peripheraltypes_id`, `peripheralmodels_id`, `brand`, `manufacturers_id`,
  `is_global`, `is_deleted`, `is_template`, `template_name`, `users_id`,
  `groups_id`, `states_id`, `ticket_tco`, `is_dynamic`, `autoupdatesystems_id`,
  `uuid`, `date_creation`, `is_recursive`
) VALUES
-- Barcode Scanner
(1, 'Barcode Scanner', NOW(), 'Tech Support', '09171234567',
 0, 0, 'Used at reception', 'BS-123456', 'ALT-BS-987654',
 1, 1, 1, 'Zebra', 1,
 0, 0, 0, NULL, 0,
 0, 1, 0.0000, 0, 0,
 UUID(), NOW(), 0),

-- Webcam
(1, 'Webcam', NOW(), 'Tech Support', '09171234567',
 0, 0, 'Mounted on desktop', 'WC-223344', 'ALT-WC-554433',
 1, 2, 2, 'Logitech', 2,
 0, 0, 0, NULL, 0,
 0, 1, 0.0000, 0, 0,
 UUID(), NOW(), 0),

-- External HDD
(1, 'External HDD', NOW(), 'Tech Support', '09171234567',
 0, 0, 'Used for backups', 'EHDD-778899', 'ALT-EHDD-998877',
 1, 3, 3, 'Seagate', 3,
 0, 0, 0, NULL, 0,
 0, 1, 0.0000, 0, 0,
 UUID(), NOW(), 0);

-- === PRINTERS ===
INSERT INTO glpi_printers (
  entities_id,
  is_recursive,
  name,
  date_mod,
  contact,
  contact_num,
  users_id_tech,
  groups_id_tech,
  serial,
  otherserial,
  have_serial,
  have_parallel,
  have_usb,
  have_wifi,
  have_ethernet,
  comment,
  memory_size,
  locations_id,
  networks_id,
  printertypes_id,
  printermodels_id,
  manufacturers_id,
  is_global,
  is_deleted,
  is_template,
  template_name,
  init_pages_counter,
  last_pages_counter,
  users_id,
  groups_id,
  states_id,
  ticket_tco,
  is_dynamic,
  uuid,
  date_creation,
  sysdescr,
  last_inventory_update,
  snmpcredentials_id,
  autoupdatesystems_id
) VALUES
-- Sample printer 1
(
  1,                 -- entities_id
  0,                 -- is_recursive
  'HP LaserJet 400', -- name
  NOW(),             -- date_mod
  NULL,              -- contact
  NULL,              -- contact_num
  0,                 -- users_id_tech
  0,                 -- groups_id_tech
  NULL,              -- serial
  NULL,              -- otherserial
  1,                 -- have_serial
  0,                 -- have_parallel
  1,                 -- have_usb
  0,                 -- have_wifi
  1,                 -- have_ethernet
  NULL,              -- comment
  NULL,              -- memory_size
  0,                 -- locations_id
  0,                 -- networks_id
  0,                 -- printertypes_id
  0,                 -- printermodels_id
  0,                 -- manufacturers_id
  0,                 -- is_global
  0,                 -- is_deleted
  0,                 -- is_template
  NULL,              -- template_name
  0,                 -- init_pages_counter
  0,                 -- last_pages_counter
  0,                 -- users_id
  0,                 -- groups_id
  0,                 -- states_id
  0.0000,            -- ticket_tco
  0,                 -- is_dynamic
  NULL,              -- uuid
  NOW(),             -- date_creation
  NULL,              -- sysdescr
  NULL,              -- last_inventory_update
  0,                 -- snmpcredentials_id
  0                  -- autoupdatesystems_id
),
-- Sample printer 2
(
  1,
  0,
  'Brother HL-L2350DW',
  NOW(),
  NULL,
  NULL,
  0,
  0,
  NULL,
  NULL,
  1,
  0,
  1,
  1,
  1,
  NULL,
  NULL,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  NULL,
  0,
  0,
  0,
  0,
  0,
  0.0000,
  0,
  NULL,
  NOW(),
  NULL,
  NULL,
  0,
  0
);

-- === CARTRIDGE ITEMS ===
INSERT INTO glpi_cartridgeitems (
  entities_id, is_recursive, name, ref, locations_id, cartridgeitemtypes_id, 
  manufacturers_id, users_id_tech, groups_id_tech, is_deleted, comment, 
  alarm_threshold, stock_target, date_mod, date_creation, pictures
) VALUES
  (1, 0, 'Black Ink', 'B-INK-01', 0, 0, 0, 0, 0, 0, 'Standard black ink cartridge', 10, 50, NOW(), NOW(), NULL),
  (1, 0, 'Color Ink', 'C-INK-01', 0, 0, 0, 0, 0, 0, 'Standard color ink cartridge', 10, 30, NOW(), NOW(), NULL);

-- === CARTRIDGES ===
INSERT INTO glpi_cartridges (
  entities_id, cartridgeitems_id, printers_id,
  date_in, date_use, date_out, pages,
  date_mod, date_creation
) VALUES
  (1, 1, 1, '2025-08-01', '2025-08-02', NULL, 500, NOW(), NOW()),
  (1, 2, 2, '2025-08-03', '2025-08-04', NULL, 300, NOW(), NOW());

-- === CONSUMABLE ITEMS ===
INSERT INTO glpi_consumableitems (
  entities_id, is_recursive, name, ref, locations_id, consumableitemtypes_id,
  manufacturers_id, users_id_tech, groups_id_tech, is_deleted, comment,
  alarm_threshold, stock_target, date_mod, date_creation, otherserial, pictures
) VALUES
  (1, 0, 'Paper', 'PAPER-A4', 0, 0, 0, 0, 0, 0, 'A4 size printing paper', 10, 100, NOW(), NOW(), 'SN-PAPER-001', NULL),
  (1, 0, 'Staples', 'STAPLES-01', 0, 0, 0, 0, 0, 0, 'Standard office staples', 10, 50, NOW(), NOW(), 'SN-STAPLE-001', NULL);

-- === CONSUMABLES ===
INSERT INTO glpi_consumables (
  entities_id, consumableitems_id,
  date_in, date_out, itemtype, items_id, date_mod, date_creation
) VALUES
  (1, 1, '2025-08-01', NULL, NULL, 0, NOW(), NOW()),
  (1, 2, '2025-08-02', NULL, NULL, 0, NOW(), NOW());

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
    1, 'Cisco IP Phone 8841', NOW(), 'John Doe', '1234567890',
    0, 0, 'Used in reception area', 'CISCO-8841-SN001', 'CISCO-8841-OSN001',
    0, 0, 0, 'Cisco', 0,
    '101', 1, 0, 0, 0,
    0, 0, NULL, 0, 0,
    0, 0.0000, 0, 0, 'uuid-cisco-001',
    NOW(), 0, NOW()
  ),
  (
    1, 'Polycom VVX 450', NOW(), 'Jane Smith', '9876543210',
    0, 0, 'Used in conference room', 'POLY-VVX450-SN002', 'POLY-VVX450-OSN002',
    0, 0, 0, 'Polycom', 0,
    '102', 0, 1, 0, 0,
    0, 0, NULL, 0, 0,
    0, 0.0000, 0, 0, 'uuid-polycom-002',
    NOW(), 0, NOW()
  );

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
    'Rack-01', 'Main server room rack', 1, 0, 0,
    'RACK-SN-001', 'RACK-OSN-001', NULL, 0, 0,
    0, 0, 0, 600, 42,
    1000, 42, 0, NULL, 0,
    0, 0, 'A1', '#FFFFFF', 10000,
    5000, 800, NOW(), NOW()
  ),
  (
    'Rack-02', 'Backup room rack', 1, 0, 0,
    'RACK-SN-002', 'RACK-OSN-002', NULL, 0, 0,
    0, 0, 0, 600, 48,
    1200, 48, 0, NULL, 0,
    0, 1, 'B2', '#EEEEEE', 12000,
    6500, 1000, NOW(), NOW()
  );

-- === ENCLOSURES ===
INSERT INTO glpi_enclosures (
  name, entities_id, is_recursive, locations_id,
  serial, otherserial, enclosuremodels_id, users_id_tech,
  groups_id_tech, is_template, template_name, is_deleted,
  orientation, power_supplies, states_id, comment,
  manufacturers_id, date_mod, date_creation
) VALUES
  (
    'Enclosure-01', 1, 0, 0,
    'ENC-SN-001', 'ENC-OSN-001', NULL, 0,
    0, 0, NULL, 0,
    0, 2, 0, 'Primary enclosure for compute blades',
    0, NOW(), NOW()
  ),
  (
    'Enclosure-02', 1, 0, 0,
    'ENC-SN-002', 'ENC-OSN-002', NULL, 0,
    0, 0, NULL, 0,
    1, 1, 0, 'Secondary enclosure in rack B2',
    0, NOW(), NOW()
  );

-- === PDUS ===
INSERT INTO glpi_pdus (
  name, entities_id, is_recursive, locations_id,
  serial, otherserial, pdumodels_id, users_id_tech,
  groups_id_tech, is_template, template_name, is_deleted,
  states_id, comment, manufacturers_id, pdutypes_id,
  date_mod, date_creation
) VALUES
  (
    'PDU-01', 1, 0, 0,
    'PDU-SN-001', 'PDU-OSN-001', NULL, 0,
    0, 0, NULL, 0,
    0, 'Primary PDU for Rack A1', 0, 0,
    NOW(), NOW()
  ),
  (
    'PDU-02', 1, 0, 0,
    'PDU-SN-002', 'PDU-OSN-002', NULL, 0,
    0, 0, NULL, 0,
    0, 'Backup PDU unit', 0, 0,
    NOW(), NOW()
  );

-- === PASSIVE DC EQUIPMENT ===
INSERT INTO glpi_passivedcequipments (
  name, entities_id, is_recursive, locations_id,
  serial, otherserial, passivedcequipmentmodels_id, passivedcequipmenttypes_id,
  users_id_tech, groups_id_tech, is_template, template_name,
  is_deleted, states_id, comment, manufacturers_id,
  date_mod, date_creation
) VALUES
  (
    'Patch Panel 24p', 1, 0, 0,
    'PP24-SN-001', 'PP24-OSN-001', NULL, 0,
    0, 0, 0, NULL,
    0, 0, 'Standard copper patch panel', 0,
    NOW(), NOW()
  ),
  (
    'Fiber Patch Panel', 1, 0, 0,
    'FPP-SN-001', 'FPP-OSN-001', NULL, 0,
    0, 0, 0, NULL,
    0, 0, '12-port fiber patch panel', 0,
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
  1, 0, 'Unknown Device 1',
  'UD1-SN-001', 'UD1-OSN-001', 'Technician A', '09171234567',
  NOW(), 'First unknown device in the network.', 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  NOW(), 0, 'Unidentified network hardware.',
  0, NULL, 0, 0, '192.168.1.201',
  0, NOW()
),
(
  1, 0, 'Unknown Device 2',
  'UD2-SN-002', 'UD2-OSN-002', 'Technician B', '09179876543',
  NOW(), 'Second unidentified asset.', 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  NOW(), 0, 'Possibly a switch or bridge.',
  0, NULL, 0, 0, '192.168.1.202',
  0, NOW()
);

-- === CABLES ===
INSERT INTO glpi_cables (
  name, entities_id, is_recursive,
  itemtype_endpoint_a, itemtype_endpoint_b,
  items_id_endpoint_a, items_id_endpoint_b,
  socketmodels_id_endpoint_a, socketmodels_id_endpoint_b,
  sockets_id_endpoint_a, sockets_id_endpoint_b,
  cablestrands_id, color, otherserial,
  states_id, users_id_tech, cabletypes_id,
  comment, date_mod, date_creation, is_deleted
) VALUES
(
  'Cat6 Patch Cable', 1, 0,
  NULL, NULL,
  0, 0,
  0, 0,
  0, 0,
  0, 'Blue', 'CAT6-001',
  0, 0, 0,
  'Standard Cat6 patch cable for office use.', NOW(), NOW(), 0
),
(
  'Fiber Optic Cable', 1, 0,
  NULL, NULL,
  0, 0,
  0, 0,
  0, 0,
  0, 'Yellow', 'FIBER-OPT-002',
  0, 0, 0,
  'Single-mode fiber optic cable for high-speed networking.', NOW(), NOW(), 0
);

-- === ITEMS DEVICES SIMCARDS ===
INSERT INTO glpi_items_devicesimcards (
  items_id, itemtype, devicesimcards_id, is_deleted, is_dynamic,
  entities_id, is_recursive, serial, otherserial, states_id,
  locations_id, lines_id, users_id, groups_id,
  pin, pin2, puk, puk2, msin, comment
) VALUES
(1, 'Computer', 1, 0, 0, 1, 0, 'SIM123456789', 'ALT987654321', 1, 1, 1, 1, 1, '1234', '4321', '11111111', '22222222', 'MSIN001', 'Assigned to work laptop'),

(2, 'Phone', 2, 0, 0, 1, 0, 'SIM223456789', 'ALT887654321', 2, 2, 2, 2, 2, '5678', '8765', '33333333', '44444444', 'MSIN002', 'Assigned to field agent'),

(3, 'Tablet', 3, 0, 0, 1, 0, 'SIM323456789', 'ALT777654321', 1, 3, 3, 3, 3, '9999', '0000', '55555555', '66666666', 'MSIN003', 'Used for remote access');

INSERT INTO glpi_tickets (
  entities_id,
  name,
  date,
  closedate,
  solvedate,
  takeintoaccountdate,
  date_mod,
  users_id_lastupdater,
  status,
  users_id_recipient,
  requesttypes_id,
  content,
  urgency,
  impact,
  priority,
  itilcategories_id,
  type,
  global_validation,
  slas_id_ttr,
  slas_id_tto,
  slalevels_id_ttr,
  time_to_resolve,
  time_to_own,
  begin_waiting_date,
  sla_waiting_duration,
  ola_waiting_duration,
  olas_id_tto,
  olas_id_ttr,
  olalevels_id_ttr,
  ola_tto_begin_date,
  ola_ttr_begin_date,
  internal_time_to_resolve,
  internal_time_to_own,
  waiting_duration,
  close_delay_stat,
  solve_delay_stat,
  takeintoaccount_delay_stat,
  actiontime,
  is_deleted,
  locations_id,
  validation_percent,
  date_creation
)
VALUES
-- Ticket 1
(1, 'Cannot print', NOW(), NULL, NULL, NOW(), NOW(), 2, 1, 3, 1, 'User cannot print from workstation.', 2, 2, 2, 1, 1, 1,
  0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL,
  0, 0, 0, 0, 0, 0, 1, 0, NOW()),

-- Ticket 2
(1, 'Network down', NOW(), NULL, NULL, NOW(), NOW(), 4, 2, 5, 2, 'Entire office is offline. No internet connectivity.', 3, 3, 3, 2, 1, 1,
  0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL,
  0, 0, 0, 0, 0, 0, 2, 0, NOW()),

-- Ticket 3
(1, 'Software install', NOW(), NULL, NULL, NOW(), NOW(), 3, 1, 6, 1, 'Request to install licensed Photoshop.', 1, 1, 1, 3, 1, 1,
  0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL,
  0, 0, 0, 0, 0, 0, 3, 0, NOW());

-- === PROBLEMS ===
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
  itilcategories_id,
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
  1,         -- entities_id
  0,         -- is_recursive
  0,         -- is_deleted
  1,         -- status: New
  'Printer in the admin office jams frequently after printing more than 5 pages.',
  NOW(),     -- date_mod
  NOW(),     -- date
  NULL,      -- solvedate
  NULL,      -- closedate
  NULL,      -- time_to_resolve
  2,         -- users_id_recipient
  3,         -- users_id_lastupdater
  2,         -- urgency (e.g., Medium)
  2,         -- impact (e.g., Medium)
  2,         -- priority (calculated or manual)
  1,         -- itilcategories_id
  'Affects printing operations for administrative staff.',
  'Possible worn-out roller or sensor failure.',
  'Pages get stuck mid-print.',
  0,         -- actiontime
  NULL,      -- begin_waiting_date
  0,         -- waiting_duration
  0,         -- close_delay_stat
  0,         -- solve_delay_stat
  NOW(),     -- date_creation
  1          -- locations_id
),

-- Problem 2
(
  'Intermittent network outage',
  1,
  0,
  0,
  2,         -- status: Assigned/In Progress
  'Network drops multiple times a day in the west wing. Users report disconnections.',
  NOW(),
  NOW(),
  NULL,
  NULL,
  NULL,
  4,
  5,
  3,
  3,
  3,
  2,
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

-- === CHANGES ===
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
  itilcategories_id,
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
  1,        -- entities_id
  0,        -- is_recursive
  0,        -- is_deleted
  1,        -- status: New
  'Upgrade firmware on all core network switches to latest stable version to fix known bugs and security issues.',
  NOW(),    -- date_mod
  NOW(),    -- date
  NULL,     -- solvedate
  NULL,     -- closedate
  NULL,     -- time_to_resolve
  2,        -- users_id_recipient
  3,        -- users_id_lastupdater
  2,        -- urgency
  3,        -- impact
  3,        -- priority
  1,        -- itilcategories_id
  'Network availability may be temporarily affected during reboot.',
  'Verify backup configuration and network redundancy.',
  'Schedule upgrade during low-traffic hours and notify staff.',
  'If upgrade fails, revert to previous firmware from backup.',
  '✔ Backup taken\n✔ Maintenance window approved\n✔ Notification sent',
  1,        -- global_validation
  100,      -- validation_percent
  0,        -- actiontime
  NULL,     -- begin_waiting_date
  0,        -- waiting_duration
  0,        -- close_delay_stat
  0,        -- solve_delay_stat
  NOW(),    -- date_creation
  1         -- locations_id
),

-- Change 2: Replace UPS
(
  'Replace UPS',
  1,
  0,
  0,
  2,        -- status: Assigned/In Progress
  'Replace the outdated UPS in the server room to ensure continuous power backup and prevent equipment damage.',
  NOW(),
  NOW(),
  NULL,
  NULL,
  NULL,
  4,
  5,
  3,
  2,
  3,
  2,
  'Unplanned power loss can cause data corruption and hardware failure.',
  'Ensure compatible replacement, notify IT and facilities team.',
  'Install new UPS with downtime coordination.',
  'Retain old UPS in case replacement fails.',
  '✔ Power tested\n✔ Old unit decommissioned\n✔ Logs updated',
  2,        -- global_validation (e.g., pending)
  50,       -- validation_percent
  0,
  NULL,
  0,
  0,
  0,
  NOW(),
  2
);

-- === PLANNING EXTERNAL EVENTS ===
INSERT INTO `glpi_planningexternalevents` (
  `uuid`, `planningexternaleventtemplates_id`, `entities_id`, `is_recursive`,
  `date`, `users_id`, `users_id_guests`, `groups_id`, `name`, `text`,
  `begin`, `end`, `rrule`, `state`, `planningeventcategories_id`, `background`,
  `date_mod`, `date_creation`
) VALUES
-- External Meeting #1
('a1b2c3d4-1111-2222-3333-444455556666', 0, 0, 0,
  NOW(), 1, '2,3', 0, 'Weekly Sync with Team',
  'Discuss weekly progress and blockers.',
  '2025-08-07 10:00:00', '2025-08-07 11:00:00', NULL,
  1, 0, 0,
  NOW(), NOW()),

-- External Meeting #2
('b2c3d4e5-7777-8888-9999-aaaabbbbcccc', 0, 0, 0,
  NOW(), 2, '', 0, 'Client Demo Day',
  'Demo the new features to the client.',
  '2025-08-08 15:00:00', '2025-08-08 16:30:00', NULL,
  1, 0, 0,
  NOW(), NOW()),

-- Recurring Standup Meeting
('c3d4e5f6-dddd-eeee-ffff-111122223333', 0, 0, 1,
  NOW(), 3, '', 0, 'Daily Standup',
  '15-minute daily check-in with dev team.',
  '2025-08-09 09:00:00', '2025-08-09 09:15:00',
  'FREQ=DAILY;INTERVAL=1;COUNT=10', -- Recurs daily for 10 days
  1, 0, 0,
  NOW(), NOW());

-- === RECURRING TICKETS ===
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
  'Monthly Backup Check',                          -- name
  'Verify all backup systems and logs are functional.',  -- comment
  1,                                               -- entities_id
  0,                                               -- is_recursive
  1,                                               -- is_active
  0,                                               -- tickettemplates_id (assume none)
  '2025-08-01 08:00:00',                           -- begin_date
  '1 MONTH',                                       -- periodicity (monthly)
  2,                                               -- create_before (days before to create ticket)
  '2025-09-01 08:00:00',                           -- next_creation_date
  0,                                               -- calendars_id
  NULL                                             -- end_date
),

-- Quarterly Patch
(
  'Quarterly Patch',
  'Install OS and software patches on all production servers.',
  1,
  0,
  1,
  0,
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
  1,                                                    -- entities_id
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
  'IT Budget 2025',            -- name
  1,                           -- entities_id
  0,                           -- is_recursive
  'Budget for IT operations in 2025.', -- comment
  0,                           -- is_deleted
  '2025-01-01',                -- begin_date
  '2025-12-31',                -- end_date
  10000.0000,                  -- value
  0,                           -- is_template
  NULL,                        -- template_name
  NOW(),                       -- date_mod
  NOW(),                       -- date_creation
  0,                           -- locations_id
  1                            -- budgettypes_id
),
(
  'Hardware Budget',           -- name
  1,                           -- entities_id
  0,                           -- is_recursive
  'Allocated for hardware upgrades.', -- comment
  0,                           -- is_deleted
  '2025-01-01',                -- begin_date
  '2025-06-30',                -- end_date
  5000.0000,                   -- value
  0,                           -- is_template
  NULL,                        -- template_name
  NOW(),                       -- date_mod
  NOW(),                       -- date_creation
  0,                           -- locations_id
  1                            -- budgettypes_id
);


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
  1,                          -- entities_id
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
  1,                          -- entities_id
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
  1,                          -- entities_id
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
  1,                          -- entities_id
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
  1,                          -- entities_id
  0,                          -- is_recursive
  'Printer Lease',            -- name
  'PL-2025-001',              -- num
  1,                          -- contracttypes_id
  1,                          -- locations_id
  '2025-01-01',               -- begin_date
  12,                         -- duration (months)
  1,                          -- notice (months)
  0,                          -- periodicity
  1,                          -- billing (monthly)
  'Annual printer lease contract for 2025.', -- comment
  'ACCT-PL001',               -- accounting_number
  0,                          -- is_deleted
  '08:00:00',                 -- week_begin_hour
  '17:00:00',                 -- week_end_hour
  '09:00:00',                 -- saturday_begin_hour
  '12:00:00',                 -- saturday_end_hour
  1,                          -- use_saturday
  '00:00:00',                 -- sunday_begin_hour
  '00:00:00',                 -- sunday_end_hour
  0,                          -- use_sunday
  5,                          -- max_links_allowed
  1,                          -- alert
  1,                          -- renewal
  NULL,                       -- template_name
  0,                          -- is_template
  1,                          -- states_id
  NOW(),                      -- date_mod
  NOW()                       -- date_creation
),
(
  1,                          -- entities_id
  0,                          -- is_recursive
  'Support Agreement',        -- name
  'SA-2025-002',              -- num
  2,                          -- contracttypes_id
  2,                          -- locations_id
  '2025-02-01',               -- begin_date
  24,                         -- duration (months)
  2,                          -- notice (months)
  0,                          -- periodicity
  1,                          -- billing
  'IT support services for 2 years.', -- comment
  'ACCT-SA002',               -- accounting_number
  0,                          -- is_deleted
  '09:00:00',                 -- week_begin_hour
  '18:00:00',                 -- week_end_hour
  '00:00:00',                 -- saturday_begin_hour
  '00:00:00',                 -- saturday_end_hour
  0,                          -- use_saturday
  '00:00:00',                 -- sunday_begin_hour
  '00:00:00',                 -- sunday_end_hour
  0,                          -- use_sunday
  10,                         -- max_links_allowed
  1,                          -- alert
  1,                          -- renewal
  NULL,                       -- template_name
  0,                          -- is_template
  2,                          -- states_id
  NOW(),                      -- date_mod
  NOW()                       -- date_creation
);


-- === DOCUMENTS ===
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
  1,                          -- entities_id
  0,                          -- is_recursive
  'User Guide',               -- name
  'user_guide.pdf',           -- filename
  '/files/user_guide.pdf',    -- filepath
  1,                          -- documentcategories_id
  'application/pdf',          -- mime
  NOW(),                      -- date_mod
  'Comprehensive user manual.', -- comment
  0,                          -- is_deleted
  NULL,                       -- link
  1,                          -- users_id
  0,                          -- tickets_id
  NULL,                       -- sha1sum
  0,                          -- is_blacklisted
  'manual',                   -- tag
  NOW()                       -- date_creation
),
(
  1,                          -- entities_id
  0,                          -- is_recursive
  'Network Diagram',          -- name
  'network_diagram.png',      -- filename
  '/files/network_diagram.png', -- filepath
  2,                          -- documentcategories_id
  'image/png',                -- mime
  NOW(),                      -- date_mod
  'Logical and physical network layout.', -- comment
  0,                          -- is_deleted
  NULL,                       -- link
  2,                          -- users_id
  0,                          -- tickets_id
  NULL,                       -- sha1sum
  0,                          -- is_blacklisted
  'diagram',                  -- tag
  NOW()                       -- date_creation
);

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
  1,                -- entities_id
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
  1,                -- entities_id
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
  1,                   -- entities_id
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
  1,                   -- entities_id
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
  1,                 -- entities_id
  0,                 -- is_recursive
  1,                 -- locations_id
  0,                 -- is_deleted
  NOW(),             -- date_mod
  NOW(),             -- date_creation
  NULL               -- pictures
),
(
  'Backup DC',       -- name
  1,                 -- entities_id
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
  1,                  -- entities_id
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
  1,                  -- entities_id
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


-- === DOMAINS ===
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
  1,               -- entities_id
  0,               -- is_recursive
  1,               -- domaintypes_id
  '2030-12-31',    -- date_expiration
  '2015-01-01',    -- date_domaincreation
  0,               -- users_id_tech
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
  1,               -- entities_id
  0,               -- is_recursive
  2,               -- domaintypes_id
  NULL,            -- date_expiration
  '2010-06-15',    -- date_domaincreation
  0,               -- users_id_tech
  0,               -- groups_id_tech
  0,               -- is_deleted
  'Internal domain for Active Directory.', -- comment
  0,               -- is_template
  NULL,            -- template_name
  1,               -- is_active
  NOW(),           -- date_mod
  NOW()            -- date_creation
);


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
  1,                  -- entities_id
  0,                  -- is_recursive
  'Firewall Appliance', -- name
  0,                  -- is_deleted
  1,                  -- appliancetypes_id
  'Network edge firewall appliance', -- comment
  0,                  -- locations_id
  0,                  -- manufacturers_id
  0,                  -- applianceenvironments_id
  0,                  -- users_id
  0,                  -- users_id_tech
  0,                  -- groups_id
  0,                  -- groups_id_tech
  NOW(),              -- date_mod
  NOW(),              -- date_creation
  0,                  -- states_id
  NULL,               -- externalidentifier
  'FW123456',         -- serial
  NULL,               -- otherserial
  'IT Department',    -- contact
  '123-456-7890',     -- contact_num
  1,                  -- is_helpdesk_visible
  NULL                -- pictures
),
(
  1,                  -- entities_id
  0,                  -- is_recursive
  'NAS Appliance',    -- name
  0,                  -- is_deleted
  2,                  -- appliancetypes_id
  'Storage appliance for backup and archiving', -- comment
  0,                  -- locations_id
  0,                  -- manufacturers_id
  0,                  -- applianceenvironments_id
  0,                  -- users_id
  0,                  -- users_id_tech
  0,                  -- groups_id
  0,                  -- groups_id_tech
  NOW(),              -- date_mod
  NOW(),              -- date_creation
  0,                  -- states_id
  NULL,               -- externalidentifier
  'NAS987654',        -- serial
  NULL,               -- otherserial
  'Storage Team',     -- contact
  '987-654-3210',     -- contact_num
  1,                  -- is_helpdesk_visible
  NULL                -- pictures
);

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
  1,                 -- entities_id
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
  1,                 -- entities_id
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
  is_deleted_ldap, groups_id, users_id_supervisor
) VALUES
  ('admin', 'Admin', 'Super', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  ('jdoe', 'Doe', 'John', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  ('jsmith', 'Smith', 'Jane', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- === GROUPS ===
INSERT INTO glpi_groups (
  entities_id, is_recursive, name, comment, ldap_field, ldap_value, ldap_group_dn,
  date_mod, groups_id, completename, level, ancestors_cache, sons_cache,
  is_requester, is_watcher, is_assign, is_task, is_notify, is_itemgroup,
  is_usergroup, is_manager, date_creation
) VALUES
  (1, 0, 'IT Department', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, NULL),
  (1, 0, 'Support Team', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, NULL),
  (1, 0, 'Developers', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, NULL),
  (1, 1, 'Managers', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, NULL);

-- === LOCATIONS ===
INSERT INTO glpi_locations (
  entities_id, is_recursive, name, locations_id, completename, comment, level,
  ancestors_cache, sons_cache, address, postcode, town, state, country,
  building, room, latitude, longitude, altitude, date_mod, date_creation
) VALUES
  (1, 0, 'Headquarters', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  (1, 0, 'Branch Office', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


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
  ('In Use', 1, 0, NULL, 0, NULL, 0, NULL, NULL,
   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
   1, 1, 1, 1, 1, 1, 1, 1,
   NULL, NULL),
   
  ('In Stock', 1, 0, NULL, 0, NULL, 0, NULL, NULL,
   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
   1, 1, 1, 1, 1, 1, 1, 1,
   NULL, NULL),
   
  ('Retired', 1, 0, NULL, 0, NULL, 0, NULL, NULL,
   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
   1, 1, 1, 1, 1, 1, 1, 1,
   NULL, NULL);

-- === PROFILES ===
INSERT INTO glpi_profiles (
  name, interface, is_default, helpdesk_hardware, helpdesk_item_type, ticket_status,
  date_mod, comment, problem_status, create_ticket_on_login,
  tickettemplates_id, changetemplates_id, problemtemplates_id, change_status,
  managed_domainrecordtypes, date_creation
) VALUES
  (
    'Super-Admin', 'central', 1, 0, NULL, NULL,
    NULL, NULL, NULL, 0,
    0, 0, 0, NULL,
    NULL, NULL
  ),
  (
    'Technician', 'helpdesk', 0, 0, NULL, NULL,
    NULL, NULL, NULL, 0,
    0, 0, 0, NULL,
    NULL, NULL
  ),
  (
    'User', 'central', 0, 0, NULL, NULL,
    NULL, NULL, NULL, 0,
    0, 0, 0, NULL,
    NULL, NULL
  ),
  (
    'Observer', 'helpdesk', 0, 0, NULL, NULL,
    NULL, NULL, NULL, 0,
    0, 0, 0, NULL,
    NULL, NULL
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
    'Migration Project', NULL, 1, 0, 0, 0, 0, 
    0, NULL, NULL, 0, 0, NULL, 
    NULL, NULL, NULL, 0, 0, 
    0, NULL, NULL, 0, NULL, 
    0, 0, NULL
  ),
  (
    'Upgrade Project', NULL, 1, 0, 0, 0, 0, 
    0, NULL, NULL, 0, 0, NULL, 
    NULL, NULL, NULL, 0, 0, 
    0, NULL, NULL, 0, NULL, 
    0, 1, NULL
  );

-- === REMINDERS ===
INSERT INTO glpi_reminders (
  uuid, date, users_id, name, text, begin, end,
  is_planned, date_mod, state, begin_view_date, end_view_date, date_creation
) VALUES
('a1b2c3d4-e5f6-7890-abcd-000000000001', NOW(), 1, 'Monthly Maintenance', 'Perform routine maintenance on servers', '2025-08-10 09:00:00', '2025-08-10 12:00:00', 1, NOW(), 0, '2025-08-08 00:00:00', '2025-08-10 12:00:00', NOW()),

('a1b2c3d4-e5f6-7890-abcd-000000000002', NOW(), 2, 'License Renewal', 'Renew antivirus licenses before expiration', '2025-08-15 08:00:00', '2025-08-15 10:00:00', 1, NOW(), 1, '2025-08-10 00:00:00', '2025-08-15 10:00:00', NOW()),

('a1b2c3d4-e5f6-7890-abcd-000000000003', NOW(), 3, 'Team Meeting', 'Discuss Q3 project updates', '2025-08-12 14:00:00', '2025-08-12 15:30:00', 1, NOW(), 0, '2025-08-10 00:00:00', '2025-08-12 15:30:00', NOW());

-- === RSS FEEDS ===
INSERT INTO glpi_rssfeeds (
  name, users_id, comment, url, refresh_rate, max_items,
  have_error, is_active, date_mod, date_creation
) VALUES
('GLPI News Feed', 1, 'Official GLPI project updates and news.', 'https://glpi-project.org/news/feed/', 86400, 20, 0, 1, NOW(), NOW()),

('TechCrunch - Startups', 2, 'Startup news and articles from TechCrunch.', 'https://techcrunch.com/startups/feed/', 43200, 15, 0, 1, NOW(), NOW()),

('Security Weekly', 3, 'Cybersecurity alerts and research from Security Weekly.', 'https://securityweekly.com/feed/', 86400, 25, 0, 1, NOW(), NOW());

-- === KNOWLEDGE BASE ===
INSERT INTO glpi_knowbaseitems (
  name, answer, users_id, date_creation, date_mod
) VALUES
('How to reset password', 'Go to login page and click "Forgot password".', 1, NOW(), NOW()),
('Printer troubleshooting', 'Check paper tray and toner.', 2, NOW(), NOW());

-- === RESERVATIONS ===
INSERT INTO glpi_reservationitems (itemtype, entities_id, is_recursive, items_id, comment, is_active)
VALUES
  ('Computer', 1, 0, 1, 'Workstation-01 available', 1),
  ('Computer', 1, 0, 2, 'Workstation-02 available', 1),
  ('Computer', 1, 0, 3, 'Laptop-01 for travel use', 1);

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
  'Open Tickets', 0, 'Ticket', 1,
  1, 0, 0,
  'status=1&priority=2', 1690000000, 2,
  NOW(), 5
),
(
  'All Computers', 0, 'Computer', 1,
  1, 0, 0,
  'is_deleted=0', 1690000500, 2,
  NOW(), 12
);

-- === NOTIFICATION QUEUE ===
INSERT INTO glpi_queuednotifications (
  itemtype, items_id, notificationtemplates_id, entities_id, is_deleted,
  sent_try, create_time, send_time, sent_time, name,
  sender, sendername, recipient, recipientname, replyto,
  replytoname, headers, body_html, body_text, messageid,
  documents, mode, event
) VALUES
  (
    NULL, 0, 1, 0, 0,
    0, NULL, NULL, NULL, NULL,
    NULL, NULL, 'admin@example.com', NULL, NULL,
    NULL, NULL, NULL, NULL, NULL,
    NULL, 'mail', NULL
  ),
  (
    NULL, 0, 2, 0, 0,
    0, NULL, NULL, NULL, NULL,
    NULL, NULL, 'support@example.com', NULL, NULL,
    NULL, NULL, NULL, NULL, NULL,
    NULL, 'mail', NULL
  );

-- === LOGS ===
INSERT INTO glpi_logs (
  itemtype, items_id, itemtype_link, linked_action, user_name,
  date_mod, id_search_option, old_value, new_value
) VALUES
  (
    'Computer', 1, '', 0, NULL,
    NOW(), 1, 'old', 'new'
  ),
  (
    'Ticket', 2, '', 0, NULL,
    NOW(), 2, 'pending', 'closed'
  );

-- === UNIQUENESS (for field unicity) ===
INSERT INTO glpi_fieldunicities (name, is_recursive, itemtype, entities_id, fields, is_active, action_refuse, action_notify) VALUES
  ('Unique Serial', 0, 'Computer', 1, 'serial', 1, 1, 0),
  ('Unique Email', 1, 'User', 1, 'email', 1, 1, 1);

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