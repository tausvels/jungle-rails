require 'rails_helper'
require "user.rb"

RSpec.describe User, type: :model do
    subject {
      described_class.new(name: "tausif", email: "abc@gmail.com", password: "abc", password_confirmation: "abc")
    }
    describe "validations" do
      it "user is valid" do
        # user = User.new(
        #   name: "tausif",
        #   email: "abc@gmail.com",
        #   password: "abc",
        #   password_confirmation: "abc"
        # )
        expect(subject).to be_valid
      end
    end

end