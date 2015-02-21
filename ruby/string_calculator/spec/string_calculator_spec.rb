require 'spec_helper'
require 'string_calculator'

RSpec.describe StringCalculator do
  it 'should be defined' do
    expect(StringCalculator).to_not be_nil
  end

  describe '#add' do
    def add(numbers)
      described_class.add(numbers)
    end

    it 'should return zero for empty string' do
      expect(add('')).to eq 0
    end

    it 'should return the number if one number passed' do
      expect(add('1')).to eq 1
      expect(add('3')).to eq 3
      expect(add('10')).to eq 10
    end

    it 'should return 3 when passed 1,2' do
      expect(add('1,2')).to eq 3
    end
  end
end
