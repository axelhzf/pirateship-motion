class Movie

  PROPERTIES = ["MovieTitle", "MovieTitleClean", "MovieYear", "TorrentUrl"]

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

end