class PacksController < ApplicationController
  def show
    @pack = Pack.find(params[:id])
  end
end
