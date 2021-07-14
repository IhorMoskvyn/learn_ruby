class Dictionary
  def initialize(hash = {})
    @hash = hash
  end
  def entries
    @hash
  end

  def add(f)
    if f.is_a?(String)
      @hash[f] = nil
    else
      f.each do |x, y|
        @hash[x] = y
      end
    end
  end

  def keywords
    @hash.keys.sort
  end

  def include?(keyword)
    @hash.keys.include?(keyword)
  end

  def find(f)
    @hash.select { |word| word.scan(f).join == f}
  end

  def printable
    keywords.map { |keyword| "[#{keyword}] \"#{@hash[keyword]}\"" }.join("\n")
  end
end

