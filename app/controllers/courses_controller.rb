class CoursesController < ApplicationController
  include Taggable
  include Geolocation

  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:edit, :update, :destroy, :enroll]

  # GET /courses
  # GET /courses.json
  def index
    if params[:query].present?
      if !current_user
        @courses = Course.search(params[:query], page: params[:page], fields: [{name: :word_middle}], operator: "or").select { |i| i.approved == true }
      elsif current_user.admin?
        @courses = Course.search(params[:query], page: params[:page], fields: [{name: :word_middle}], operator: "or")
      else
        @courses = Course.search(params[:query], page: params[:page], fields: [{name: :word_middle}], operator: "or").select { |i| i.approved == true or i.lecturer == current_user }
      end
    else
      if !current_user
        @courses = Course.where(approved: true)
      elsif current_user.admin?
        @courses = Course.all.page params[:page]
      else
        @courses = Course.where("approved = ? or lecturer_id = ?", true, current_user.id)
      end
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @current_participants_count = @course.users.size
    @minimum_participants = @course.min_participants
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  def enroll
    course = Course.find(params[:id])
    course.users << current_user

    redirect_to course, notice: 'Successfully enrolled in course.'
  end

  # POST /courses
  # POST /courses.json
  def create
    location = course_params[:location]
    @course = Course.new(course_params.merge(lecturer: current_user, location: geocode_location(location)))

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params.merge(location: geocode_location(course_params[:location])))
         format.html { redirect_to @course, notice: 'Course was successfully updated.' }
         format.json { render :show, status: :ok, location: @course }
      else
         format.html { render :edit }
         format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  def autocomplete
    resultset = Course.search(params[:query], fields: [{name: :word_middle}])
    render json: resultset.map { |course| {value: course.name} }
  end

  def geo_scope_courses
    render json: Course.all.map(&:location).reject(&:blank?)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    def require_login
      redirect_to new_user_session_path unless current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).
             permit(:name, :date, :location, :description, :picture).
             merge(tags: extract_tags(params[:course][:tags])).
             merge(**current_user.admin? ? {approved: true} : {})
    end
end
