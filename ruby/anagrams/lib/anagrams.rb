class Anagrams
  attr_reader :original_words

  def initialize(file_path:)
    path = File.expand_path(file_path, __dir__)
    content = File.read(path)
    @original_words = content.split("\n")
  end

  def anagram_words
    []
  end
end
