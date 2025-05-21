class BookingsController < ApplicationController
before_action :set_user, only: %i[create]
before_action :set_container, only: %i[create calculate_price]

def create
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.container = @container
    @booking.price = calculate_price
    if @booking.save
      redirect_to container_path(@container)
    else
      render 'containers/show', status: :unprocessable_entity
    end
end

  private
  def booking_params
    params.require(:booking).permit(:comment, :date_from, :date_to)
  end

  def user_lookup
    @user = current_user
  end

  def container_lookup
    @container = Container.find(params[:container_id])
  end

  def calculate_price
    @price = calculate_days * @container.daily_price
  end

  def calculate_days
    #placeholder calculation - need to calculate based on number of days
    @days = 10
  end
end
