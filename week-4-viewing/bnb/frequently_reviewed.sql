CREATE VIEW frequently_reviewed AS
SELECT listings.id, listings.property_type, listings.host_name, temp.reviews FROM listings
JOIN (
    SELECT listing_id, COUNT(*) AS reviews FROM reviews
    GROUP BY listing_id
) AS temp
ON listings.id = temp.listing_id
ORDER BY temp.reviews DESC, listings.host_name;