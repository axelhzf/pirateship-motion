class MovieScreen < PM::TableScreen
  attr_accessor :movie

  def on_load
    self.title = @movie.MovieTitleClean

    puts @movie.TorrentUrl
    puts Settings::endpoint
  end

  def table_data
    [{
        cells: [
            {title: movie.MovieTitleClean}
        ]
    }]
  end

end