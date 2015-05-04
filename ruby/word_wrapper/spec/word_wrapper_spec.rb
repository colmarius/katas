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

    it 'should return "x\nx" for "xx" with width 1' do
      expect_wraps('xx', 1, "x\nx")
    end

    it 'should return "x\nx\nx" for "xxx" with width 1' do
      expect_wraps('xxx', 1, "x\nx\nx")
    end

    it 'should return "x\nx" for "x x" with width 1' do
      expect_wraps('x x', 1, "x\nx")
    end

    it 'should return "x\nxx" for "x xx" with width 3' do
      expect_wraps('x xx', 3, "x\nxx")
    end

    it 'should pass integration test' do
      expect_wraps(
        'four score and seven years ago our fathers brought forth upon this continent', 7,
        "four\nscore\nand\nseven\nyears\nago our\nfathers\nbrought\nforth\nupon\nthis\ncontine\nnt")
    end
  end
end
