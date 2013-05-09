require 'spec_helper'

describe PrintNumber do
  include PrintNumber

  context 'single digits' do
    specify {print(1).should == "One"}
  end
end