require 'spec_helper'

describe PrintNumber do
  include PrintNumber

  it 'counts number of digits' do
    digits(1).should be(1)
    digits(33).should be(2)
    digits(3377).should be(4)
    digits(0000).should_not be(4)
    digits(0000).should be(1)
    digits(20).should be(2)
    digits(300).should be(3)
  end

  context 'single digits' do
    digit_text = %w[Zero One Two Three Four Five Six Seven Eight Nine]

    it 'print text for each digit' do
      for i in 0...digit_text.length
        print(i).should == digit_text[i]
      end
    end
  end

  context '2 digit numbers' do
    context 'tens' do
      tens_text = %w[Ten Twenty Thirty Forty Fifty Sixty Seventy Eighty Ninety]

      it 'prints text for tens' do
        for i in 1...tens_text.length
          print(i * 10).should == tens_text[i - 1]
        end
      end
    end

    context 'numbers from 11 to 19' do
      eleven_nineteen = %w[Eleven Twelve Thirteen Fourteen Fifteen Sixteen Seventeen Eighteen Nineteen]

      it 'prints text for numbers from 11 to 19' do
        (11..19).each do |i|
          print(i).should == eleven_nineteen[i - 10 - 1]
        end
      end
    end
  end
end