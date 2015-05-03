class NameInverter
  def invert_name(name)
    return '' if name.nil? || name.empty?

    format_name(remove_honorifics(split_names(name)))
  end

  private

  def split_names(name)
    name.split(' ')
  end

  def remove_honorifics(names)
    names.delete_at(0) if honorific?(names[0])
    names
  end

  def honorific?(name)
    name =~ /Mr\.|Mrs\./
  end

  def format_name(names)
    return names[0] if names.length == 1

    format_multi_name(names)
  end

  def format_multi_name(names)
    first_name = names[0]
    last_name = names[1]

    return "#{last_name}, #{first_name} #{post_nominal(names)}".strip
  end

  def post_nominal(names)
    all_post_nominals = ''

    if names.length > 2
      post_nominals = names.slice(2, names.length)
      all_post_nominals = post_nominals.join(' ')
    end

    all_post_nominals
  end
end
