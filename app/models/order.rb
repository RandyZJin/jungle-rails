class Order < ApplicationRecord
  
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  after_save do
    self.line_items.each do |item|
      @product = Product.find(item.product_id)
      @newQuantity = @product.quantity - item.quantity
      @product.update(quantity: @newQuantity)
    end
  end


end
