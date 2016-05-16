require( 'pg' )
require_relative('../db/sql_runner')

class Player 

  attr_reader( :id, :name )

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO players (name) VALUES ('#{ @name }');"
    
    db.exec ( sql )
    db.close()
  end

  def self.all()
    sql = "SELECT * players"
    players = db.exec( sql )
    db.close()
    return players.map { |player| Player.new( team )}
  end

  def update()  
      db = PG.connect(  { dbname: 'dodgeball', host: 'localhost' }    )

      sql = "UPDATE players
             SET name = '#{@name}',
                 location = '#{@location}',
        WHERE id = #{@id}"
        db.exec( sql )
        db.close
  end

  def self.delete_all
    sql = "DELETE FROM players WHERE id = #{@id}"
        db.exec( sql )
        db.close
  end

  def self.map_items(sql)
    players = SqlRunner.run(sql)
    result = players.map { |player| Player.new( team ) }
    return result
  end

  def self.map_item(sql)
    result = Player.map_items(sql)
    return result.first
  end

  def players
      sql =
      "SELECT p.*
      FROM players p
      INNER JOIN players op
      ON op.player_id = p.id
      WHERE player_id = #{@id}"
      return Player.map_item(sql)

  end

end