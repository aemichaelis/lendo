class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = policy_scope(Notification.where(recipient: current_user).unread)
  end

  def update
    @notification = Notification.find(params[:id])
    authorize @notification
    @notification.update(read_at: Time.zone.now)
    redirect_to notifications_path
  end
end
