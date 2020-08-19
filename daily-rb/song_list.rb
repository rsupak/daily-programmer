require_relative 'song'

class SongList
  MAX_TIME = 5 * 60

  def initialize
    @songs = []
  end

  def <<(song)
    @songs << song
  end

  def delete_first
    @songs.shift
  end

  def delete_last
    @songs.pop
  end

  def [](index)
    "#{@songs[index].artist} - #{@songs[index].name}"
  end

  def too_long?(song)
    song.duration > MaxTime
  end
end

one_love = Song.new('One Love', 'Flobots', 260)
# puts one_love.name

list = SongList.new
list << one_love
puts list[0]
