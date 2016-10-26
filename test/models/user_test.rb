require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "Ada is a valid user" do
    assert users(:ada).valid?
  end

  test "Babbage, though with no name, is a valid user" do
    assert users(:babbage).valid?
  end

  test "A user without an email is invalid" do
    user = User.new(name: "Jack", uid: 123, provider: "github")
    assert_not user.valid?
    user.email = "jack@github.com"
    assert user.valid?
  end
end
