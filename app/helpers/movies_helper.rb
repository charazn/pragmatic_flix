module MoviesHelper

  def format_total_gross(movie)
    if movie.flop?
      "Flop".html_safe
    else 
      number_to_currency(movie.total_gross)
    end
  end

  def image_for(movie)
    if movie.image_file_name.blank? || movie.image_file_name.nil?
      image_tag("placeholder.png")
    else
      image_tag(movie.image_file_name)
    end
  end

  def format_average_stars(movie)
    movie.average_stars.nil? ? content_tag(:strong, "No reviews") : pluralize(number_with_precision(@movie.average_stars, precision: 1), "star") 
    #"*" * movie.average_stars.round
  end

end
