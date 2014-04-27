class NotificationsController < ApplicationController
  before_filter :authenticate_user!

  def list
    @notifications = Notification.where(subscriber: current_user).take(15)
    render "_list", layout: nil
  end

  def see
    @notification = Notification.find(params[:id])
    @notification.seen = true
    @notification.save
    render json: {}
  end
end
