SELECT year, HR FROM performances
WHERE player_id = (
    SELECT id FROM players
    WHERE first_name = 'Ken' AND last_name = 'Griffey'
    ORDER BY birth_year LIMIT 1
) ORDER BY year DESC;
    
