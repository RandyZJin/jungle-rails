require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    #<User id: nil, name: nil, email: nil, password_digest: nil, created_at: nil, updated_at: nil>
    it 'should save properly if all fields are present' do
      @user = User.new
      @user.name = "Bob"
      @user.email = "bob@bob.com"
      @user.password = "bob"
      @user.password_confirmation = "bob"
      @user.save

      puts @user.inspect
      expect(@user.id).to be_present
    end

    it 'should not save properly if password does not match with confirmation' do
      @user = User.new
      @user.name = "Bob"
      @user.email = "bob@bob.com"
      @user.password = "bob"
      @user.password_confirmation = "notbob"
      @user.save

      puts @user.inspect
      expect(@user.id).to be_nil
    end

    it 'should not save properly if password is empty' do
      @user = User.new
      @user.name = "Bob"
      @user.email = "bob@bob.com"
      @user.save

      puts @user.inspect
      expect(@user.id).to be_nil
    end
  end
end
