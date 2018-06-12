require 'pry'
class Song
  attr_accessor :name, :artist

  @@all = []
  def initialize(name)
    @name = name
  end

  def save
    @@all << self
  end

  def self.new_by_filename(filename)
    name = filename.split(" - ")[1]
    artist = filename.split(" - ")[0]
    song = self.new(name)
    song.artist_name = artist
    song.save
  end

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by_name(artist)
    artist.add_song(self)
  end

end
