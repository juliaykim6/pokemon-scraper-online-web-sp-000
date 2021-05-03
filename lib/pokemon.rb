class Pokemon

attr_accessor :id, :name, :type, :db

   def initialize(id:nil, name:nil, type:nil, db:nil)
        @id = id
        @name = name
        @type = type
        @db = db
    end
    
    def save
      if self.id 
        self.update
      else 
        sql = <<-SQL
        INSERT INTO pokemon (name, type, )
    
    
end
