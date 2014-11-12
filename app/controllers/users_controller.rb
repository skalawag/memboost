class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      flash[:success] = "Welcome, #{@user.username}"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @pack = Pack.new
    @user = current_user
    update_user_progress(@user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def update_user_progress(user)
    packs = user.packs
    if not packs.empty?
      packs.each do |pack|
        learned = pack.cards.where('learning_stage = ?', 'learned').count
        percentage = ((learned / (pack.cards.count * 1.0)) * 100).round(2)
        percentage.to_s.to_i
        pack.update!(percent_learned: percentage)
      end
    end
  end
end
