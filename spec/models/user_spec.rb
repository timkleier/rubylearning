require "rails_helper"
#USER PARAMS#
#<User id: nil, email: nil, admin: nil, created_at: nil, updated_at: nil>
RSpec.describe User, :type => :model do
  it "validates uniqe email attribute" do
    valid_user = User.create!(email: 'test.man@test.com')
    invalid_user = User.new(email: 'test.man@test.com')

    expect(valid_user.valid?).to eq(true)
    expect{invalid_user.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end
end
