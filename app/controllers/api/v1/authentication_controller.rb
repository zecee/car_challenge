class Api::V1::AuthenticationController < ActionController::API
  def register
    user = User.new(user_params)
    if user.save
      render json: { message: "Usuario creado exitosamente" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: "Credenciales inválidas" }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
