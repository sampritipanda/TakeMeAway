class MenuItem < ActiveRecord::Base
  # has_one :image, dependent: :destroy
  has_and_belongs_to_many :orders
  has_and_belongs_to_many :menu_categories
  has_and_belongs_to_many :menus
  
  has_attached_file :image,
                    :storage => :database,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :url => '/menu_items/images/:id/:style'
                    # :default_url => "/images/:style/missing.png"
                    
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :name, presence: true
  validates :price, presence: true
end
