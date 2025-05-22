class BookingsController < ApplicationController
before_action :container_lookup, only: %i[create]

def index
  @my_bookings = Booking.where(user_id: current_user)
  @containers = Container.where(user_id: current_user)
  @sales_bookings = []
  @containers.each do |container|
    if container.bookings.all.empty?
    else
    @sales_bookings << container.bookings.all
    end
  end
end

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

def accept
  @booking = Booking.find(params[:id])

  if date_clash(@booking)==true
    redirect_to bookings_path, status: :see_other
  else
    @booking.accept=true
    @booking.save
    redirect_to bookings_path, status: :see_other
  end
end

def decline
  @booking = Booking.find(params[:id])
  @booking.decline =true
  @booking.save
  redirect_to bookings_path, status: :see_other
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
    @days = @days + 1
  end

  def date_clash(booking)
    clashes = Booking.where("date_to > ?", DateTime.now)
    clashes = clashes.where(accept: true)
    result = false
      clashes.each do |clash|
        break if result==true
        if booking.date_from > clash.date_from && booking.date_from < clash.date_to
          result = true
        elsif booking.date_to > clash.date_from && booking.date_to < clash.date_to
          result = true
        elsif booking.date_from < clash.date_from && booking.date_to > clash.date_to
          result = true
          break
        else
          result = false
        end
      end
      return result
  end
end
