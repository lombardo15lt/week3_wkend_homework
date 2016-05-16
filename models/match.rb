require( 'pg' )
require_relative('../db/sql_runner')

class Match

  attr_reader( :id, :home_team_id, :away_team_id, :home_team_score, :away_team_score)

  def initialize( options )
    @id = options['id'].to_i
    @home_team_id = options['home_team_id']
    @away_team_id = options['away_team_id']
    @home_team_score = options['home_team_score']
    @away_team_score = options['away_team_score']
  end

  def save()
    sql = "INSERT INTO matchs (home_team_id, away_team_id, home_team_score, away_team_score) VALUES ('#{ @home_team_id }', '#{ @away_team_id }', '#{ @home_team_score }', '#{ @away_team_score }');"
    db.exec ( sql )
    db.close()
  end

  def self.all()
    sql = "SELECT * matchs"
    players = db.exec( sql )
    db.close()
    return matchs.map { |match| Match.new( team )}
  end

  def update()  
      db = PG.connect(  { dbname: 'dodgeball', host: 'localhost' }    )

      sql = "UPDATE matchs
             SET home_team_id = '#{@home_team_id}',
             SET away_team_id = '#{@away_team_id}',
             SET home_team_score = '#{@home_team_score}',
             SET away_team_score = '#{@away_team_score}',
        WHERE id = #{@id}"
        db.exec( sql )
        db.close
  end

  def self.delete_all
    sql = "DELETE FROM matchs WHERE id = #{@id}"
        db.exec( sql )
        db.close
  end

  def self.map_items(sql)
    matchs = SqlRunner.run(sql)
    result = matchs.map { |player| Match.new( team ) }
    return result
  end

  def self.map_item(sql)
    result = Match.map_items(sql)
    return result.first
  end

  def players
      sql =
      "SELECT m.*
      FROM matchs m
      INNER JOIN matchs op
      ON op.match_id = m.id
      WHERE match_id = #{@id}"
      return Match.map_item(sql)

  end

end