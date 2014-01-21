class HourlyCell < UITableViewCell 
  attr_accessor :title_label, :details_label

  include Teacup::Layout 
  stylesheet :hourly

  def initWithStyle(style, reuseIdentifier:cell_identifier) 
    super 
    create_cell_subviews 
    self 
  end 

  def create_cell_subviews 
    layout(self.contentView, :table) do 
      @title_label   = subview UILabel, :cell_title_label 
      @details_label = subview UILabel, :cell_details_label 
    end 

    self 
  end 
end 
