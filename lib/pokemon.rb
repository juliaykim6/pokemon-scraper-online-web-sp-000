class Pokemon

attr_accessor :id, :name, :type, :db

   def initialize(id:nil, name:nil, type:nil, db:nil)
        @id = id
        @name = name
        @type = type
        @db = db
    end
    
    def self.new_from_db(row)
        new_pkmn = self.new
        new_pkmn.id = row[0]
        new_pkmn.name = row[1]
        new_pkmn.type = row[2]
        new_pkmn
    end
    
    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
            SQL
        db.execute(sql, name, type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end
    
    def self.find
      sql = "SELECT * FROM pokemon WHERE name = ?"
      result = DB[:conn].execute(sql, name, type)[0]
      Pokemon.new(resul)
end
