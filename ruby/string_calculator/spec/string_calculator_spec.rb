require 'spec_helper'
require 'string_calculator'

RSpec.describe StringCalculator do
  it 'should be defined' do
    expect(StringCalculator).to_not be_nil
  end

  describe '#add' do
    it 'should return zero for empty string' do
      expect(StringCalculator.add('')).to eq 0
    end

    it 'should return the number if one number passed' do
      expect(StringCalculator.add('1')).to eq 1
      expect(StringCalculator.add('3')).to eq 3
      expect(StringCalculator.add('10')).to eq 10
    end
  end
end
