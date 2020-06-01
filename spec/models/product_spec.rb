require 'rails_helper'
require "pp"

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it "is valid with valid attributes" do
      @category = Category.new(name: 'Appliances')
      @product = Product.new(
        name: "Toaster",
        price_cents: 5000,
        quantity: 5,
        category: @category
      )
      expect(@product).to be_valid
    end
    it "is is not valid without name" do
      @category = Category.new(name: 'Appliances')
      @product = Product.create(
        name: nil,
        price_cents: 5000,
        quantity: 5,
        category: @category
      )
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
    end
    it "is not valid without price" do
      @category = Category.new(name: 'Appliances')
      @product = Product.create(
        name: "toaster",
        price_cents: nil,
        quantity: 5,
        category: @category
      )
      expect(@product).to_not be_valid
    end
    it "is valid not valid without quantity" do
      @category = Category.new(name: 'Appliances')
      @product = Product.create(
        name: "Toaster",
        price_cents: 5000,
        quantity: nil,
        category: @category
      )
      expect(@product).to_not be_valid
    end
    it "is valid not valid without category" do
      @product = Product.create(
        name: "Toaster",
        price_cents: 5000,
        quantity: 5,
        category: nil
      )
      expect(@product).to_not be_valid
    end
  end
end