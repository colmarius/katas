require 'spec_helper'
require 'word_wrapper'

RSpec.describe WordWrapper do
  describe 'self.wrap' do
    it 'should wrap a string with new lines based on width' do
      expect(described_class.wrap(nil, 1)).to eq('')
      expect(described_class.wrap('', 1)).to eq('')
      expect(described_class.wrap('x', 1)).to eq('x')
    end
  end
end
