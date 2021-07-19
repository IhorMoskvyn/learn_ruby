class Fixnum
  def in_words
    if self == 0
      "zero"
    elsif self > 999_999_999_999
      trillions(self)
    elsif self > 999_999_999
      billions(self)
    elsif self > 999_999
      millions(self)
    elsif self > 999
      thousands(self)
    elsif self > 99
      hundreds(self)
    elsif self > 9
      "#{tens(self)}"
    else
      "#{base(self)}"
    end

  end

  private

  def trillions(number)
    if number.between?(100_000_000_000_000, 999_999_999_999_999)
      if number % 1_000_000_000_000 == 0
        "#{hundreds(number/1_000_000_000_000)} trillion"
      else
        "#{hundreds(number/1_000_000_000_000)} trillion #{billions(number%1_000_000_000_000)}"
      end
    elsif number.between?(10_000_000_000_000, 99_999_999_999_999)
      if number % 1_000_000_000_000 == 0
        "#{tens(number/1_000_000_000_000)} trillion"
      else
        "#{tens(number/1_000_000_000_000)} trillion #{billions(number%1_000_000_000_000)}"
      end
    elsif number.between?(1_000_000_000_000, 9_999_999_999_999)
      if number % 1_000_000_000_000 == 0
        "#{base(number/1_000_000_000_000)} trillion"
      else
        "#{base(number/1_000_000_000_000)} trillion #{billions(number%1_000_000_000_000)}"
      end
    else
      millions(number)
    end
  end


  def billions(number)
    if number.between?(100_000_000_000, 999_999_999_999)
      if number % 1_000_000_000 == 0
        "#{hundreds(number/1_000_000_000)} billion"
      else
        "#{hundreds(number/1_000_000_000)} billion #{millions(number%1_000_000_000)}"
      end
    elsif number.between?(10_000_000_000, 99_999_999_999)
      if number % 1_000_000_000 == 0
        "#{tens(number/1_000_000_000)} billion"
      else
        "#{tens(number/1_000_000_000)} billion #{millions(number%1_000_000_000)}"
      end
    elsif number.between?(1_000_000_000, 9_999_999_999)
      if number % 1_000_000_000 == 0
        "#{base(number/1_000_000_000)} billion"
      else
        "#{base(number/1_000_000_000)} billion #{millions(number%1_000_000_000)}"
      end
    else
      millions(number)
    end
  end


  def millions(number)
    if number.between?(100_000_000, 999_999_999)
      if number % 1_000_000 == 0
        "#{hundreds(number/1_000_000)} million"
      else
        "#{hundreds(number/1_000_000)} million #{thousands(number%1_000_000)}"
      end
    elsif number.between?(10_000_000, 99_999_999)
      if number % 1_000_000 == 0
        "#{tens(number/1_000_000)} million"
      else
        "#{tens(number/1_000_000)} million #{thousands(number%1_000_000)}"
      end
    elsif number.between?(1_000_000, 9_999_999)
      if number % 1_000_000 == 0
        "#{base(number/1_000_000)} million"
      else
        "#{base(number/1_000_000)} million #{thousands(number%1_000_000)}"
      end
    else
      thousands(number)
    end
  end


  def thousands(number)
    if number.between?(100_000, 999_999)
      if number % 1000 == 0
        "#{hundreds(number/1000)} thousand"
      else
        "#{hundreds(number/1000)} thousand #{hundreds(number%1000)}"
      end
    elsif number.between?(10_000, 99_999)
      if number % 1000 == 0
        "#{tens(number/1000)} thousand"
      else
        "#{tens(number/1000)} thousand #{hundreds(number%1000)}"
      end
    elsif number.between?(1_000, 9_999)
      if number % 1000 == 0
        "#{base(number/1000)} thousand"
      else
        "#{base(number/1000)} thousand #{hundreds(number%1000)}"
      end
    else
      hundreds(number)
    end
  end


  def hundreds(number)
    if number % 100 == 0
      "#{base(number/100)} hundred"
    elsif number.between?(101, 999)
      "#{base(number/100)} hundred #{tens(number%100)}"
    else
      tens(number)
    end
  end


  def tens(number)
    teens = {
      11 => "eleven",
      12 => "twelve",
      13 => "thirteen",
      14 => "fourteen",
      15 => "fifteen",
      16 => "sixteen",
      17 => "seventeen",
      18 => "eighteen",
      19 => "nineteen"
    }

    tens = {
      1 => "ten",
      2 => "twenty",
      3 => "thirty",
      4 => "forty",
      5 => "fifty",
      6 => "sixty",
      7 => "seventy",
      8 => "eighty",
      9 => "ninety"
    }

    if number.between?(11, 19)
      teens[number]
    elsif number % 10 == 0
      tens[number/10]
    elsif number.between?(21, 99)
      "#{tens[number/10]} #{base(number%10)}"
    else
      base(number)
    end
  end


  def base(number)
    base_hash = {
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine"
    }

    base_hash[number]
  end
end