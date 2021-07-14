class Timer
  def initialize
    @seconds = seconds
  end

  def seconds
    @seconds = 0
  end

  def seconds=(seconds)
      @time_string = "%02d:%02d:%02d" % [seconds / 3600, seconds / 60 % 60, seconds % 60]
  end

  def time_string
    @time_string
  end

  def padded(padded)
    @padded = "%02d" % [padded]
  end
end