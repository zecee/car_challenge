class Api::V1::FavoritesController < ApplicationController
  def index
    favorites = current_user.favorites.includes(:car)
    render json: favorites.map { |f| f.car }, status: :ok
  end

  def create
    car = Car.find_by(id: params[:car_id])
    return render json: { error: "Auto no encontrado"  }, status: :not_found unless car

    current_user.favorites.find_or_create_by(car_id: car.id)
    render json: { message: "Auto agregado a favoritos" }, status: :created
  end

  def destroy
    favorite = current_user.favorites.find_by(car_id: params[:id])
    return render json: { error: "Favorito no encontrado" }, status: :not_found unless favorite

    favorite.destroy
    render json: { message: "Auto eliminado de favoritos" }, status: :ok
  end
end
