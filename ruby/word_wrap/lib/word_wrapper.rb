module WordWrapper
  def self.wrap(s, width)
    return '' if s.nil?

    if s.length <= width
      s
    else
      break_point = s.rindex(' ', width)
      break_point = width unless break_point

      head = s.slice(0, break_point)
      rest = s.slice(break_point, s.length)

      "#{ head }\n#{ wrap(rest.strip, width) }"
    end
  end
end
