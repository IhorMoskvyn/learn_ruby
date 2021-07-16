class RPNCalculator
  def initialize
    @kek = []
    @sum = 0
  end
  def push(f)
    @kek.push(f)
  end

  def plus
    if has_enough
      @sum = @kek.last(2).sum
      @kek.pop(2)
      @kek.push(@sum)
    end
  end

  def minus
    if has_enough
      @sum = @kek.last(2).inject(:-)
      @kek.pop(2)
      @kek.push(@sum)
    end
  end

  def divide
    if has_enough
      @sum = @kek.last(2).map(&:to_f).inject(:/)
      @kek.pop(2)
      @kek.push(@sum)
    end
  end

  def times
    if has_enough
      @sum = @kek.last(2).inject(:*)
      @kek.pop(2)
      @kek.push(@sum)
    end
  end

  def tokens(string)
    string.split.map{ |s| s[/\d/] ? s.to_i : s.to_sym }
  end

  def evaluate(pol)
    @kek = []

    opps = {
      :+ => Proc.new{plus},
      :- => Proc.new{minus},
      :/ => Proc.new{divide},
      :* => Proc.new{times}
    }

    tokens(pol).chunk{|n| n.is_a?(Integer)}.each do |condition, chunk|
      if condition == true
        chunk.each{|a| push(a) }
      else
        chunk.each {|o| (opps[o].call)}
      end
    end
    @kek[0]
  end

  def has_enough
    if @kek.count < 2
      raise "calculator is empty"
      false
    else
      true
    end
  end

  def value
    @sum
  end
end