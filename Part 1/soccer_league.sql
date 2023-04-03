-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS soccer_leagues_db;

CREATE DATABASE soccer_leagues_db;

\c soccer_leagues_db

CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  team_id INT NOT NULL REFERENCES teams(id)
);

CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  home_team_id INT NOT NULL REFERENCES teams(id),
  away_team_id INT NOT NULL REFERENCES teams(id)
);

CREATE TABLE goals (
  id SERIAL PRIMARY KEY,
  match_id INT NOT NULL REFERENCES matches(id),
  player_id INT NOT NULL REFERENCES players(id)
);

CREATE TABLE referees (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE match_referees (
  match_id INT NOT NULL REFERENCES matches(id),
  referee_id INT NOT NULL REFERENCES referees(id)
);

INSERT INTO teams (name) VALUES
('Team A'),
('Team B'),
('Team C'),
('Team D');

INSERT INTO players (name, team_id) VALUES
('Player 1', 1),
('Player 2', 1),
('Player 3', 2),
('Player 4', 2),
('Player 5', 3),
('Player 6', 3),
('Player 7', 4),
('Player 8', 4);

-- Sample data for matches
INSERT INTO matches (home_team_id, away_team_id) VALUES
(1, 2),
(3, 4),
(1, 3);

-- Sample data for goals
INSERT INTO goals (player_id, match_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(3, 2),
(5, 3),
(6, 3),
(8, 3);

-- Sample data for referees
INSERT INTO referees (name) VALUES
('Referee A'),
('Referee B'),
('Referee C');

-- Sample data for match_referees
INSERT INTO match_referees (match_id, referee_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 2),
(3, 3);
