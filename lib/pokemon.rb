class Pokemon
    attr_accessor :name, :db, :type, :id
    def initialize(id, name, db, type)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        # db.execute(INSERT INTO pokemon (name, type) VALUES (@name, @type));
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)

    end
end
