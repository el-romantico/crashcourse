class UsersController < ApplicationController
  before_filter :authenticate_user!

  def calendar
    beginning_of_this_month = Date.today.beginning_of_month
    end_of_this_month = Date.today.end_of_month

    @courses = current_user.courses.where(date: beginning_of_this_month..end_of_this_month )
  end

  def show
    @user = User.find params[:id]
    @courses_as_teacher = Course.where(lecturer_id: @user.id) || []
    @requests = @user.requests || []
  end
end
