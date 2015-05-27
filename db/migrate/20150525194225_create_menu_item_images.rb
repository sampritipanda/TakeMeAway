class CreateMenuItemImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.integer    :menu_item_id
      t.string     :style
      t.binary     :file_contents
      
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :images
  end
end
