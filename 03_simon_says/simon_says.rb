def echo(echo)
  "#{echo}"
end

def shout(shout)
  "#{shout}".upcase
end

def repeat(word, repeats=2)
  ([word] * repeats).join(" ")
end

def start_of_word(word,n)
  b = word.split("").first(n)
  b.to_s.delete("^a-zA-Z0-9")
end

def first_word(word)
  b = word.split(" ").first
  b.to_s
end

def titleize(word)
  little_words = %w(end over and the)
  word.capitalize.gsub(/(\w+)/) do |word|
    little_words.include?(word) ? word : word.capitalize
  end
end
