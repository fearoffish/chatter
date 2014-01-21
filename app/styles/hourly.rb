Teacup::Stylesheet.new :hourly do
  style :root,
    backgroundColor: UIColor.whiteColor

  style :cell_title_label,
    autoresizingMask: autoresize.flexible_width,
    left: 10, top: 4, width: 300, height: 20,
    font: UIFont.boldSystemFontOfSize(UIFont.labelFontSize), 
    textColor: UIColor.grayColor

  style :cell_details_label,
    autoresizingMask: autoresize {flexible_width},
    left: 10, top: 24, width: 300, height: 80,
    font: UIFont.systemFontOfSize(UIFont.smallSystemFontSize),
    textColor: UIColor.blackColor, 
    numberOfLines: 0
end