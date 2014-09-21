class MovieScreen < PM::Screen
  title "Root Screen"
  attr_accessor :movie

  def on_load
    @layout = MovieLayout.new(root: self.view).build

    #self.title = @movie.MovieTitleClean
    #puts @movie.TorrentMagnetUrl

    @button = @layout.get(:button)
    @button.on(:touch) do
      puts "button click"
    end

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
      center.equals(:superview)
      height.equals(40)
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
      right.is 9
      width.equals(:superview).minus(2 * 8)
      top.equals(:label, :bottom).plus(20)
    end
  end

end