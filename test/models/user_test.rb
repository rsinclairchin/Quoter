require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(first_name: "Example", last_name: "User", email: "user@example.com", password: 'test1234')
  end

  test "should be valid" do
    assert @user.valid?
  end
end
