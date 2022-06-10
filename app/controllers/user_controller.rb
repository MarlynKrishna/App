class UserController < ApplicationController
def create
  @user = User.new(user_params)
  if @user.save
    flash[:notice]="Signup successful"
   redirect_to '/login'
  else
    Rails.logger.info @user.errors.full_messages
    flash[:notice]= @user.errors.full_messages
    redirect_to '/signup'
  end
end

def new
  @user=User.new
end

def index
  @products=Product.all
  @customers=Customer.all
  response = HTTParty.get("http://api.weatherstack.com/current?access_key=b52b44c8ab38a36cd7108512a793c4c5&query=New%20York")
  Rails.logger.info response.code

    Rails.logger.info response.body

    Rails.logger.info response.to_a
    a =JSON.parse(response.body)

    @query = a["request"]["query"]

    @WindSpeed = a["current"]["wind_speed"]

    @Precip = a["current"]["precip"]

    @Pressure = a["current"]["pressure"]

    @Humidity = a["current"]["humidity"]

  @Visibility = a["current"]["visibility"]
end
private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :email, :password)
  end
end
