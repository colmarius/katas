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

  describe '#anagram_words' do
    it 'should return list of anagram words (all related anagrams per line)' do
      anagrams = described_class.new(file_path: 'data/short_wordlist.txt')
      first_line = anagrams.anagram_words.sort.first

      expected_anagram_lines = File.read(
        File.expand_path('data/short_anagrams.txt', __dir__)
      ).split("\n").sort

      expect(first_line).to eq expected_anagram_lines.first
    end
  end
end
