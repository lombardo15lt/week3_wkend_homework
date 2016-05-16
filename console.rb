require_relative( 'models/league.rb' )
require_relative( 'models/match.rb' )
require_relative( 'models/player.rb' )
require_relative( 'models/team.rb' )
require( 'pry-byebug' )
require( 'pg' )

League.delete_all()
Match.delete_all()
Player.delete_all()
Team.delete_all()


team1 = Team.new({ 'name' => 'Smokies', 'location' => 'Arbroath'})
team2 = Team.new({ 'name' => 'Eeehhhsss', 'location' => 'Dundee'})
team3 = Team.new({ 'name' => 'Gowfers', 'location' => 'Carnoustie'})
team3 = Team.new({ 'name' => 'Bridies', 'location' => 'Forfar'})
team3 = Team.new({ 'name' => 'Granites', 'location' => 'Aberdeen'})

t1 = team1.save()
t2 = team2.save()
t3 = team3.save()
t4 = team4.save()
t5 = team5.save()

match1 = Match.new({ 'home-town_scorer' => 'Allan Harrison', 'away_team_scorer' => 'Dimitri Medov',
  'hometown_id' => 1, awayteam_id => 2})
match2 = Match.new({ 'home-town_scorer' => 'Alberto Balsam', 'away_team_scorer' => 'Ilya Kuriakin',
  'hometown_id' => 3, awayteam_id => 4})
match3 = Match.new({ 'home-town_scorer' => 'Kevin Sheedy', 'away_team_scorer' => 'Pavel Nedved',
  'hometown_id' => 5, awayteam_id => 6})
match4 = Match.new({ 'home-town_scorer' => 'Al Pacino', 'away_team_scorer' => 'Jennifer Saunders',
  'hometown_id' => 7, awayteam_id => 8})
match5 = Match.new({ 'home-town_scorer' => 'Oleg Kutnetsov', 'away_team_scorer' => 'Brian Dolittle',
  'hometown_id' => 9, awayteam_id => 10})

m1 = match1.save()
m2 = match2.save()
m3 = match3.save()
m4 = match4.save()
m5 = match5.save()


player1 = Player.new({'player_id' => 1, 'name' => 'Kurt Cobain'})
player2 = Player.new({'player_id' => 2, 'name' => 'Ronnie Corbet'})
player3 = Player.new({'player_id' => 3, 'name' => 'Elvis Pressly'})
player4 = Player.new({'player_id' => 4, 'name' => 'John Lennon'})
player5 = Player.new({'player_id' => 5, 'name' => 'Jimmy Page'})

p1 = player1.save()
p2 = player2.save()
p3 = player3.save()
p4 = player4.save()
p5 = player5.save()

league1 = Player.new({'league_team'  => t1.id, 'games_played' => 8, 'games_won' => 8, 'games_lost' => 0, 'points_total' => 16})
league2 = Player.new({'league_team'  => t2.id, 'games_played' => 8, 'games_won' => 7, 'games_lost' => 1, 'points_total' => 14})
league3 = Player.new({'league_team'  => t3.id, 'games_played' => 8, 'games_won' => 6, 'games_lost' => 2, 'points_total' => 12})
league4 = Player.new({'league_team'  => t4.id, 'games_played' => 8, 'games_won' => 5, 'games_lost' => 3, 'points_total' => 10})
league5 = Player.new({'league_team'  => t5.id, 'games_played' => 8, 'games_won' => 4, 'games_lost' => 4, 'points_total' => 8})

l1 = league1.save()
l2 = league2.save()
l3 = league3.save()
l4 = league4.save()
l5 = league5.save()

binding.pry
nil
