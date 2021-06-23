require "test_helper"

class OperationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)

    @operation = operations(:one)
  end

  test "should get index" do
    get operations_url
    assert_response :success
  end

  test "should get new" do
    get new_operation_url
    assert_response :success
  end

  test "should create operation" do
    assert_difference('Operation.count') do
      post operations_url, params: { operation: { amount: @operation.amount, bank_account_id: @operation.bank_account_id, comment: @operation.comment, description: @operation.description, due_at: @operation.due_at, flow_in: @operation.flow_in, paid: @operation.paid, user_id: @operation.user_id } }
    end

    assert_redirected_to operations_url
  end

  test "should get edit" do
    get edit_operation_url(@operation)
    assert_response :success
  end

  test "should update operation" do
    patch operation_url(@operation), params: { operation: { amount: @operation.amount, bank_account_id: @operation.bank_account_id, comment: @operation.comment, description: @operation.description, due_at: @operation.due_at, flow_in: @operation.flow_in, paid: @operation.paid, user_id: @operation.user_id } }
    assert_redirected_to operations_url
  end

  test "should destroy operation" do
    assert_difference('Operation.count', -1) do
      delete operation_url(@operation)
    end

    assert_redirected_to operations_url
  end
end
