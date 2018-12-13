class Product < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :name, presence: true
  validates :price, presence: true
  validates :image, presence: true

  self.per_page = 10

  def discount_price
    discount_percentage = Rails.application.config.discount_percentage
    self.price * discount_percentage
  end
end
