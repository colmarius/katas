require 'spec_helper'
require 'anagrams'

RSpec.describe Anagrams do
  def file_path(path)
    File.expand_path(path, __dir__)
  end

  describe '#initialize' do
    it 'loads anagrams from text file' do
      expect {
        described_class.new(file_path: 'data/short_wordlist.txt')
      }.to_not raise_error
    end
  end

  describe '#original_words' do
    it 'returns a list of words as loaded from file' do
      anagrams = described_class.new(file_path: 'data/short_wordlist.txt')
      expect(anagrams.original_words).to eq [
        "boaster", "boaters", "borates", "enlist", "fresher", "inlets",
        "kinship", "knits", "listen", "pinkish", "refresh", "rots", "silent",
        "sinks", "skins", "sort", "stink"
      ]
    end
  end

  describe '#anagram_words' do
    describe 'with short wordlist' do
      it 'returns list of anagram words (all related anagrams per line)' do
        anagrams = described_class.new(file_path: 'data/short_wordlist.txt')
        expected_anagram_words = anagrams.anagram_words.sort

        anagram_lines = File.read(
          File.expand_path('data/short_anagrams.txt', __dir__)
        ).split("\n").sort

        expected_anagram_words.each_with_index do |expected_anagrams, index|
          expect(anagram_lines[index]).to eq expected_anagrams
        end
      end
    end
  end
end
