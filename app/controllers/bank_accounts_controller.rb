class BankAccountsController < TenantController
  before_action :set_bank_account, only: %i[ edit update delete destroy ]

  def index
    @bank_accounts = BankAccount.all
  end

  def new
    @bank_account = BankAccount.new
  end

  def edit
  end

  def create
    @bank_account = BankAccount.new bank_account_params

    if @bank_account.save
      redirect_to bank_accounts_url, notice: "Bank account was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @bank_account.update bank_account_params
      redirect_to bank_accounts_url, notice: "Bank account was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
    @bank_account_delete_form = BankAccountDeleteForm.new
  end

  def destroy
    @bank_account_delete_form = BankAccountDeleteForm.new bank_account_delete_params

    if @bank_account.destroy_and_replace! @bank_account_delete_form
      redirect_to bank_accounts_url, notice: "Bank account was successfully destroyed."
    else
      render :delete, status: :unprocessable_entity
    end
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
