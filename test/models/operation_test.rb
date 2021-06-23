require "test_helper"

class OperationTest < ActiveSupport::TestCase

  setup do
    @bank_account = bank_accounts(:one)
    @user = users(:one)
  end

  test "attributes" do
    operation = Operation.new

    assert_respond_to operation, :amount
    assert_respond_to operation, :bank_account_id
    assert_respond_to operation, :comment
    assert_respond_to operation, :description
    assert_respond_to operation, :due_at
    assert_respond_to operation, :flow_in
    assert_respond_to operation, :paid
    assert_respond_to operation, :user
  end

  test "validations" do
    operation = Operation.create
    errors_keys = operation.errors.attribute_names

    assert_includes errors_keys, :bank_account
    assert_includes errors_keys, :description
    assert_includes errors_keys, :due_at
    assert_includes errors_keys, :user
  end

  test "should be valid" do
    operation = Operation.new description: 'foo', due_at: Date.today, bank_account: @bank_account, user: @user
    assert_predicate operation, :valid?
  end

end
