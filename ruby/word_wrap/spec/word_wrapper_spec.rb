require 'spec_helper'
require 'word_wrapper'

RSpec.describe WordWrapper do
  describe 'self.wrap' do
    def expect_wraps(input, width, output)
      expect(described_class.wrap(input, width)).to eq(output)
    end

    it 'should return empty string for empty input' do
      expect_wraps(nil, 1, '')
      expect_wraps('', 1, '')
    end

    it 'should return x for width 1' do
      expect_wraps('x', 1, 'x')
    end
  end
end
