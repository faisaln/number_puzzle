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

  it 'does not accept numbers with 10 digits or more' do
    print(1000000000).should == "Numbers with more than nine digits are not supported"
    print(-1000000000).should == "Numbers with more than nine digits are not supported"
  end

  it 'should add Minus in front of negative numbers' do
    print(-1).should == 'Minus One'
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
      let(:text) {['One Hundred and One', 'Two Hundred and Twenty One', 'Three Hundred and Seventy Six',
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

      context 'complex' do
        let(:numbers) {[1701, 4357, 7011, 9001]}
        let(:text) {['One Thousand Seven Hundred and One', 'Four Thousand Three Hundred and Fifty Seven',
                      'Seven Thousand and Eleven', 'Nine Thousand and One']}

        it_behaves_like 'text for numbers'
      end
    end

    context 'tens' do
      context 'simple' do
        let(:numbers) {[10000, 40000, 70000]}
        let(:text) {['Ten Thousand', 'Forty Thousand', 'Seventy Thousand']}

        it_behaves_like 'text for numbers'
      end

      context 'complex' do
        let(:numbers) {[10010, 44567, 70003, 80798]}
        let(:text) {['Ten Thousand and Ten', 'Forty Four Thousand Five Hundred and Sixty Seven',
                        'Seventy Thousand and Three', 'Eighty Thousand Seven Hundred and Ninety Eight']}

        it_behaves_like 'text for numbers'
      end
    end

    context 'hundreds' do
      context 'simple' do
        let(:numbers) {[100000, 400000, 700000]}
        let(:text) {['One Hundred Thousand', 'Four Hundred Thousand', 'Seven Hundred Thousand']}

        it_behaves_like 'text for numbers'
      end

      context 'complex' do
        let(:numbers) {[101022, 489000, 700001, 899977]}
        let(:text) {['One Hundred and One Thousand and Twenty Two',
                     'Four Hundred and Eighty Nine Thousand',
                     'Seven Hundred Thousand and One',
                     'Eight Hundred and Ninety Nine Thousand Nine Hundred and Seventy Seven']}

        it_behaves_like 'text for numbers'
      end
    end
  end

  context 'millions' do
    context 'ones' do
      context 'simple' do
        let(:numbers) {[1000000, 4000000, 7000000]}
        let(:text) {['One Million', 'Four Million', 'Seven Million']}

        it_behaves_like 'text for numbers'
      end

      context 'complex' do
        let(:numbers) {[1701122, 4357778, 7011235, 9000009]}
        let(:text) {['One Million Seven Hundred and One Thousand One Hundred and Twenty Two',
                     'Four Million Three Hundred and Fifty Seven Thousand Seven Hundred and Seventy Eight',
                     'Seven Million Eleven Thousand Two Hundred and Thirty Five',
                     'Nine Million and Nine']}

        it_behaves_like 'text for numbers'
      end
    end

    context 'tens' do
      context 'simple' do
        let(:numbers) {[10000000, 40000000, 70000000]}
        let(:text) {['Ten Million', 'Forty Million', 'Seventy Million']}

        it_behaves_like 'text for numbers'
      end

      context 'complex' do
        let(:numbers) {[17011228, 43577789, 70112351, 90000007]}
        let(:text) {['Seventeen Million Eleven Thousand Two Hundred and Twenty Eight',
                     'Forty Three Million Five Hundred and Seventy Seven Thousand Seven Hundred and Eighty Nine',
                     'Seventy Million One Hundred and Twelve Thousand Three Hundred and Fifty One',
                     'Ninety Million and Seven']}

        it_behaves_like 'text for numbers'
      end
    end

    context 'hundreds' do
      context 'simple' do
        let(:numbers) {[100000000, 400000000, 700000000]}
        let(:text) {['One Hundred Million', 'Four Hundred Million', 'Seven Hundred Million']}

        it_behaves_like 'text for numbers'
      end

      context 'complex' do
        let(:numbers) {[170112281, 435777899, 701123515, 900000007]}
        let(:text) {['One Hundred and Seventy Million One Hundred and Twelve Thousand Two Hundred and Eighty One',
                     'Four Hundred and Thirty Five Million Seven Hundred and Seventy Seven Thousand Eight Hundred and Ninety Nine',
                     'Seven Hundred and One Million One Hundred and Twenty Three Thousand Five Hundred and Fifteen',
                     'Nine Hundred Million and Seven']}

        it_behaves_like 'text for numbers'
      end
    end
  end
end