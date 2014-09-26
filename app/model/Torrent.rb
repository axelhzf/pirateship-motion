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

  def to_s
    "#{@title} - #{@link} - #{@seeds} - #{@leechers}"
  end

end