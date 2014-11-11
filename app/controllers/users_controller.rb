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
    @user = current_user
    update_progress(@user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def update_progress(user)
    user.packs.each do |pack|
      learned = pack.cards.where('learning_stage = ?', 'learned').count
      # why do i have to cast this to a string to avoid
      # FloatDomainError?
      percentage = ((learned / (pack.cards.count * 1.0)) * 100).round(2).to_s
      pack.update!(percent_learned: percentage)
    end
  end
end
