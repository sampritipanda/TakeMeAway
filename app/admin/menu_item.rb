ActiveAdmin.register MenuItem, as: 'Products' do

  permit_params :name, :price, :description, :ingredients, :image # image_attributes: [:image]

  index do
    selectable_column
    #id_column
    column :name
    column :price
    actions
  end

  filter :name
  filter :price

  form html: { multipart: true } do |f|
    f.inputs 'Product Details' do
      f.input :name
      f.input :price
      f.input :description
      f.input :ingredients
      f.input :image, as: :file, 
                hint: f.object.image.exists? ? f.image_tag(f.object.image.url(:medium)) :
                         content_tag(:span, "Upload JPG/PNG/GIF image")
    end
    f.actions
  end

  show do |product|
    attributes_table do
      row :name
      row :price
      row :description
      row :ingredients
      row :image do
        image_tag(product.image.url(:medium))
      end
    end
  end
end
