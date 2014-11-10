class CardsController < ApplicationController
  def new
    @pack_id = params[:data][:pack_id]
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.pack_id = params[:pack_id]
    if @card.save
      flash[:success] = "Your card was added."
      redirect_to pack_path(params[:pack_id])
    else
      flash[:error] = "Something went wrong."
      render :new
    end
  end

  def random_card
    redirect_to card_path(Pack.find(params[:data][:pack_id]).cards.sample.id)
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
