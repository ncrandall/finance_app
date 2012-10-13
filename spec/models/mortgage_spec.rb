require 'spec_helper'


describe Mortgage do

  before { @mortgage = Mortgage.new(:principal => 1000.00, :annual_rate => 10, :term => 1) }

  subject { @mortgage }

  it { should respond_to(:principal) }
  it { should respond_to(:annual_rate) }
  it { should respond_to(:term) }

  describe "invalid annual_rate range" do
    describe "annual_rate greater than 100" do
      before { @mortgage.annual_rate = 110 }
      it { should_not be_valid }
    end

    describe "annual_rate less than 0" do
      before { @mortgage.annual_rate = -1 }
      it { should_not be_valid }
    end
  end

  describe "annual_rate is not present" do
    before { @mortgage.annual_rate = nil }
    it { should_not be_valid }
  end

  describe "term is not present" do
    before { @mortgage.term = nil }
    it { should_not be_valid }
  end

end
