SELECT listing_id, SUM(id) FROM reviews
GROUP BY listing_id LIMIT 20;