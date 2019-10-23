class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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

  def self.create(name)
    song = new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs.push self if not genre.songs.include?(self)
  end

  def self.find_by_name(fname)
    all.detect {|song| song.name == fname}
  end

  def self.find_or_create_by_name(fname)
    find_by_name(fname) || create(fname)
  end

  def self.new_from_filename(name)
    
  end

end
