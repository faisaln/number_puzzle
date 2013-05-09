require 'spec_helper'

describe PrintNumber do
  include PrintNumber

  it 'counts number of digits' do
    digits(1).should be(1)
    digits(33).should be(2)
    digits(3377).should be(4)
    digits(0000).should_not be(4)
  end

  context 'single digits' do
    digit_text = %w[Zero One Two Three Four Five Six Seven Eight Nine Ten]

    it 'print text for each digit' do
      for i in 0...digit_text.length
        print(i).should == digit_text[i]
      end
    end
  end
end