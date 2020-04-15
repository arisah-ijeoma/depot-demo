class ApplicationController < ActionController::Base
  before_action :authorize

  rescue_from ActiveRecord::RecordNotFound, with: :alert_admin

  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  private

  def alert_admin
    ApplicationMailer.alert_admin.deliver_later
    redirect_to store_index_path, notice: 'Admin has been informed'
  end

  protected

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to store_index_url, notice: 'Please log in'
    end
  end
end
