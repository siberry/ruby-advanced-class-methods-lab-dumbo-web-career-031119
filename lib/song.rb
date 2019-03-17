require 'pry'

class Song
  attr_accessor :name, :artist_name, :file_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end
  
  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title
    song
  end
  
  def self.create_by_name(song_title)
    song = self.create
    song.name = song_title
    song
  end
  
  def self.find_by_name(name)
    all.find { |song| song.name == name }
  end
  
  def self.song_names
    all.map do |song|
      song.name
    end
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end
  
  def self.new_from_filename(filename)
    artist_and_name = filename.split(" - ")
    name = artist_and_name[1].split(".")[0]
    artist = artist_and_name[0]
    
    song = self.create_by_name(name)
    song.artist_name = artist
    song
  end
  
  def self.create_from_filename(filename)
    artist_and_name = filename.split(" - ")
    name = artist_and_name[1].split(".")[0]
    artist = artist_and_name[0]
    
    song = self.create_by_name(name)
    song.artist_name = artist
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
    

end
