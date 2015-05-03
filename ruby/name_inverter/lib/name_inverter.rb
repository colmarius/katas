class NameInverter
  def invert_name(name)
    return '' if name.nil? || name.empty?

    names = name.split(' ')
    names.delete_at(0) if honorific?(names[0])

    if names.length == 1
      return names[0]
    else
      post_nominal = ''

      if names.length > 2
        post_nominals = names.slice(2, names.length)
        post_nominal = post_nominals.join(' ')
      end

      return "#{names[1]}, #{names[0]} #{post_nominal}".strip
    end
  end

  private

  def honorific?(name)
    name =~ /Mr\.|Mrs\./
  end
end
