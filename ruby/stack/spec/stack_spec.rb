require 'spec_helper'
require 'stack'

RSpec.describe Stack do
  let(:stack) { Stack.new }

  it 'newly created stacks should be empty' do
    expect(stack.empty?).to be true
    expect(stack.size).to eq 0
  end

  it 'after one push stack size should be one' do
    stack.push(1)
    expect(stack.size).to eq 1
    expect(stack.empty?).to be false
  end

  it 'after one push and one pop should be empty' do
    stack.push(1)
    stack.pop
    expect(stack.empty?).to be true
  end
end
