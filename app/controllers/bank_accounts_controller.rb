class BankAccountsController < TenantController
  before_action :set_bank_account, only: %i[ show edit update destroy ]

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

  def destroy
    @bank_account.destroy

    redirect_to bank_accounts_url, notice: "Bank account was successfully destroyed."
  end

  private
    def set_bank_account
      @bank_account = BankAccount.find params[:id]
    end

    def bank_account_params
      params.require(:bank_account).permit(:name)
    end
end
