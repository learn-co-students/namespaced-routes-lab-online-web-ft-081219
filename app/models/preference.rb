class Preference < ActiveRecord::Base
    def self.get_or_create
        self.first ? self.first : self.create
    end

    def self.allow_create_artists?
        self.get_or_create.allow_create_artists
    end

    def self.allow_create_songs?
        self.get_or_create.allow_create_songs
    end
end