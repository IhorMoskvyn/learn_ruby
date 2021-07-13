class Book
  def title
    @title
  end

  def title=(title)
    little_words = %w(if or in a and an the of to)
    @title = title.capitalize.gsub(/(\w+)/) do |title|
      little_words.include?(title) ? title : title.capitalize
    end
  end
end