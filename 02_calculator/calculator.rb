def add(x,y)
  x + y
end

def subtract(x,y)
  x - y
end

def sum(array)
  sum = 0
  array.each { |i| sum += i }
  sum
end

def multiply(*num)
  result = 1
  num.each { |n| result = result * n }
  result
end

def power(x,y)
  x**y
end

def factorial(n)
  if n<= 1
    1
  else
    n * factorial( n - 1 )
  end
end

