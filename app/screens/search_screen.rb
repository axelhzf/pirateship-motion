class SearchScreen < PM::TableScreen
  title "Search"
  tab_bar_item item: "icon_search", title: "Search"
  searchable placeholder: "Search torrent"


  def on_load
    @torrents = []
  end

  def table_data
    [{
            cells: @torrents.map do |torrent|
              {
                  title: torrent.title,
                  subtitle: "#{torrent.seeds} / #{torrent.leechers}",
                  action: :download,
                  arguments: torrent
              }
            end
        }]
  end

  def searchDisplayController(controller, shouldReloadTableForSearchString:search_string)
    MoviesService::find search_string do |torrents|
      @torrents = torrents
      update_table_data
      controller.searchResultsTableView.reloadData
    end
    false
  end

  def download(torrent)
    puts "Download #{torrent.link}"
  end

end