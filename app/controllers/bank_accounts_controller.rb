class BankAccountsController < TenantController
  before_action :set_bank_account, only: %i[ edit update delete destroy ]

  def index
    @bank_accounts = BankAccount.all

    respond_with @bank_accounts
  end

  def new
    @bank_account = BankAccount.new

    respond_with @bank_account
  end

  def edit
    respond_with @bank_account
  end

  def create
    @bank_account = BankAccount.create bank_account_params

    respond_with @bank_account, location: -> { bank_accounts_url }
  end

  def update
    @bank_account.update bank_account_params

    respond_with @bank_account, location: -> { bank_accounts_url }
  end

  def delete
    @bank_account_delete_form = BankAccountDeleteForm.new

    respond_with @bank_account
  end

  def destroy
    @bank_account_delete_form = BankAccountDeleteForm.new bank_account_delete_params

    @bank_account.destroy_and_replace! @bank_account_delete_form

    respond_with @bank_account, action: :delete, location: -> { bank_accounts_url }
  end

  private
    def set_bank_account
      @bank_account = BankAccount.find params[:id]
    end

    def bank_account_params
      params.require(:bank_account).permit(:name)
    end

    def bank_account_delete_params
      params.require(:bank_account_delete_form).permit(:replace_id)
    end
end
