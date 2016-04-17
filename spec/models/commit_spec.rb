require 'rails_helper'

RSpec.describe Commit, type: :model do
  it { should validate_presence_of :date }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :sha }
  it { should validate_presence_of :message }
  it { should belong_to(:user)}
end
