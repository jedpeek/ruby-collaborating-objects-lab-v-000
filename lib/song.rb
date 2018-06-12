class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    name = filename.split(" - ")[1]
    artist = filename.split(" - ")[0]
    song = self.new(name)
    self.artist = Artist.find_or_create_by_name(name)
    Artist.add_song(self)
  end

  def artist_name=(name)
    @artist = artist
  end
end
