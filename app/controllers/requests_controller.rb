class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

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
    @request = Request.new(request_params)
    extract_args(params)
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    extract_args(params)
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:name, :date, :location, :description)
    end

    def extract_args(params)
      respond_to do |format|
        if @request.save
          tags = params[:request][:tags].split(',')
                                        .map(&:strip)
                                        .map { |tag| Tag.where(:label => tag).first_or_create }
          @request.tags << tags
          format.html { redirect_to @request, notice: 'Request was successfully created.' }
          format.json { render :show, status: :created, location: @request }
        else
          format.html { render :new }
          format.json { render json: @request.errors, status: :unprocessable_entity }
        end
      end
    end
end
