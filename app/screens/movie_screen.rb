class MovieScreen < PM::Screen

  attr_accessor :movie

  def on_load
    @layout = MovieLayout.new(root: self.view).build

    self.title = @movie.MovieTitleClean

    @label = @layout.get(:label)
    @label.text = @movie.MovieTitleClean

    @button = @layout.get(:button)
    @button.on(:touch) do

      SVProgressHUD.show
      MoviesService.downloadMagnet(@movie.TorrentMagnetUrl) do |error|
        if error
          SVProgressHUD.showErrorWithStatus error
        else
          SVProgressHUD.dismiss
        end
      end

    end
  end

  def updateViewConstraints
    @layout.add_constraints(self)
    super
  end

end


class MovieLayout < MotionKit::Layout

  def layout
    root :root do
      add UILabel, :label
      add UIButton, :button
    end
  end

  def root_style
    background_color "#F9F9F9".uicolor
  end

  def label_style
    text 'Movie title'
    text_color :black.uicolor
    text_alignment NSTextAlignmentCenter

    constraints do
      height.equals(40)
      width.equals(:superview)
      left.equals(0)
    end

  end

  def button_style
    title 'Download'
    background_color '#51A8E7'.uicolor
    layer do
      corner_radius 7.0
    end
    constraints do
      left.is 8
      #right.is 8
      width.equals(:superview).minus(2 * 8)
      top.equals(:label, :bottom).plus(20)
    end
  end

  def add_constraints(controller)
    # guard against adding these constraints more than once
    unless @layout_constraints_added
      @layout_constraints_added = true
      constraints(:label) do
        below(controller.topLayoutGuide).plus(20)
      end
    end
  end


end