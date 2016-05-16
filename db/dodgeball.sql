DROP TABLE leagues;
DROP TABLE teams;
DROP TABLE players;
DROP TABLE matchs;


CREATE TABLE teams (
  id serial4 primary key,
  name VARCHAR(255),
  location VARCHAR(255)
  );

CREATE TABLE matchs (
  id serial4 primary key,
  home_team_id int4,
  away_team_id int4,
  home_team_score int4,
  away_team_score int4
  );

CREATE TABLE players (
  id serial4 primary key,
  name VARCHAR(255)
  );


CREATE TABLE leagues (
  id serial4 primary key,
  league_team VARCHAR(255),
  games_played int4,
  games_won int4,
  games_lost int4,
  points_total int4
  );

