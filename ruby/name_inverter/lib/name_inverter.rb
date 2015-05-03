class NameInverter
  def invert_name(name)
    return '' if name.nil? || name.empty?

    names = name.split(' ')

    if names.length == 1
      return names[0]
    else
      return "#{names[1]}, #{names[0]}"
    end
  end
end
