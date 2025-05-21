class ContainersController < ApplicationController
  before_action :set_user, only: %i[new create]
  def index
    @containers = Container.all
  end
  def new
    @container = Container.new
  end

  def create
    @container = Container.new(container_params)
    @container.user = @user
    if @container.save
      redirect_to containers_path
    else
      render :new, status: :unprocessable_entity
  end
end

def show
  @container = Container.find(params[:id])
  @booking = Booking.new
  @bookings = @container.bookings.where(user_id: current_user)
end

private

def container_params
  params.require(:container).permit(:name, :detail, :width, :height, :length, :maximum_weight, :empty_weight, :daily_price, :image_url)
end

def set_user
  @user = current_user
end

end
