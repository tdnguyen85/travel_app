class ItenerariesController < ApplicationController
  # GET /iteneraries
  # GET /iteneraries.json
  def index
    @iteneraries = Itenerary.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @iteneraries }
    end
  end

  # GET /iteneraries/1
  # GET /iteneraries/1.json
  def show
    @itenerary = Itenerary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @itenerary }
    end
  end

  # GET /iteneraries/new
  # GET /iteneraries/new.json
  def new
    @itenerary = Itenerary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @itenerary }
    end
  end

  # GET /iteneraries/1/edit
  def edit
    @itenerary = Itenerary.find(params[:id])
  end

  # POST /iteneraries
  # POST /iteneraries.json
  def create
    @itenerary = Itenerary.new(params[:itenerary])
    @itenerary.city_id = City.last.id
    @itenerary.trip_id = Trip.last.id
    respond_to do |format|
      if @itenerary.save
        format.html { redirect_to @itenerary, notice: 'Itenerary was successfully created.' }
        format.json { render json: @itenerary, status: :created, location: @itenerary }
      else
        format.html { render action: "new" }
        format.json { render json: @itenerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /iteneraries/1
  # PUT /iteneraries/1.json
  def update
    @itenerary = Itenerary.find(params[:id])
    @itenerary.trip_id = params[:trip]
    @Itenerary.city_id = params[:city]
    respond_to do |format|
      if @itenerary.update_attributes(params[:itenerary])
        format.html { redirect_to @itenerary, notice: 'Itenerary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @itenerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iteneraries/1
  # DELETE /iteneraries/1.json
  def destroy
    @itenerary = Itenerary.find(params[:id])
    @itenerary.destroy

    respond_to do |format|
      format.html { redirect_to iteneraries_url }
      format.json { head :no_content }
    end
  end
end
