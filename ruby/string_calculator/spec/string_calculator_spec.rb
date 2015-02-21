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

    describe 'should return correct sum when passed different numbers' do
      5.times do
        numbers = 7.times.map { (10 * Random.rand).ceil }
        numbers_string = numbers.join(',')
        numbers_sum = numbers.reduce(&:+)

        it "should return #{numbers_sum} as sum when passing #{numbers_string} numbers" do
          expect(add(numbers_string)).to eq numbers_sum
        end
      end
    end

    describe 'should allow new lines or commas as numbers separators' do
      it 'supports commas only' do
        expect(add('1,2,3,4,5')).to eq 15
      end

      it 'supports new lines only' do
        expect(add("1\n2\n3\n4\n5")).to eq 15
      end

      it 'support mixed commas and new lines' do
        expect(add("1\n2,3,4\n5")).to eq 15
      end
    end
  end
end
