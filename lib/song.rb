require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if(find_by_name(name))
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    filename.slice!(".mp3")
    delimeter = " - "
    arr = filename.split(delimeter)
    song = self.new
    song.name = arr[1]
    song.artist_name = arr[0]
    song
  end

  def self.create_from_filename(filename)
    filename.slice!(".mp3")
    delimeter = " - "
    arr = filename.split(delimeter)
    song = self.new
    song.name = arr[1]
    song.artist_name = arr[0]
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end