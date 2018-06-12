class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    artist = filename.split(" - ")[0]
    title = filename.split(" - ")[1]
    song = self.new(title)
    song.artist_name = artist
    song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    binding.pry
    artist.add_song(self)
  end

end
