class Card < ActiveRecord::Base
  belongs_to :pack
  validates_presence_of :front, :back
  validates_uniqueness_of :front
  validates_numericality_of :attempts, greater_than: -1
  validates_format_of :learning_stage, with: /(unfamiliar)|(familiar)|(learned)/
end
