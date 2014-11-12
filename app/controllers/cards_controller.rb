class CardsController < ApplicationController
  def new
    @pack_id = params[:data][:pack_id]
    @pack = Pack.find(params[:data][:pack_id])
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    Pack.find(params[:pack_id]).cards << @card
    if @card.save
      redirect_to user_path(current_user)
    else
      flash[:error] = "Something went wrong."
      render :new
    end
  end

  def random_card
    if Pack.find(params[:data][:pack_id]).cards.empty?
      flash[:error] = "There are no cards in that pack. You can create some with the Add Cards link below."
      redirect_to pack_path(params[:data][:pack_id])
    else
      redirect_to card_path(Pack.find(params[:data][:pack_id]).cards.sample.id)
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  def answer
    @card = Card.find(params[:card_id])
  end

  def learned
    @card = Card.find(params[:card_id])
    @card.update!(learning_stage: 'learned')
  end

  private

  def card_params
    params.require(:card).permit(:front, :back)
  end
end
