module BankAccountsHelper

  def bank_accounts_collection except_ids: nil
    bank_accounts = BankAccount.all

    bank_accounts = bank_accounts.where.not(id: except_ids) if except_ids.present?

    bank_accounts
  end

end
