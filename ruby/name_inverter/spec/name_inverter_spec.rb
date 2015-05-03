require 'spec_helper'
require 'name_inverter'

RSpec.describe NameInverter do
  describe '#invert_name' do
    it 'return empty string for nil name' do
      name_inverter = NameInverter.new
      expect(name_inverter.invert_name(nil)).to eq('')
    end
  end
end
