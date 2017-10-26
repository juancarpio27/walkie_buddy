class CardsController < ApplicationController

  def edit
    @card = User.find(params[:user_id]).card
  end

  def new
    @card = Card.new
  end

  def create
    @card = User.find(params[:user_id]).build_card(card_params)
    if @card.save
      redirect_to authenticated_root_path
    else
      redirect_to new_user_card_path(current_user)
    end
  end

  def update
    @card = User.find(params[:user_id]).card
    if @card.update(card_params)
      redirect_to authenticated_root_path
    else
      redirect_to edit_user_card_path(current_user)
    end
  end

  def destroy
    @card = User.find(params[:user_id]).card
    if @card.destroy
      redirect_to authenticated_root_path
    end
  end

  private

  def card_params
    params.require(:card).permit(:holder_name, :number, :expiration_month, :expiration_year, :brand)
  end

end
