class RequestsController < ApplicationController
  include Taggable
  include Geolocation


  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :require_eligible, only: [:edit, :update, :destroy]
  before_action :require_login, only: [:new]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    location = request_params[:location]
    @request = Request.new(request_params.merge(requester: current_user, location: geocode_location(location)))

    respond_to do |format|
      if @request.save
        @request.tags << extract_tags(params[:request][:tags])
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    location = request_params[:location]

    if @request.update(request_params.merge(location: geocode_location(location)))
      @request.tags << extract_tags(params[:request][:tags])
      format.html { redirect_to @request, notice: 'Request was successfully updated.' }
      format.json { render :show, status: :ok, location: @request }
    else
      format.html { render :edit }
      format.json { render json: @request.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    def require_eligible
      unless current_user && (current_user.admin? || current_user == @course.lecturer)
        redirect_to @course
      end
    end

    def require_login
      redirect_to new_user_session_path unless current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:name, :date, :location, :description)
    end
end
