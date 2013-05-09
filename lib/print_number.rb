module PrintNumber
  def print(number)
    if number_of_digits(number) == 2
      if number % 10 == 0
        tens_text[number / 10]
      elsif (11..19).include? number
        eleven_nineteen[number - 10 - 1]
      else
        "#{tens_text[number / 10]} #{digit_text[number % 10]}"
      end
    else
      digit_text[number]
    end
  end


  private

  def digits(number)
    number.to_s
  end

  def number_of_digits(number)
    digits(number).length
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
end