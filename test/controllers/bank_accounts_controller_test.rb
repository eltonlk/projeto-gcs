require "test_helper"

class BankAccountsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)

    @bank_account = bank_accounts(:one)
  end

  test "should get index" do
    get bank_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_bank_account_url
    assert_response :success
  end

  test "should create bank_account" do
    assert_difference('BankAccount.count') do
      post bank_accounts_url, params: { bank_account: { name: 'Other Bank Account' } }
    end

    assert_redirected_to bank_accounts_url
  end

  test "should get edit" do
    get edit_bank_account_url(@bank_account)
    assert_response :success
  end

  test "should update bank_account" do
    patch bank_account_url(@bank_account), params: { bank_account: { name: @bank_account.name } }
    assert_redirected_to bank_accounts_url
  end

  test "should get delete" do
    get delete_bank_account_url(@bank_account)
    assert_response :success
  end

  test "should destroy bank_account" do
    assert_difference('BankAccount.count', -1) do
      delete bank_account_url(@bank_account), params: { bank_account_delete_form: { replace_id: bank_accounts(:two).id } }
    end

    assert_redirected_to bank_accounts_url
  end
end
