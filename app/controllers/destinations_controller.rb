class DestinationsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
  end

  def create
    @destination = Destination.create(donation_params)
    Destination.create(destination_params)
    redirect_to root_path
  end
  
end
