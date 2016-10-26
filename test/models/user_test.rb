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

  test "A user without a uid field is invalid" do
    user = User.new(name: "Jack", email: "jack@github.com", provider: "github")
    assert_not user.valid?
    user.uid = 12345
    assert user.valid?
  end

  test "A user without a provider field is invalid" do
    user = User.new(name: "Jack", email: "jack@github.com", uid: 123456)
    assert_not user.valid?
    user.provider = "github"
    assert user.valid?
  end

  test "Ada has one task" do
    assert_equal users(:ada).tasks.length, 1
  end
end
