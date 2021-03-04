require "pry"
class Pokemon
    attr_accessor :name, :db, :type, :id
    def initialize(db, name=" ", type=" ", id=0)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        # db.execute(INSERT INTO pokemon (name, type) VALUES (@name, @type));
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)

    end

    def self.find(id, db)
        pokemoninfo = db.execute(" SELECT * FROM pokemon WHERE pokemon.id = (?)", id).flatten(1)
        pokemon_id = pokemoninfo[0]
        pokemon_name = pokemoninfo[1]
        pokemon_type = pokemoninfo[2]
        Pokemon.new(db, pokemon_name, pokemon_type, pokemon_id)
        # binding.pry
    end
end
