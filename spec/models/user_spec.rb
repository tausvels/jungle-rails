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

    end

    describe ".authenticate_with_credentials" do
       xit "Should NOT!! allow the user to log in" do 
        subject.password_confirmation='abcdefgh'
        expect(subject).to 
       end
    end

end