
-- *** The Lost Letter ***
SELECT id FROM addresses WHERE address = '900 Somerville Avenue';
SELECT * FROM packages WHERE from_address_id = 432;
SELECT * FROM scans WHERE package_id = 384;
SELECT * FROM addresses WHERE id = 854;

-- *** The Devious Delivery ***
SELECT * FROM packages WHERE from_address_id IS NULL;
SELECT * FROM scans WHERE package_id IN ( 
    SELECT id FROM packages WHERE from_address_id IS NULL
);
SELECT * FROM addresses WHERE id = 348;

-- *** The Forgotten Gift ***
SELECT * FROM packages WHERE from_address_id IN (
    SELECT id FROM addresses WHERE address = '109 Tileston Street'
);
SELECT * FROM scans WHERE package_id = 9523;
SELECT * FROM drivers WHERE id = 17;