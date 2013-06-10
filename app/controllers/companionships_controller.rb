class CompanionshipsController < ApplicationController
  # GET /companionships
  # GET /companionships.json
  def index
    @companionships = Companionship.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companionships }
    end
  end

  # GET /companionships/1
  # GET /companionships/1.json
  def show
    @companionship = Companionship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @companionship }
    end
  end

  # GET /companionships/new
  # GET /companionships/new.json
  def new
    @companionship = Companionship.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @companionship }
    end
  end

  # GET /companionships/1/edit
  def edit
    @companionship = Companionship.find(params[:id])
  end

  # POST /companionships
  # POST /companionships.json
  def create
    @companionship = Companionship.new(params[:companionship])

    respond_to do |format|
      if @companionship.save
        format.html { redirect_to @companionship, notice: 'Companionship was successfully created.' }
        format.json { render json: @companionship, status: :created, location: @companionship }
      else
        format.html { render action: "new" }
        format.json { render json: @companionship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companionships/1
  # PUT /companionships/1.json
  def update
    @companionship = Companionship.find(params[:id])

    respond_to do |format|
      if @companionship.update_attributes(params[:companionship])
        format.html { redirect_to @companionship, notice: 'Companionship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @companionship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companionships/1
  # DELETE /companionships/1.json
  def destroy
    @companionship = Companionship.find(params[:id])
    @companionship.destroy

    respond_to do |format|
      format.html { redirect_to companionships_url }
      format.json { head :no_content }
    end
  end
end
