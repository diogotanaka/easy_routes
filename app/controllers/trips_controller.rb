class TripsController < ApplicationController
  def index
    @trips = current_user.trips.order(created_at: :desc)
  end

  def show
    @message = Message.new
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to @trip
    else
      render :new
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:user_id, :origin, :destination, :start_date)
  end
end
