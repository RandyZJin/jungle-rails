class UsersController < ApplicationController
  def new
  end

  # def create
  #   user = User.new(user_params)
  #   if user.save
  #     session[:user_id] = user.id
  #     redirect_to '/'
  #   else
  #     redirect_to '/signup'
  #   end
  # end

  # private

  #   def user_params
  #     params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  #   end

  def create
    puts "----------------"
    puts user_params["first_name"]+" " +user_params['last_name']
    user = User.new
    user.name = user_params["first_name"]+" " + user_params['last_name']
    user.email = user_params["email"].strip.downcase
    user.password = user_params["password"]
    user.password_confirmation = user_params["password_confirmation"]
    if user.save
      session[:user_id] = user.id
      UserMailer.welcome_email(user).deliver_now
      redirect_to '/'
    else
      redirect_to '/signup'
    end

    # respond_to do |format|
    #   if user.save
    #     # Tell the UserMailer to send a welcome Email after save
    #     UserMailer.welcome_email(user).deliver
 
    #     # format.html { redirect_to(user, notice: 'User was successfully created.') }
    #     format.json { render json: user, status: :created, location: user }
    #   else
    #     # format.html { render action: 'new' }
    #     format.json { render json: user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
