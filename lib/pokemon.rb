require 'pry'
class Pokemon

    attr_accessor :id, :name, :type, :db



    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        
    db.execute("INSERT INTO pokemon (name, type) 
    VALUES (?, ?)", name , type)
    # @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
          
    end

    def self.find(id, db)
        sql = <<-SQL
        SELECT *
        FROM pokemon
        WHERE id = ?
       
      SQL
      new_pokemon = db.execute(sql, id).flatten
        
        #   binding.pry 
            id = new_pokemon[0]
            name = new_pokemon[1]
            type = new_pokemon[2]
            new_pokemon = self.new(id: id, name: name, type: type, db: db)
        new_pokemon
       
        
    end
end
