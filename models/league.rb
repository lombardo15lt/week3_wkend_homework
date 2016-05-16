require( 'pg' )
require_relative('../db/sql_runner')

class League

  attr_reader( :id, :team)

  def initialize( options )
    @id = options['id'].to_i
    @team = options['team']
  end

  def save()
    sql = "INSERT INTO leagues (team VALUES ('#{ @team}');"
    db.exec ( sql )
    db.close()
  end

  def self.all()
    sql = "SELECT * leagues"
    leagues = db.exec( sql )
    db.close()
    return leagues.map { |league| League.new( team )}
  end

  def update()  
      db = PG.connect(  { dbname: 'dodgeball', host: 'localhost' }    )

      sql = "UPDATE leagues
             SET team = '#{@team}',
        WHERE id = #{@id}"
        db.exec( sql )
        db.close
  end

  def self.delete_all
    sql = "DELETE FROM leagues"
    SqlRunner.run(sql)    
  end

  def self.map_items(sql)
    leagues = SqlRunner.run(sql)
    result = leagues.map { |league| League.new( team ) }
    return result
  end

  def self.map_item(sql)
    result = League.map_items(sql)
    return result.first
  end

  def players
      sql =
      "SELECT l.*
      FROM leagues l
      INNER JOIN leagues op
      ON op.match_id = l.id
      WHERE match_id = #{@id}"
      return League.map_item(sql)

  end

end




































require( 'pg')
require_relative('../db/sql_runner')

class Course

  attr_reader( :id, :name )

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO Leagues (name) VALUES ('#{ @name }') RETURNING *"
    return Course.map_item( sql )
  end

  def self.all()
    sql = "SELECT * FROM Leagues"
    return League.map_items(sql)
  end

  def leagues
    sql = 
    "SELECT l.* 
    FROM leagues l
    INNER JOIN leagues op
    ON op.course_id = c.id
    WHERE course_id = #{@id}"
    return Course.map_items(sql)
  end

  def self.delete_all
    sql = "DELETE FROM Courses"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
      courses = SqlRunner.run(sql)
      result = courses.map { |course| Course.new( course ) }
      return result
  end

  def self.map_item(sql)
    result = Student.map_items(sql)
    return result.first
  end

end


require( 'pg' )
require_relative('../db/sql_runner')

class Match

  attr_reader( :id, :home_team_score, :away_team_score,
    :home_team_id, :away_team_id)

  def initialize( options )
    @id = options['id'].to_i
    @home_team_score = options['home_team_score']
    @away_team_score = options['away_team_name']
    @home_team_id = options['home_team_id']
    @away_team_id = options['away_team_id']
  end

  def save()
    sql = "INSERT INTO teams (name) VALUES ('#{ @name}') RETURNING *"
    return Student.map_item( sql )
  end

  def self.all()
    sql = "SELECT * FROM Matchs"
    return Student.map_items(sql)
  end

  def self.delete_all
    sql = "DELETE FROM Matchs"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    matchs = SqlRunner.run(sql)
    result = matchs.map{ |match| Match.new(
      match )}
    return result
  end

  def self.map_item(sql)
    result = Match.map_items(sql)
    return result.first
  end

  def students
    sql = 
    "SELECT s.*
    FROM students s
    INNER JOIN students op
    ON op.student_id = s.id
    WHERE student_id = #{@id}}"
    return Student.map_items(sql)
  end

  def self_delete_all
    sql = "DELETE FROM Students"
    SqlRunner.run(sql)
  end


  # def self.map_items(sql)
  #   students = SqlRunner.run(sql)
  #   result = students.map { |student| Course.new( course ) }
  #   return result
  # end

end








































