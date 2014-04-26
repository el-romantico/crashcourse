class UsersController < Devise::SessionsController
  before_filter :authenticate_user!

  def calendar
    beginning_of_this_month = Date.today.beginning_of_month
    end_of_this_month = Date.today.end_of_month

    @courses = current_user.courses.where(date: beginning_of_this_month..end_of_this_month )
  end

end
