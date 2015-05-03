class NameInverter
  def invert_name(name)
    return '' if name.nil? || name.empty?

    names = name.split(' ')
    names.delete_at(0) if honorific?(names[0])

    if names.length == 1
      return names[0]
    else
      return "#{names[1]}, #{names[0]}"
    end
  end

  private

  def honorific?(name)
    name =~ /Mr\.|Mrs\./
  end
end
