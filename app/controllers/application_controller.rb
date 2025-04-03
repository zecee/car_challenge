class ApplicationController < ActionController::API
  before_action :authenticate_user

  attr_reader :current_user

  private

  def authenticate_user
    header = request.headers["Authorization"]
    token = header.split(" ").last if header.present?

    decoded = JsonWebToken.decode(token)
    @current_user = User.find_by(id: decoded[:user_id]) if decoded

    render json: { error: "No autorizado" }, status: :unauthorized unless @current_user
  end
end
