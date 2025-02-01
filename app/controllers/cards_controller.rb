class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :contributor_confirmation, only: :index
  before_action :move_to_index, only: :index

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @card_address = CardAddress.new
  end

  def create
    @card_address = CardAddress.new(card_params)
    if @card_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: card_params[:token],    
        currency: 'jpy'                 
      )
      @card_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def card_params
    params.require(:card_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    if current_user == @item.user
    redirect_to root_path
    end
  end

  def move_to_index
    if @item.card.present?
      redirect_to root_path
    end
  end

end