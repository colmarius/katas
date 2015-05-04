module WordWrapper
  def self.wrap(s, width)
    return '' if s.nil?

    if s.length <= width
      s
    else
      "#{ s.slice(0, width) }\n#{ wrap(s.slice(width, s.length), width) }"
    end
  end
end
