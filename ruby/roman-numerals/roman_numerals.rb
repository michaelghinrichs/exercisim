class Fixnum
  VERSION=1
  def to_roman
    number=self
    level = Math.log10(number).floor
    makeNumerals(level, number).join('')
  end

  def makeNumerals(level, base_num)
    #base case
    if level == -1
      return []
    end

    numeral=[]
    keys = setKeys(level)
    high = keys[0]
    low = keys[1]
    # number = base_num % 5
    number = base_num.to_s.chars[level].to_i
    # puts high
    # puts number

    if number < 5 && number % 5 < 4
      numeral.push(makeOnes(number % 5, low))
    end
    if number > 5 && number % 5 != 4
      numeral.push(makeFive(high))
    end
    if number > 5 && number % 5 < 4
      numeral.push(makeOnes(number % 5, low))
    end
    if number < 5 && number % 5 == 4
      numeral.push(makeOnes(1, low))
      numeral.push(makeFive(high))
    end
    if number > 5 && number % 5 == 4
      numeral.push(makeFive(high))
      numeral.push(makeOnes(1, low))
    end
    if number == 5
      numeral.push(makeFive(high))
    end

    # recurse
    level = level - 1
    temp = makeNumerals(level, base_num)
    numeral + temp
  end

  def setKeys(level)
    if level == 3
      high = 'M'
    elsif level == 2
      high = 'D'
      low= 'C'
    elsif level == 1
      high = 'L'
      low= 'X'
    elsif level == 0
      high = 'V'
      low= 'I'
    end
    [high, low]
  end

  def makeOnes(num, char)
    Array.new(num, char)
  end

  def makeFive(char)
    Array.new(1, char)
  end
end
