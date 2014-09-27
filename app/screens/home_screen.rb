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
    PirateshipService.instance.movies do |err, movies|
      stop_refreshing
      if err != nil
        SVProgressHUD.showErrorWithStatus err
      else
        @movies = movies
        update_table_data
      end
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
               arguments: movie,
               accessory_type: :disclosure_indicator
           }
         end
     }]
  end

  def movie_details(movie)
    open MovieScreen.new(:movie => movie)
  end

end