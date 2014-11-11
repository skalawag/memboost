class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
    @user = current_user
    update_progress(@user)
  end

  private

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
