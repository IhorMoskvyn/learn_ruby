class Temperature

  def self.from_fahrenheit(f)
    Temperature.new(f: f)
  end

  def self.from_celsius(c)
    Temperature.new(c: c)
  end

  def initialize(options={})
    @fahrenheit = options[:f]
    @celsius = options[:c]
  end

  def in_fahrenheit
    @fahrenheit ||= (@celsius * (9.0 / 5.0)) + 32
  end

  def in_celsius
    @celsius ||= (@fahrenheit - 32) * 5.0 / 9.0
  end
end

class Celsius < Temperature
  def initialize(c)
    super(c: c)
  end
end

class Fahrenheit < Temperature
  def initialize(f)
    super(f: f)
  end
end