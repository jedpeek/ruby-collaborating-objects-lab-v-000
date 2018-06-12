
class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(@path)
    @files.delete_if{|file| file.length < 4}
    @files
  end

  def import
    @files
    @files.each {|file| Song.new_by_filename(file)}
  end
end
