class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: {case_sensitive: false}, presence: true
  validates :name, presence: true
  validates :password, length: { in: 6..20 }

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email)
    puts @user.inspect
    if @user != nil
      puts "user is"
      puts @user.inspect
      if @user.authenticate(password)
        @user
      else 
        false
      end
    else 
      false
    end
  end
end
