require 'rails_helper'

describe User do
  it { should have_many :packs }
  it { should validate_presence_of :username }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should have_secure_password }
end
