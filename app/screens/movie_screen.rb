class MovieScreen < PM::Screen

  attr_accessor :movie

  def on_load
    @layout = MovieLayout.new
    self.view = @layout.view

    self.title = @movie.title

    set_nav_bar_button :right, title: "Download", action: :download


    @poster = @layout.get(:poster)
    @poster.setImageWithURL(@movie.poster.nsurl, placeholderImage: "Default-568h".uiimage)

    @tagline_label = @layout.get(:tagline_label)
    @tagline_label.text = @movie.tagline


    @overview_label = @layout.get(:overview_label)
    @overview_label.text = @movie.overview

    @trailer_button = @layout.get(:trailer_button)
    @trailer_button.on(:touch) do
      open WebScreen.new(:movie => self.movie)
    end

    @tab_bar.tabBar.translucent = false

  end

  def download
    SVProgressHUD.show
    PirateshipService.downloadMagnet(@movie.magnet) do |error|
      if error
        SVProgressHUD.showErrorWithStatus error
      else
        SVProgressHUD.dismiss
      end
    end
  end

end