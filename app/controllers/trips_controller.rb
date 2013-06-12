class TripsController < ApplicationController
  before_filter :authenticate_user!#, except: [:index, :show]
  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
    if params[:tag]
      @trips = Trip.tagged_with(params[:tag])
    else
      @trips = Trip.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end

  def create_comment
    @trip = Trip.find(params[:id])
    @comment = @trip.comments.new params[:comment]
    redirect_to :action => :show, :id => trip

    # @post = @post.find params[:post_id]
    # @comment = @post.comments.new params[:comment]
    # if @comment.save
    # redirect_to @post

    # @trip = Trip.find(params[:id])
    # @user_who_commented = @current_user
    # @comment = Comment.build_from( @trip, @user_who_commented.id, "Hey guys this is my comment!" )
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @trip, notice: 'Comment was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: "show" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def show_comment
    @trip = Trip.find(params[:id])
    @comments = @trip.comments.all
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find(params[:id])
    @user_who_commented = current_user
    @commentable = @trip
    @comments = @commentable.comments
    @comment = Comment.new#(:body => params[:body], :user_id => @user_who_commented)

    # @cities_in_current_trip = City.joins(:trip).where(cities: {trip_id: @trip.id})
    # @iteneraries_of_current_trip = Itenerary.joins(:city).where(iteneraries: {trip_id: @trip.id})


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.json
  def new
    @trip = Trip.new
    @trip.cities.build
    @trip.cities.each do |t|
      t.iteneraries.build
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(params[:trip])
    @trip.user_id = current_user.id

    respond_to do |format|
      if @trip.save
        format.html { redirect_to new_city_path, notice: 'Trip was successfully created.' }
        format.json { render json: @trip, status: :created, location: @trip }
      else
        format.html { render action: "new" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trips/1
  # PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end
end
