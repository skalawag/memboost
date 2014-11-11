class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user
      flash[:success] = "Welcome, #{user.username}"
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      render root_path
    end
  end

  def show
    @pack = Pack.new
    @user = current_user
    update_progress(@user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def update_progress(user)
    packs = user.packs
    if not packs.empty?
      packs.each do |pack|
        learned = pack.cards.where('learning_stage = ?', 'learned').count
        percentage = ((learned / (pack.cards.count * 1.0)) * 100).round(2)
        percentage = 0.2 if percentage == 0.0 || pack.cards.count == 0
        pack.update!(percent_learned: percentage.to_s)
      end
    end
  end
end
