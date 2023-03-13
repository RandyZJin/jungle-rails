require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save properly if all fields are present' do
      @category = Category.new
      @category.name = "Bobbert"
      @category.save!

      @product = Product.new
      @product.name = "Tree Fiddy"
      @product.price_cents = 350
      @product.quantity = 33
      @product.category = @category
      @product.save!
      expect(@product.id).to be_present
    end

    it 'should not save properly if name is missing' do
      @category = Category.new
      @category.name = "Bobbert"
      @category.save!

      @product = Product.new
      @product.price_cents = 350
      @product.quantity = 33
      @product.category = @category
      @product.save
      expect(@product.id).to be_nil
    end

    it 'should not save properly if price is missing' do
      @category = Category.new
      @category.name = "Bobbert"
      @category.save!

      @product = Product.new
      @product.name = "Tree Fiddy"
      @product.quantity = 33
      @product.category = @category
      @product.save
      expect(@product.id).to be_nil
    end

    it 'should not save properly if quantity is missing' do
      @category = Category.new
      @category.name = "Bobbert"
      @category.save!

      @product = Product.new
      @product.name = "Tree Fiddy"
      @product.price_cents = 350
      @product.category = @category
      @product.save
      expect(@product.id).to be_nil
    end

    it 'should not save properly if category is missing' do
      @category = Category.new
      @category.name = "Bobbert"
      @category.save!

      @product = Product.new
      @product.name = "Tree Fiddy"
      @product.price_cents = 350
      @product.quantity = 33
      @product.save
      expect(@product.id).to be_nil
    end

  end
end
