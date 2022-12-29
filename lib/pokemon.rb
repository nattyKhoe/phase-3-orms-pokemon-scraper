require 'scraper.rb'
require_relative '../bin/environment.rb'
class Pokemon < Scraper
    attr_accessor :name, :id, :type, :db
    def initialize (id:, name:, type:, db:)
        @id, @name, @type, @db = id, name, type, db
    end

    def self.save (name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?,?);"
        db.execute(sql, name, type)
    end

    def self.find(id_num, db)
        pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
        Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
    end

end
