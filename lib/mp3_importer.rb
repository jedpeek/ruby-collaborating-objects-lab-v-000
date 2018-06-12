
class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  #def files
  #  @files = Dir.entries(@path)
  #  @files.delete_if{|file| file.length < 4}
  #end

  def files
   @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
 end

  def import
    files.each {|file| Song.new_by_filename(file)}
  end
end
