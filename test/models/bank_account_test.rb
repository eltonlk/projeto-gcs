require "test_helper"

class BankAccountTest < ActiveSupport::TestCase

  setup do
    @user = users(:one)
  end

  test "attributes" do
    assert_respond_to BankAccount.new, :name
    assert_respond_to BankAccount.new, :user
  end

  test "validations" do
    bank_account = BankAccount.create
    errors_keys = bank_account.errors.attribute_names

    assert_includes errors_keys, :name
    assert_includes errors_keys, :user
  end

  test "should be valid" do
    bank_account = BankAccount.new name: 'foo', user: @user
    assert_predicate bank_account, :valid?
  end

end
