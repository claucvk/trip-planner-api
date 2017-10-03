class TripsController < OpenReadController
  before_action :set_trip, only: [:show, :update, :destroy]

  # GET /trips
  def index
    # binding.pry
    @trips = current_user.trips
    # @trips = Trip.all

    render json: @trips
  end

  # GET /trips/1
  def show
    @trip = current_user.trips.find(params[:id])
    render json: @trip
  end

  # POST /trips
  def create
    @trip = current_user.trips.build(trip_params)

    # Trip.new(trip_params)

    if @trip.save
      render json: @trip, status: :created, location: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trips/1
  def update
    if @trip.update(trip_params)
      head :no_content
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trips/1
  def destroy
    @trip = current_user.trips.find(params[:id])
    @trip.destroy

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = current_user.trips.find(params[:id])
      # Trip.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trip_params
      params.require(:trip).permit(:user_id, :place_name, :departing_date, :returning_date, :travel_duration, :transportation, :accomodation, :eat, :activities)
    end
end
