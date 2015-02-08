require 'spec_helper'
require 'stack'

RSpec.describe Stack do

  it 'newly created stacks should be empty' do
    stack = Stack.new
    expect(stack.empty?).to be true
  end
end
