require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validates attribute" do
    let(:product) {
      Fabricate(:product)
    }

    it "valid attributes" do
      expect(Product.new(name: product.name, price: product.price, image: product.image)).to be_valid
    end

    describe "invalid attributes" do
      it "attributes nil" do
        expect(Product.new(price: product.price, image: product.image)).not_to be_valid
      end

      it "lack of name" do
        expect(Product.new(price: product.price, image: product.image)).not_to be_valid
      end

      it "lack of price" do
        expect(Product.new(name: product.name, image: product.image)).not_to be_valid
      end

      it "lack of image" do
        expect(Product.new(name: product.name, price: product.price)).not_to be_valid
      end

      it "product discount price" do
        discount_percentage = Rails.application.config.discount_percentage
        expect(product.discount_price).to eq(product.price * discount_percentage)
      end
    end
  end
end
