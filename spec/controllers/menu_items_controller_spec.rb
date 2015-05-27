require 'rails_helper'

RSpec.describe MenuItemsController, :type => :controller do
  it 'routes GET /menu_items/images/:id/:style to menu_items#image' do
    expect(get: '/menu_items/images/1/medium').to route_to(
          controller: 'menu_items', action: 'image', id: '1', style: 'medium')
  end
end
