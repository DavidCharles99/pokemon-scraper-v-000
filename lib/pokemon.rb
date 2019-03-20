class Pokemon
attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db

  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
array = db.execute("select * from pokemon where pokemon.id = ?;",id).flatten
poke_out = Pokemon.new(id:id,name:array[1],type:array[2],db:db,hp:array[3])
return poke_out
end
end
