# require_relative "../../app/services/stockhausen"
require 'rails_helper'

RSpec.describe Stockhausen do
  
  context "initial generation" do
    context "0 variations," do
      it "generates 0 stocks" do
        kingdom = Kingdom.create! name: "Kingdom"
        product = kingdom.products.create! name: "Product", description: "Me"
        Stockhausen.generate(product)
        expect(Stock.count).to eq(0)
      end
    end
    
    context "1 variation," do
      let(:kingdom) { Kingdom.create! name: "Kingdom" }
      let(:product) { kingdom.products.create! name: "Product", description: "Me" }
      let(:variation) { product.variations.create! name: "Variation" }
      
      context "0 variants," do
        it "generates 0 stocks" do
          Stockhausen.generate(product)
          expect(Stock.count).to eq(0)
        end
      end
      context "1 variant," do
        it "generates 1 stock" do
          variation.variants.create! name: "Variant"
          Stockhausen.generate(product)
          expect(Stock.count).to eq(1)
        end
      end
      context "2 variants," do
        it "generates 2 stocks" do
          variation.variants.create! name: "VariantA"
          variation.variants.create! name: "VariantB"
          Stockhausen.generate(product)
          expect(Stock.count).to eq(2)
        end
      end
    end

    context "2 variations," do
      let(:kingdom) { Kingdom.create! name: "Kingdom" }
      let(:product) { kingdom.products.create! name: "Product", description: "Me" }
      let(:variationA) { product.variations.create! name: "VariationA" }
      let(:variationB) { product.variations.create! name: "VariationB" }
      
      context "0 & 0 variants," do
        it "generates 0 stocks" do
          Stockhausen.generate(product)
          expect(Stock.count).to eq(0)
        end
      end
      context "1 & " do
        context "0 variants," do
          it "generates 1 stock", focus: false do
            variationA.variants.create! name: "VariantA1"
            Stockhausen.generate(product)
            expect(Stock.count).to eq(1)
          end
        end
        context "1 variant," do
          it "generates 1 stock" do
            variationA.variants.create! name: "VariantA1"
            variationB.variants.create! name: "VariantB1"
            Stockhausen.generate(product)
            expect(Stock.count).to eq(1)
          end
        end
        context "2 variants," do
          it "generates 2 stocks" do
            variationA.variants.create! name: "VariantA1"
            variationB.variants.create! name: "VariantB1"
            variationB.variants.create! name: "VariantB2"
            Stockhausen.generate(product)
            expect(Stock.count).to eq(2)
          end
        end
      end
      context "2 & " do
        context "2 variants," do
          it "generates 4 stocks" do
            variationA.variants.create! name: "VariantA1"
            variationA.variants.create! name: "VariantA2"
            variationB.variants.create! name: "VariantB1"
            variationB.variants.create! name: "VariantB2"
            Stockhausen.generate(product)
            expect(Stock.count).to eq(4)
          end
        end
      end
    end
  end
end
