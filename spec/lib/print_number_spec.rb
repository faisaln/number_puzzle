require 'spec_helper'

describe PrintNumber do
  include PrintNumber

  shared_examples "text for numbers" do
    it 'prints text for numbers' do
      for i in 0...numbers.length
        print(numbers[i]).should == text[i]
      end
    end
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

    context 'numbers from 21 to 99 other than tens' do
      specify {print(21).should == 'Twenty One'}
      specify {print(34).should == 'Thirty Four'}
      specify {print(62).should == 'Sixty Two'}
      specify {print(77).should == 'Seventy Seven'}
      specify {print(99).should == 'Ninety Nine'}
    end
  end

  context '3 digit numbers' do
    context 'hundreds' do
      let(:text) {['One Hundred', 'Four Hundred', 'Seven Hundred']}
      let(:numbers) {[100, 400, 700]}

      it_behaves_like 'text for numbers'
    end

    context 'numbers other than hundreds' do
      let(:numbers) {[101, 221, 376, 999]}
      let(:text) {['One Hundred and One', 'Two Hundred and Twenty One', 'Three Hundred and Seventy Six', \
       'Nine Hundred and Ninety Nine']}

      it_behaves_like 'text for numbers'
    end
  end

  context 'thousands' do
    context 'ones' do
      context 'simple' do
        let(:numbers) {[1000, 4000, 7000]}
        let(:text) {['One Thousand', 'Four Thousand', 'Seven Thousand']}

        it_behaves_like 'text for numbers'
      end
    end

    context 'tens' do
      context 'simple' do
        let(:numbers) {[10000, 40000, 70000]}
        let(:text) {['Ten Thousand', 'Forty Thousand', 'Seventy Thousand']}

        it_behaves_like 'text for numbers'
      end
    end

    context 'hundreds' do
      context 'simple' do
        let(:numbers) {[100000, 400000, 700000]}
        let(:text) {['One Hundred Thousand', 'Four Hundred Thousand', 'Seven Hundred Thousand']}

        it_behaves_like 'text for numbers'
      end
    end
  end
end