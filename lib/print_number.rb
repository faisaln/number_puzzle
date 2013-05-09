module PrintNumber
  def print(number)
    digit_text[number]
  end

  private

  def digits(number)
    number.to_s.length
  end

  def digit_text
    @digit_text ||= %w[Zero One Two Three Four Five Six Seven Eight Nine Ten]
  end
end