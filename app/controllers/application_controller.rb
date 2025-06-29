class ApplicationController < ActionController::API
  private

  def page
    (params[:page] || 1).to_i
  end

  def per_page
    (params[:per_page] || 25).to_i
  end
end
