class Torrent

  PROPERTIES = ["title", "link", "seeds", "leechers"]

  PROPERTIES.each { |prop|
    attr_accessor prop
  }

  def initialize(attributes = {})
    attributes.each do |key, value|
      if (PROPERTIES.member? key)
        self.send("#{key}=", value)
      end
    end
  end

  def resolution
    if @title != nil
      title = @title.downcase
      if title.include? "1080p"
        "1080p"
      elsif title.include? "720p"
        "720p"
      else
        "sd"
      end
    end
  end


end