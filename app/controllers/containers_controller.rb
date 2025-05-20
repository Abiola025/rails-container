class ContainersController < ApplicationController
  def index
    @containers = Container.all
  end
end
