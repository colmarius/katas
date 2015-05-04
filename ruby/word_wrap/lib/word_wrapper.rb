module WordWrapper
  def self.wrap(s, width)
    return '' if s.nil?

    if s.length <= width
      s
    else
      head = s.slice(0, width)
      rest = s.slice(width, s.length)

      "#{ head }\n#{ wrap(rest, width) }"
    end
  end
end
