class Card < ActiveRecord::Base
  belongs_to :pack
  validates_presence_of :front, :back
  validates_numericality_of :attempts, greater_than: -1
  validates_format_of :learning_stage, with: /(unfamiliar)|(familiar)|(learned)/

  def creation_date
    time = self.created_at.time
    time.month.to_s + "-" + time.day.to_s + "-" + time.year.to_s
  end
end
