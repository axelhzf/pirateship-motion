class Settings

  def self.endpoint
    Settings.persistence[:endpoint]
  end

  private

  def self.persistence
    App::Persistence["FORMOTION_settings"]
  end

end