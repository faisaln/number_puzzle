module PrintNumber
  attr_reader :number

  def print(input_number)
    @number = input_number
    convert_to_text
  end

  def convert_to_text
    if number_of_digits == 2
      if number % 10 == 0
        tens_text[number / 10]
      elsif (11..19).include? number
        eleven_nineteen[number - 10 - 1]
      else
        "#{tens_text[number / 10]} #{digit_text[number % 10]}"
      end
    elsif number_of_digits == 3
      "#{digit_text[digit(1)]} #{hundred}" + (number % 100 == 0 ? "" : " and #{print(chop_head)}")
    else
      digit_text[number]
    end
  end


  private

  def digits
    number.to_s
  end

  def number_of_digits
    digits.length
  end

  # digit number if 1 based, as used in regular English
  def digit(digit_number)
    digits[digit_number - 1].to_i
  end

  def chop_head
    digits.reverse.chop.reverse.to_i
  end

  def digit_text
    @digit_text ||= %w[Zero One Two Three Four Five Six Seven Eight Nine]
  end

  def tens_text
    @tens_text ||= %w[Zero Ten Twenty Thirty Forty Fifty Sixty Seventy Eighty Ninety]
  end

  def eleven_nineteen
    eleven_nineteen= %w[Eleven Twelve Thirteen Fourteen Fifteen Sixteen Seventeen Eighteen Nineteen]
  end

  def hundred
    'Hundred'
  end

  def number
    @number
  end
end