class Api::V1::CarsController < ApplicationController
  def index
    cars = Car.all
    cars = cars.where(brand: params[:brand]) if params[:brand].present?

    render json: cars, status: :ok
  end
end
