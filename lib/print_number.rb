module PrintNumber
  def print(number)
    digit_text[number]
  end

  private

  def digit_text
    @digit_text ||= %w[Zero One Two Three Four Five Six Seven Eight Nine Ten]
  end
end