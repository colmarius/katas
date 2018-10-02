require 'spec_helper'
require 'anagrams'

RSpec.describe Anagrams do
  def file_path(path)
    File.expand_path(path, __dir__)
  end

  describe '#initialize' do
    it 'should load anagrams from text file' do
      expect {
        described_class.new(file_path: 'data/short_wordlist.txt')
      }.to_not raise_error
    end
  end

  describe '#original_words' do
    it 'should return a list of words as loaded from file' do
      anagrams = described_class.new(file_path: 'data/short_wordlist.txt')
      expect(anagrams.original_words).to eq [
        "boaster", "boaters", "borates", "enlist", "fresher", "inlets",
        "kinship", "knits", "listen", "pinkish", "refresh", "rots", "silent",
        "sinks", "skins", "sort", "stink"
      ]
    end
  end
end
