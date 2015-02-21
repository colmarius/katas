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
  end
end
