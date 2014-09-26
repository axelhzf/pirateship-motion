class AppDelegate < PM::Delegate

  def on_load(app, options)
    open_tab_bar HomeScreen.new(nav_bar: true), SearchScreen.new(nav_bar: true), SettingsScreen.new(nav_bar: true)
    self.tab_bar.tabBar.translucent = false
  end

end
