class PacksController < ApplicationController
  def show
    @pack = Pack.find(params[:id])
  end

  def create
    pack = Pack.new(pack_params)
    if pack.save
      current_user.packs << pack
      redirect_to user_path(current_user)
    else
      flash[:error] = "Something went wrong there. Try again."
    end
  end

  private

  def pack_params
    params.require(:pack).permit(:name)
  end
end
