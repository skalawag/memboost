class CardsController < ApplicationController
  def new
    @pack_id = params[:data][:pack_id]
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.pack_id = params[:pack_id]
    # FIXME: these are default parameters, and I should be able to add
    # them as such in the model
    @card.learning_stage = 'unlearned'
    @card.attempts = 0
    if @card.save
      flash[:success] = "Your card was added."
      redirect_to pack_path(params[:pack_id])
    else
      flash[:error] = "Something went wrong."
      render :new
    end
  end

  private

  def card_params
    params.require(:card).permit(:front, :back)
  end
end
