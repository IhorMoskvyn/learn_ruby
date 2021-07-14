class RPNCalculator
  def initialize
    @kek = []
    @sum = 0
  end
  def push(f)
    @kek.push(f)
  end

  def plus
    @kek.each { |i| @sum +=i }

  end

  def value
    @sum
  end
end