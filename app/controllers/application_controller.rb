class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :alert_admin

  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  private

  def alert_admin
    ApplicationMailer.alert_admin.deliver_later
    redirect_to store_index_path, notice: 'Admin has been informed'
  end
end
