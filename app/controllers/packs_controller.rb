class PacksController < ApplicationController
  def show
    @pack = Pack.find(params[:id])
    @chart_data = [["Card", "Attempts",]]
    @chart_data += @pack.cards.map { |card| [card.front, card.attempts] }
  end

  def create
    pack = Pack.new(pack_params)
    pack.percent_learned = 0
    if pack.save
      current_user.packs << pack
      redirect_to user_path(current_user)
    else
      flash[:error] = "Something went wrong there. Try again."
      redirect_to user_path(current_user)
    end
  end

  private

  def pack_params
    params.require(:pack).permit(:name)
  end
end
