require 'rails_helper'
require "user.rb"

RSpec.describe User, type: :model do
    subject {
      described_class.new(
        name: "tausif", 
        email: "abc@gmail.com", 
        password: "abcdef", 
        password_confirmation: "abcdef")
    }
    describe "validations" do
      it "user is valid" do
        expect(subject).to be_valid
      end
      
      it "User is invalid without name" do
        subject.name=nil
        # expect(subject.errors[:name]).to include("can't be blank")
        expect(subject).to be_invalid
      end
      it "User is invalid without email" do
        subject.email=nil
        expect(subject).to be_invalid
      end
      it "User is invalid without password" do
        subject.password=nil
        expect(subject).to be_invalid
      end
      it "User is invalid without password_confirmation" do
        subject.password_confirmation=nil
        expect(subject).to be_invalid
      end
      it "Passwords do not match" do
        subject.password_confirmation="somethinelse"
        subject.valid?
        expect(subject.errors[:password_confirmation]).to be_present
      end
      it "User is invalid if password is less than 5 characters" do
        subject.password = "abc"
        subject.valid?
        expect(subject).to be_invalid
      end
      it "email must be unique" do
        subject {
          described_class.new(
            name: "tausif", 
            email: "abc@gmail.com", 
            password: "abcdef", 
            password_confirmation: "abcdef")
        }
        subject.save

        new_user = User.new
        new_user.name = "khan"
        new_user.email = "abc@gmail.com"
        new_user.password = 'abcdef'
        new_user.password_confirmation = 'abcdef'
        
        new_user.valid?
      
        expect(new_user.errors[:email].first).to eq('has already been taken')
      end

    end

    describe ".authenticate_with_credentials" do
       it "Should be allowed to pass with valid credentials" do 
        subject {
          described_class.new(
            name: "tausif", 
            email: "abc@gmail.com", 
            password: "abcdef", 
            password_confirmation: "abcdef")
        }
        subject.save
        subject = User.authenticate_with_credentials('abc@gmail.com', 'abcdef')
        expect(subject).not_to be(nil)
       end
       it "Should NOT! be allowed to pass with invalid password" do 
        subject {
          described_class.new(
            name: "tausif", 
            email: "abc@gmail.com", 
            password: "abcdef", 
            password_confirmation: "abcdef")
        }
        subject.save
        subject = User.authenticate_with_credentials('abc@gmail.com', 'abcdefghijklmnop')
        expect(subject).to be(nil)
       end
       it "Should NOT! be allowed to pass with invalid email" do 
        subject {
          described_class.new(
            name: "tausif", 
            email: "abc@gmail.com", 
            password: "abcdef", 
            password_confirmation: "abcdef")
        }
        subject.save
        subject = User.authenticate_with_credentials('abcd@gmail.com', 'abcdef')
        expect(subject).to be(nil)
       end
    end
    describe "Edge cases" do
      it "Should allow the user to login with empty white space in email address" do
        subject {
          described_class.new(
            name: "tausif", 
            email: "abc@gmail.com", 
            password: "abcdef", 
            password_confirmation: "abcdef")
        }
        subject.save
        subject = User.authenticate_with_credentials('   abc@gmail.com    ', 'abcdef')
        expect(subject).not_to be(nil)
      end
      it "Should allow the user to login with capitalized email address" do
        subject {
          described_class.new(
            name: "tausif", 
            email: "abc@gmail.com", 
            password: "abcdef", 
            password_confirmation: "abcdef")
        }
        subject.save
        subject = User.authenticate_with_credentials('   aBC@gmail.com    ', 'abcdef')
        expect(subject).not_to be(nil)
      end
    end
end