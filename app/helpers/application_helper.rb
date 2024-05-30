module ApplicationHelper

  def short_time_ago(time)
  distance = distance_of_time_in_words(time, Time.now)
    case distance
    when /less than a minute/ then '1m'
    when /minute/ then distance.gsub(/ minute(s)?/, "m").gsub(/\s/, "")
    when /hour/ then '1h'
    when /day/ then distance.gsub(/ day(s)?/, "d").gsub(/\s/, "")
    when /month/ then distance.gsub(/ month(s)?/, "mo").gsub(/\s/, "")
    when /year/ then distance.gsub(/ year(s)?/, "y").gsub(/\s/, "")
    else time.strftime("%b %d, %Y")
    end
  end

  PREDEFINED_COLORS = ["#FF5E2B", "#53C32B", "#616161", "#2B8DFF", "#866F44", "#FFB52B", "#9E50EC", "#26B0A8", "#C543C8", "#2A733E"]
  # For user without profile pictures
  def deterministic_choice(letters)
    combined_letters = letters.join
    hash_value = combined_letters.hash
    index = hash_value % PREDEFINED_COLORS.length
    PREDEFINED_COLORS[index]
  end

  # Render svgs
  def render_svg(name, options = {})
    options[:title] ||= name.underscore.humanize
    options[:aria] = true
    options[:nocomment] = true
    options[:size] = options.fetch(:size, "20px*20px")
    options[:class] = options.fetch(:styles, "fill-current text-gray-500")

    filename = "#{name}.svg"
    inline_svg_tag(filename, options)
  end
end
