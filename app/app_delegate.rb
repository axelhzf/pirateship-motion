class AppDelegate < PM::Delegate

  def on_load(app, options)
    #open_tab_bar HomeScreen.new(nav_bar: true), SettingsScreen.new(nav_bar: true)

    open MovieScreen.new(nav_bar: true)

  end

end
