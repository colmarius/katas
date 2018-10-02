class Anagrams
  attr_reader :original_words

  def initialize(file_path:)
    path = File.expand_path(file_path, __dir__)
    content = File.read(path)
    @original_words = content.split("\n")
  end

  def anagram_words
    dictionary = original_words.each_with_object({}) do |word, memo|
      normalized_word = word.downcase.split('').sort.join
      memo[normalized_word] ||= []
      memo[normalized_word] << word
    end
    dictionary.values.map { |list| list.sort.join(' ') }.sort
  end
end
