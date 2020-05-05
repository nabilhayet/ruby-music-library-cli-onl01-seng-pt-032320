require 'pry'
class Song
  extend Concerns::Findable
attr_accessor :name, :artist, :genre
@@all =[]
  def initialize(name,artist=nil,genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save
  end

  def self.create(name)
    song=Song.new(name)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def genre=(genre)
    @genre =genre
    genre.songs << self unless genre.songs.include? self
  end

  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end

  def self.create_from_filename(name)
    new_from_filename(name).save
  end


  def self.new_from_filename(file_name)
      artist,song,genre = file_name.split(" - ")
      binding.pry
      artist = Artist.find_or_create_by_name(artist)

      genre = Genre.find_or_create_by_name(genre)
      new(song,artist,genre)
end
end
