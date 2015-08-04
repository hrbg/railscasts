class MainController < UITableViewController
  def init
    super.initWithStyle(UITableViewStylePlain)
  end

  def viewDidLoad
    super
    
    tableView.dataSource = self
    tableView.delegate   = self
    tableView.separatorColor = UIColor.clearColor

    @episodes ||= []

    AFMotion::JSON.get("http://railscasts.com/episodes.json") do |response|
      @episodes = response.object if response.success?
      tableView.reloadData
    end
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @episodes.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell_id = "cell"
    cell = tableView.dequeueReusableCellWithIdentifier cell_id
    if cell.nil?
      cell = UITableViewCell.alloc.initWithStyle UITableViewCellStyleSubtitle, reuseIdentifier:cell_id
    end

    episode = @episodes[indexPath.row]
    cell.textLabel.text = episode["name"]
    cell.detailTextLabel.text = "#{episode["url"]}"
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton

    cell
  end

  def tableView(tableView, accessoryButtonTappedForRowWithIndexPath:indexPath)
    self.navigationController.pushViewController(DetailController.new(@episodes[indexPath.row]), animated: true)
  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    50
  end

  def cellTapped
    puts 'hola'
  end
  
end
