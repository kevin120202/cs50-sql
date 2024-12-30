CREATE VIEW june_vacancies AS
SELECT listings.id, listings.property_type, listings.host_name, temp.days_vacant FROM listings
JOIN (
    SELECT listing_id, COUNT(*) AS days_vacant FROM availabilities 
    WHERE date LIKE '%2023-06%' AND available = 'TRUE'
    GROUP BY listing_id
) AS temp
ON listings.id = temp.listing_id;