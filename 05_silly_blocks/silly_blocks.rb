def reverser
  block_result = yield
  str = block_result.split
  first_str = str[0].chars.inject([]){|s, c| s.unshift(c)}.join
  second_str = str[1]
  if (second_str == nil)
    str = first_str
  else
    second_str = str[1].chars.inject([]){|s, c| s.unshift(c)}.join
    str = ( first_str +" "+ second_str)
  end
end

def adder(n = 1)
  block_result = yield
  block_result + n
end

def repeater(n=1, &block)
  n.times &block
end
