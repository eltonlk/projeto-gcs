require "test_helper"

class TagTest < ActiveSupport::TestCase

  setup do
    @user = users(:one)
  end

  test "attributes" do
    assert_respond_to Tag.new, :name
    assert_respond_to Tag.new, :user
  end

  test "validations" do
    tag = Tag.create
    errors_keys = tag.errors.attribute_names

    assert_includes errors_keys, :name
    assert_includes errors_keys, :user
  end

  test "should be valid" do
    tag = Tag.new name: 'foo', user: @user
    assert_predicate tag, :valid?
  end

end
