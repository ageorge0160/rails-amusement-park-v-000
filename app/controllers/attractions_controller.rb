class AttractionsController < ApplicationController

  before_action :find_attraction, only: [:show, :edit, :update, :destroy, :ride]

  def show
  end

  def edit
  end

  def new
    @attraction = Attraction.new
  end

  def index
    @attractions = Attraction.all
  end

  def update
    if @attraction.update(attraction_params)
      @attraction.save
      redirect_to "/attractions/#{@attraction.id}"
    else
      render "edit"
    end
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to "/attractions/#{@attraction.id}"
    else
      render 'new'
    end
  end

  def destroy
  end

  def ride
    ride = @attraction.rides.build(user:current_user)
    if ride.save
      flash[:message] = ride.take_ride
      redirect_to user_path(current_user)
    else
      flash[:message] = puts ride.take_ride
      redirect_to attraction_path(@attraction)
    end
  end


private
  def find_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end

end
