require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      @category = Category.create!(name: "Trees")
      # Setup at least two products with different quantities, names, etc
      @product1 = Product.create!(name: "Big Tree", quantity: 3, price_cents: 50, category_id: @category.id)
      @product2 = Product.create!(name: "Giant Tree", quantity: 5, price_cents: 50, category_id: @category.id)
      # Setup at least one product that will NOT be in the order
      @product3 = Product.create!(name: "Humongous Tree", quantity: 9, price_cents: 50, category_id: @category.id)
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(email: "bob@buyer.com", total_cents: 200, stripe_charge_id: 5)
      puts @product1.quantity

      # 2. build line items on @order
      @order.line_items.new(
        product: @product1,
        quantity: 2,
        item_price: 50,
        total_price: 100)
      @order.line_items.new(
        product: @product2,
        quantity: 2,
        item_price: 50,
        total_price: 100)
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eq(1)
      expect(@product2.quantity).to eq(3)
      
    end
    # pending test 2
    xit 'does not deduct quantity from products that are not in the order' do
      # TODO: Implement based on hints in previous test
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(email: "bob@buyer.com", total_cents: 200, stripe_charge_id: 5)
      puts @order.inspect
      puts @product1.quantity
      @order.line_items.new(
        product: @product1,
        quantity: 2,
        item_price: 50,
        total_price: 100)
      @order.line_items.new(
        product: @product2,
        quantity: 2,
        item_price: 50,
        total_price: 100)
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product3.reload

      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product3.quantity).to eq(9)
    end
  end
end

