class DashboardController < TenantController

  def index
    @bank_accounts = BankAccount.all
    @balance_by_bank_accounts = Operation.group(:bank_account_id).sum(:amount)

    respond_with :dashboard
  end

end
