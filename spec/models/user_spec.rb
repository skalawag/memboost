require 'rails_helper'

describe User do
  it { should have_many :cards }
  it { should validate_presence_of :username }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
end
