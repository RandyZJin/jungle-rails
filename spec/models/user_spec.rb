require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    #<User id: nil, name: nil, email: nil, password_digest: nil, created_at: nil, updated_at: nil>
    it 'should save properly if all fields are present' do
      @user = User.new
      @user.name = "Bob Buttons"
      @user.email = "bob@bob.com"
      @user.password = "bobbob"
      @user.password_confirmation = "bobbob"
      @user.save

      puts @user.inspect
      expect(@user.id).to be_present
    end

    it 'should not save properly if password does not match with confirmation' do
      @user = User.new
      @user.name = "Bob Buttons"
      @user.email = "bob@bob.com"
      @user.password = "bobbob"
      @user.password_confirmation = "notbobbob"
      @user.save

      puts @user.inspect
      expect(@user.id).to be_nil
    end

    it 'should not save properly if password is empty' do
      @user = User.new
      @user.name = "Bob Buttons"
      @user.email = "bob@bob.com"
      @user.save

      puts @user.inspect
      expect(@user.id).to be_nil
    end

    it 'should not save properly if email is already present' do
      @user = User.new
      @user.name = "Bob Buttons"
      @user.email = "bob@bob.com"
      @user.password = "bobbob"
      @user.password_confirmation = "bobbob"
      @user.save
      puts @user.inspect

      @user2 = User.new
      @user2.name = "Bob Buttons Jr"
      @user2.email = "BOB@bob.com"
      @user2.password = "bobagain"
      @user2.password_confirmation = "bobagain"
      @user2.save

      puts @user2.inspect
      expect(@user2.id).to be_nil
    end

    it 'should not save properly if email is not present' do
      @user = User.new
      @user.name = "Bob Buttons"
      @user.password = "bobbob"
      @user.password_confirmation = "bobbob"
      @user.save
      puts @user.inspect
      expect(@user.id).to be_nil
    end

    it 'should not save properly if name is not present' do
      @user = User.new
      @user.email = "bob@bob.com"
      @user.password = "bobbob"
      @user.password_confirmation = "bobbob"
      @user.save

      puts @user.inspect
      expect(@user.id).to be_nil
    end

    it 'should not save properly if password is too short' do
      @user = User.new
      @user.name = "Bob Buttons"
      @user.email = "bob@bob.com"
      @user.password = "bob"
      @user.password_confirmation = "bob"
      @user.save

      puts @user.inspect
      expect(@user.id).to be_nil
    end
  end
end
