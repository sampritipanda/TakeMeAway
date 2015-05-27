FactoryGirl.define do
  factory :menu_item do
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price }
    description { Faker::Lorem.sentence(3) }
    ingredients { Faker::Lorem.sentence(3) }
    image_file_name 'chair.jpg'
    image_content_type 'image/jpeg'
  end
  
  factory :image do
    menu_item_id 1
    style 'medium'
    file_contents { File.new("#{Rails.root}/spec/factories/chair.jpg").read }
  end
end
