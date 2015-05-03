require 'spec_helper'
require 'name_inverter'

RSpec.describe NameInverter do
  let(:name_inverter) { NameInverter.new }

  def assert_inverted(original_name, expected_name)
    expect(name_inverter.invert_name(original_name)).to eq(expected_name)
  end

  describe '#invert_name' do
    it 'return empty string for nil name' do
      assert_inverted(nil, '')
    end

    it 'return empty string for empty name' do
      assert_inverted('', '')
    end

    it 'return Name for Name' do
      assert_inverted('Name', 'Name')
    end

    it 'return Name for Name with spaces' do
      assert_inverted('  Name ', 'Name')
    end

    it 'when passed "First Last" return "Last, First"' do
      assert_inverted('First Last', 'Last, First')
    end

    it 'when passed First Last with spaces return "Last, First"' do
      assert_inverted('  First   Last  ', 'Last, First')
    end

    it 'should ignore honorifics' do
      assert_inverted('Mr. Name', 'Name')
      assert_inverted('Mrs. Name', 'Name')
      assert_inverted('Mr. First Last', 'Last, First')
    end
  end
end
