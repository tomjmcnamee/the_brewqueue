class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_brewqueues = UserBrewQueue.where(user_id: @user.id)
    @states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
    if params[:search_name] || params[:search_city] || params[:search_state]
      search_name = params[:search_name]
      search_city = params[:search_city] 
      search_state = params[:search_state] 
      # byebug
      @search_result_brewery_objs = Brewery.search_for_brewery(search_name.downcase, search_city.downcase,search_state)
      # byebug
      # redirect_to user_path(@user.id)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:first_name, :last_name, :street, :city, :state, :postal_code, :age, :age, :email_address, :password_digest))
    @user.save
    redirect_to users_path(@user)
  end 

  def update
    @user = User.find(params[:id])
    @user.update(user_params(:first_name, :last_name, :street, :city, :state, :postal_code, :age, :age, :email_address, :password_digest))
    redirect_to users_path(@user)
  end 

  def destroy 
    @user = User.find(params[:id])
    @user.delete
    redirect_to users_path
  end 

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end 
end
