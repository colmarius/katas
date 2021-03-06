require 'spec_helper'
require 'stack'

RSpec.describe Stack do
  let(:stack) { Stack.make(2) }

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

  it 'when pushed past limit stack overflows' do
    expect {
      stack.push(1)
      stack.push(1)
      stack.push(1)
    }.to raise_error(Stack::Overflow)
  end

  it 'when empty stack popped should throw underflow' do
    expect { stack.pop }
      .to raise_error(Stack::Underflow)
  end

  it 'when one is pushed one is popped' do
    stack.push(1)
    expect(stack.pop).to eq 1
  end

  it 'when one and two are pushed two and one are popped' do
    stack.push(1)
    stack.push(2)
    expect(stack.pop).to eq 2
    expect(stack.pop).to eq 1
  end

  it 'when creating stack with negative size should throw illegal capacity' do
    expect { Stack.make(-1) }
      .to raise_error(Stack::IllegalCapacity)
  end

  it 'when creating stack with zero capacity any push should overflow' do
    @stack = Stack.make(0)
    expect { @stack.push(1) }
      .to raise_error(Stack::Overflow)
  end

  it 'when one is pushed one is on top' do
    stack.push(1)
    expect(stack.top).to eq 1
  end

  it 'when stack is empty top throws empty' do
    expect { stack.top }
      .to raise_error(Stack::Empty)
  end

  it 'with zero capacity stack top throws empty' do
    @stack = Stack.make(0)
    expect { @stack.top }
      .to raise_error(Stack::Empty)
  end

  it 'given stack with 1, 2 pushed find 1 and 2' do
    stack.push(1)
    stack.push(2)
    expect(stack.find(1)).to eq 1
    expect(stack.find(2)).to eq 0
  end

  it 'given stack with no 2, find should return nil' do
    expect(stack.find(2)).to be nil
  end
end
