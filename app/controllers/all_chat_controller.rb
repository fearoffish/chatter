class AllChatController < UITableViewController
  include Teacup::TableViewDelegate

  stylesheet :all_chat

  def viewDidLoad
    super
    
    self.title = "All Chat"
    @events = Event.sort_by(:timestamp, :descending).array
  end

  def tableView(table_view, numberOfRowsInSection: section)
    @events.count
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    @reuseIdentifier ||= "ALL_CHAT_CELL"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      AllChatCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end

    event = @events[index_path.row]

    cell.title_label.text   = date_formatter.stringFromDate event.timestamp
    cell.details_label.text = event.humanize
    
    return cell
  end

  # def tableView(table_view, didSelectRowAtIndexPath:index_path)
  #   table_view.deselectRowAtIndexPath(index_path, animated: true)

  #   # push(@events[index_path.row])    
  # end

  def tableView(table_view, heightForRowAtIndexPath:index_path)
    85
  end

  def date_formatter
    @date_formatter ||= begin
      formatter = NSDateFormatter.alloc.init
      formatter.setLocale NSLocale.currentLocale
      # Skip the date in this controller
      # formatter.setDateStyle NSDateFormatterShortStyle
      formatter.setTimeStyle NSDateFormatterMediumStyle
      formatter
    end
  end
end