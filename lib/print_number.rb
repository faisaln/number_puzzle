module PrintNumber
  attr_reader :number

  def print(input_number)
    @number = input_number
    pre_process_input
    return print_error if errors.count > 0

    blocks = three_digit_blocks
    text = prefix
    blocks.each_with_index do |b, i|
      @number = b.to_i
      text += "and " if (i == blocks.length - 1 && b[0] == '0' && @number != 0)
      text += "#{convert_to_text}#{block_names[blocks.length - i -1]}" unless (@number == 0 && blocks.length > 1)
      text += " " unless i == blocks.length - 1 || @number == 0
    end

    text.strip
  end


  private

  def pre_process_input
    check_for_errors
    return if errors.count > 0

    @number = @number.to_i
    if @number < 0
      @prefix = 'Minus '
      @number *= -1
    end
  end

  def check_for_errors
    errors.clear
    @errors << type_error if (@number.to_s =~ /\d+/).nil?
    @errors << length_error if number_of_digits > 9
    @errors << decimal_error if @number.to_s.include? '.'
  end

  def print_error
    errors.reduce(:<<)
  end

  # processor methods
  def convert_to_text
    send "text_for_#{number_of_digits}_digit_number"
  end

  def text_for_1_digit_number
    digit_text[number]
  end

  def text_for_2_digit_number
    if number % 10 == 0
      tens_text[number / 10]
    elsif (11..19).include? number
      eleven_nineteen[number - 11]
    else
      "#{tens_text[number / 10]} #{digit_text[number % 10]}"
    end
  end

  def text_for_3_digit_number
    "#{digit_text[digit(1)]} Hundred" + (number % 100 == 0 ? "" : " and #{print(chop_head)}")
  end

  #utility methods
  def three_digit_blocks
    blocks = []

    if digits.length < 4
      blocks << digits
      return blocks
    end

    block = ""
    s = digits.reverse
    for i in 0...s.length
      block += s[i]
      if (i + 1) % 3 == 0
        blocks << block.reverse
        block = ""
      end
    end
    blocks << block.reverse
    blocks.reverse
  end

  def digits
    number.to_s
  end

  def number_of_digits
    digits.length
  end

  # digit number is 1 based, as used in regular English
  def digit(digit_number)
    digits[digit_number - 1].to_i
  end

  def chop_head
    digits[1...digits.length].to_i
  end

  #error handling
  def errors
    @errors ||= []
  end

  def length_error
    "Numbers with more than nine digits are not supported"
  end

  def type_error
    "Non-numeric input is not supported"
  end

  def decimal_error
    "Only whole numbers are supported"
  end

  def prefix
    @prefix || ''
  end

  # data
  def digit_text
    @digit_text ||= %w[Zero One Two Three Four Five Six Seven Eight Nine]
  end

  def tens_text
    @tens_text ||= %w[Zero Ten Twenty Thirty Forty Fifty Sixty Seventy Eighty Ninety]
  end

  def eleven_nineteen
    @eleven_nineteen ||= %w[Eleven Twelve Thirteen Fourteen Fifteen Sixteen Seventeen Eighteen Nineteen]
  end

  def block_names
    ['', ' Thousand', ' Million']
  end
end