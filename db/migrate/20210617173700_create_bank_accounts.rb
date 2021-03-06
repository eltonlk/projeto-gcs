class CreateBankAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_accounts do |t|
      t.references :user, null: false, foreign_key: true

      t.string :name, null: false

      t.timestamps
    end
  end
end
