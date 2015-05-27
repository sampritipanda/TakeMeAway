json.id menu.id
json.title menu.title
json.start_date menu.start_date.strftime('%F')
json.end_date menu.end_date.strftime('%F')
json.uri url_for("#{request.protocol}#{request.host_with_port}#{Rails.application.routes.url_helpers.v1_menu_path(menu.id)}")
json.item_count menu.menu_items.count

if menu.menu_items
  json.items menu.menu_items do |item|
    json.id item.id
    json.name item.name
    json.price item.price
    json.description item.description
    json.ingredients item.ingredients
    json.image_thumb cl_image_path item.image.path, { width: 100, height: 100, crop: :thumb }
    json.image_medium cl_image_path item.image.path, { width: 300, height: 300, crop: :fit }
  end
else
  json.items '"no items"'
end
