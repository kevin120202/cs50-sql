SELECT players.first_name, players.last_name, salaries.salary, performances.year, performances.HR FROM players
JOIN salaries ON players.id = salaries.player_id
JOIN performances ON players.id = performances.player_id
WHERE salaries.year = performances.year
ORDER BY players.id, performances.year DESC, performances.HR DESC;