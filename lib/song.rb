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

  def self.find_or_create_by_name(name)
    song=find_by_name(name)
    if song
      song
    else
      create(name)
  end
end

end
