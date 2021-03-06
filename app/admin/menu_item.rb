ActiveAdmin.register MenuItem, as: 'Products' do

  permit_params :name, :price, :description, :ingredients, :image

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
      f.input :image, :as => :formtastic_attachinary
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
        product.image.present? ? cl_image_tag(product.image.path, { width: 300, height: 300, crop: :fit }) : content_tag(:span, "No photo yet")
      end
    end
  end
end
