module CoursesHelper

  def formatted_date(date)
    date.strftime('%B %e, %Y at %l:%M %p')
  end

end
