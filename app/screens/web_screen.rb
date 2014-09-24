class WebScreen < PM::WebScreen
  title "Trailer"

  attr_accessor :movie

  def content
    @movie.trailer.nsurl
  end

end