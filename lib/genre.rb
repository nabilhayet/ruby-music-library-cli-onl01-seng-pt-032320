class Genre
attr_accessor :name, :songs
@@all =[]
  def initialize(name)
    @name = name
    save
  end

  def self.create(name)
    Genre.new(name)
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
end
