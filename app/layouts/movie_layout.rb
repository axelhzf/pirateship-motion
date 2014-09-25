class MovieLayout < MotionKit::Layout

  HorizontalPadding = 10
  VerticalPadding = 10

  def layout
    root(UIView, :root) do
      add UIScrollView, :scroll do
        add UIView, :container do
          add UIImageView, :poster
          add UIButton, :trailer_button
          add UILabel, :tagline_label
          add UILabel, :overview_label
        end
      end
    end
  end

  def root_style
    background_color "#F8F8F8".uicolor
  end

  def scroll_style

    constraints do
      width.equals :root
      height.equals :root
      left.equals :root
      top.equals :container
      bottom.equals :container
    end
  end

  def container_style
    constraints do
      top.equals(:scroll)
      left.equals(:scroll)
      width.equals(:scroll)
    end
  end

  def poster_style
    constraints do
      top.equals(:superview)
      height.equals(300)

      left.equals(0)
      width.equals(:superview)
    end
  end

  def tagline_label_style
    target.lineBreakMode = NSLineBreakByWordWrapping
    target.numberOfLines = 0

    constraints do
      top.equals(:trailer_button, :bottom).plus(2 * VerticalPadding)

      left.is HorizontalPadding
      width.equals(:superview).minus(2 * HorizontalPadding)
    end
  end

  def overview_label_style
    target.lineBreakMode = NSLineBreakByWordWrapping
    target.numberOfLines = 0

    constraints do
      top.equals(:tagline_label, :bottom).plus(VerticalPadding)

      left.is HorizontalPadding
      width.equals(:superview).minus(2 * HorizontalPadding)
      bottom.equals(:superview).minus(VerticalPadding)
    end
  end

  def trailer_button_style
    title 'View trailer'
    title_color '#333'.uicolor
    layer do
      corner_radius 7.0
      border_color '#A3A3A3'.cgcolor
      border_width 1.0
    end
    constraints do
      top.equals(:poster, :bottom).plus(20)
      left.is HorizontalPadding
      width.equals(:superview).minus(2 * HorizontalPadding)
    end
  end


end