class HomeScreen < PM::TableScreen
  title "Movies"
  tab_bar_item item: "icon_movies", title: "Movies"

  refreshable
  searchable placeholder: "Search movie"

  def on_load
    @movies = []
    load_async
  end

  def load_async
    MoviesService::list do |movies|
      @movies = movies
      stop_refreshing
      update_table_data
    end
  end

  def on_refresh
    load_async
  end

  def table_data
    [{
         cells: @movies.map do |movie|
           {
               title: movie.title,
               subtitle: "#{movie.year}",
               action: :movie_details,
               arguments: movie
           }
         end
     }]
  end

  def movie_details(movie)
    open MovieScreen.new(:movie => movie)
  end

end