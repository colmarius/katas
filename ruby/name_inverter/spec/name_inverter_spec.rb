require 'spec_helper'
require 'name_inverter'

RSpec.describe NameInverter do
  let(:name_inverter) { NameInverter.new }

  describe '#invert_name' do
    it 'return empty string for nil name' do
      expect(name_inverter.invert_name(nil)).to eq('')
    end

    it 'return empty string for empty name' do
      expect(name_inverter.invert_name('')).to eq('')
    end
  end
end
