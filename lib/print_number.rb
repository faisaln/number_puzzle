module PrintNumber
  def print(number)
    digits(number) == 2 ? tens_text[number / 10] : digit_text[number]
  end

  private

  def digits(number)
    number.to_s.length
  end

  def digit_text
    @digit_text ||= %w[Zero One Two Three Four Five Six Seven Eight Nine]
  end

  def tens_text
    @tens_text ||= %w[Zero Ten Twenty Thirty Forty Fifty Sixty Seventy Eighty Ninety]
  end
end