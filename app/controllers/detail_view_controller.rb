class DetailViewController < UIViewController
  stylesheet :detail
  attr_accessor :message, :subject1, :timestamp

  layout :root do
    subview(UILabel, :subject1, 
      text: @subject1
    )
    subview(UILabel, :timestamp, 
      text: @timestamp
    )
    subview(UILabel, :message, 
      text: @message, 
      numberOfLines: 0,
      lineBreakMode: NSLineBreakByWordWrapping
    )
  end

  def initWithText(event)
    init.tap do
      @date_formatter ||= begin
        formatter = NSDateFormatter.alloc.init
        formatter.setLocale NSLocale.currentLocale
        # Skip the date in this controller
        # formatter.setDateStyle NSDateFormatterShortStyle
        formatter.setTimeStyle NSDateFormatterMediumStyle
        formatter
      end
      @message    = event.message
      @subject1  = event.subject1.name
      @timestamp = @date_formatter.stringFromDate(event.timestamp)
    end
  end
end