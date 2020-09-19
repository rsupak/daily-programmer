class Song
  attr_accessor :name, :artist, :duration

  @@plays = 0
  def initialize(name, artist, duration)
    @name       = name
    @artist     = artist
    @duration   = duration
    @plays      = 0
  end

  def to_s
    "Song: #{@name} - #{@artist} ( #{@duration} )"
  end

  def duration_in_minutes
    @duration / 60.0 # Forces a float.
  end

  def play
    @plays  += 1
    @@plays += 1
    "#{@name}: #{@plays} plays. #{@@plays} plays in total."
  end
end
