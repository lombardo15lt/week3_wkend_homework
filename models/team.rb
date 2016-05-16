require( 'pg' )
require_relative('../db/sql_runner')

class Team 

  attr_reader( :id, :name, :location )

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @location = options['location']
  end

  def save()
    sql = "INSERT INTO teams (name, location) VALUES ('#{ @name }', '#{ @location }');"
    
    db.exec ( sql )
    db.close()
  end

  def self.all()
    sql = "SELECT * teams"
    teams = db.exec( sql )
    db.close()
    return teams.map { |team| Team.new( team )}
  end

  def update()   # instance method
      db = PG.connect(  { dbname: 'dodgeball', host: 'localhost' }    )

      sql = "UPDATE teams
             SET name = '#{@name}',
                 location = '#{@location}',
        WHERE id = #{@id}"
        db.exec( sql )
        db.close
  end

  def self.delete_all
    sql = "DELETE FROM teams WHERE id = #{@id}"
        db.exec( sql )
        db.close
  end

  def self.map_items(sql)
    teams = SqlRunner.run(sql)
    result = teams.map { |team| Team.new( team ) }
    return result
  end

  def self.map_item(sql)
    result = Team.map_items(sql)
    return result.first
  end

  def teams
      sql =
      "SELECT t.*
      FROM teams t
      INNER JOIN teams op
      ON op.team_id = t.id
      WHERE team_id = #{@id}"
      return Team.map_item(sql)

  end

end