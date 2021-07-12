def translate(word)
  if word.start_with?('a','e','i','o','u')
    word<<'ay'
  else
    s=nil
    ['a','e','i','o','u'].each do |v|
      s = word.index(v)
      break unless s.nil?
    end
    unless s.nil?
      pre = word.partition(word[s,1]).first
      word.slice!(pre)
      word<<pre+'ay'
    else

    end
  end
end
