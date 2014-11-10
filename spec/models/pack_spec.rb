require 'rails_helper'

describe Pack do
  it { should validate_presence_of :name }
  it { should belong_to :user }
  it { should have_many :cards }
end
