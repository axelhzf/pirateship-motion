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
                  subtitle: "#{torrent.resolution} #{torrent.seeds} / #{torrent.leechers}",
                  action: :download,
                  arguments: torrent
              }
            end
        }]
  end

  def searchDisplayController(controller, shouldReloadTableForSearchString:search_string)
    PirateshipService.instance.find(search_string) do |err, torrents|
      if err != nil
        SVProgressHUD.showErrorWithStatus err
      else
        @torrents = torrents
        update_table_data
        controller.searchResultsTableView.reloadData
      end
    end
    false
  end

  def download(torrent)
    SVProgressHUD.show
    PirateshipService.instance.download(torrent.link) do |error|
      if error
        SVProgressHUD.showErrorWithStatus error
      else
        SVProgressHUD.dismiss
      end
    end
  end

end