class Array
  def sum
    sum = 0
    self.each { |i| sum += i }
    sum
  end
  def square
    map {|a| a**2}
  end
  def square!
    map! {|a| a**2}
  end
end