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
end
