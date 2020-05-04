class Genre
attr_accessor :name, :songs
@@all =[]
  def initialize(name)
    @name = name
    save
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
end
