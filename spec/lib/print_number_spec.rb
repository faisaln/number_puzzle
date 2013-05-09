require 'spec_helper'

describe PrintNumber do
  include PrintNumber

  context 'single digits' do
    digit_text = %w[Zero One Two Three Four Five Six Seven Eight Nine Ten]

    it 'print text for each digit' do
      for i in 0...digit_text.length
        print(i).should == digit_text[i]
      end
    end
  end
end