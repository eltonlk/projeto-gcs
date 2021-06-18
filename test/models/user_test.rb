require "test_helper"

class UserTest < ActiveSupport::TestCase

  test "attributes" do
    assert_respond_to User.new, :name
    assert_respond_to User.new, :email
    assert_respond_to User.new, :password
    assert_respond_to User.new, :password_confirmation
    assert_respond_to User.new, :current_password
  end

  test "validations" do
    user = User.create
    errors_keys = user.errors.attribute_names

    assert_includes errors_keys, :name
    assert_includes errors_keys, :email
    assert_includes errors_keys, :password
  end

  test "should be valid" do
    user = User.new name: 'foo', email: 'foo@mail.com', password: '123456'
    assert_predicate user, :valid?
  end

end
