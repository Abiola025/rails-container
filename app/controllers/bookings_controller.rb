class BookingsController < ApplicationController
before_action :container_lookup, only: %i[create]

def create

    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.container = @container
    @booking.price = calculate_price
    @booking.accept = false
    @booking.decline = false
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



  def container_lookup
    @container = Container.find(params[:container_id])
  end

  def calculate_price
    @price = calculate_days * @container.daily_price
  end

  def calculate_days
    #placeholder calculation - need to calculate based on number of days
    @days = @booking.date_to - @booking.date_from
    @days = @days.to_i
  end
end
