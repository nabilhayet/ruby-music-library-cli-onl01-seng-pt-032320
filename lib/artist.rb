class Artist
  extend Concerns::Findable
attr_accessor :name, :songs
@@all =[]
  def initialize(name)
    @name = name
    @songs=[]
    save
  end

  def self.create(name)
    Artist.new(name)
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

  def self.find_by_name(name)
    @@all.detect{|artist| artist.name == name}
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def genres
    Song.all.map{|song| song.genre}.uniq
  end
end
