class SettingsScreen < PM::FormotionScreen
  title "Settings"
  tab_bar_item item: "icon_settings", title: "Settings"

  def on_load
    puts Settings::endpoint
  end

  def table_data
    {
        persist_as: :settings,
        sections: [{
                title: "Server",
                rows: [{
                           title: "Endpoint",
                           key: :endpoint,
                           placeholder: "http://server.com",
                           type: :string,
                           auto_correction: :no,
                           auto_capitalization: :none
                       }]
            }
        ]
    }
  end

end