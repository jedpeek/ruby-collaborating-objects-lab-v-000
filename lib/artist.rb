require 'pry'
class Artist
  attr_accessor :name, :songs, :artist
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song)
    @songs << song
  end

  def self.all
    @@all.uniq!
    @@all
  end

  def save

  end

  def self.find_or_create_by_name(name)
    @@all.each do |artist|
      if artist.name == name
        return artist
      else
        self.new(name).tap {|artist| artist.save}
      end
    end
   end


  def print_songs
    songs.each{|song| puts song.name}
  end

end
