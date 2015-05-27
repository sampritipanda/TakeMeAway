class MenuItemsController < ActionController::Base

  def image
    style = params[:style] ? params[:style] : 'original'
    @menu_item = MenuItem.find(params[:id])
    send_data(@menu_item.image.file_contents(style), 
              filename: @menu_item.image_file_name, 
              type: @menu_item.image_content_type,
              disposition: 'inline')
  end
  
end