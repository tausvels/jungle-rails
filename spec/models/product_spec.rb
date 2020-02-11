require 'rails_helper'
require "product.rb"
require "category.rb"

RSpec.describe Product, type: :model do
  let(:category) {Category.new(:name => "mobile", :created_at => DateTime.now, :updated_at => DateTime.now)}
  subject {
    described_class.new(name: "onePlusX", price_cents:100, quantity:20, category: category)
  }
  it "Product should be valid" do
    expect(subject).to be_valid 
  end
  
  it "Product should be invalid without a Name" do
    subject.name = nil
    subject.valid?
    message=subject.errors[:name] 
    expect(message).to include("can't be blank")
  end

  it "Product should be invalid without a Price" do
    subject.price_cents = nil
    subject.valid?
    message=subject.errors[:price_cents] 
    expect(message).to include("is not a number") 
  end

  it "Product should be invalid without a Quantity" do
    subject.quantity = nil
    subject.valid?
    message=subject.errors[:quantity] 
    expect(message).to include("can't be blank") 
  end

  it "Product should be invalid without a Category" do
    subject.category = nil
    subject.valid?
    message=subject.errors[:category] 
    expect(message).to include("can't be blank") 
  end


end
