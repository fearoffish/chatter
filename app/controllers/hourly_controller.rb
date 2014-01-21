class HourlyController < UITableViewController
  include Teacup::TableViewDelegate

  stylesheet :hourly

  def viewDidLoad
    super
    
    self.title = "Hourly"
    @hourlies = Hourly.sort_by(:timestamp, :descending).array
  end

  def tableView(table_view, numberOfRowsInSection: section)
    @hourlies.count
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    @reuseIdentifier ||= "HOURLY_CELL"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      HourlyCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end

    summary = @hourlies[index_path.row]

    cell.title_label.text   = date_formatter.stringFromDate summary.timestamp.beginning_of_hour
    cell.details_label.text = summary.humanize
    
    return cell
  end

  def tableView(table_view, didSelectRowAtIndexPath:index_path)
    table_view.deselectRowAtIndexPath(index_path, animated: true)

    # push(@hourlies[index_path.row])    
  end

  def tableView(table_view, heightForRowAtIndexPath:index_path)
    110
  end

  def push(event)
    # detail_controller = DetailViewController.alloc.initWithText(event)
    # self.navigationController.pushViewController(detail_controller, animated: true)
  end

  def date_formatter
    @date_formatter ||= begin
      formatter = NSDateFormatter.alloc.init
      formatter.setLocale NSLocale.currentLocale
      # Skip the date in this controller
      formatter.setDateStyle NSDateFormatterLongStyle
      formatter.setTimeStyle NSDateFormatterShortStyle
      formatter
    end
  end
end