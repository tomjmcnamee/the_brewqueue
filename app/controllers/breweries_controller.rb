class BreweriesController < ApplicationController
  
  def index
    @breweries  = Brewery.all
  end
  
  def show
    @brewery = Brewery.find(params[:id])
  end
  
  def edit
    @brewery = Brewery.find(params[:id])
  end
  
  def update
    @brewery = Brewery.find(params[:id])
    if @brewery.update(brewery_params)
      redirect_to brewery_path(@brewery.id)
    else
      flash.now[:messages] = @brewery.errors.full_messages.first
      render :edit
    end
  end
  
  def new
    @brewery = Brewery.new
  end
  
  def create
    @brewery = Brewery.new
    if @brewery.update(brewery_params)
      redirect_to breweries_path
    else
      render :new
    end
  end
  
  def destroy
    @brewery = Brewery.find(params[:id])
    @brewery.destroy
    redirect_to breweries_path
  end

  private

  def brewery_params
    params.require(:brewery).permit(:name, :brewery_type, :street, :city, :state, :postal_code, :country, :longitude, :latitude, :phone, :website_url)
  end

end
