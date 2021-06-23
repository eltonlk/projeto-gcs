class BankAccount < ApplicationRecord
  multi_tenant :user

  has_many :operations

  validates :name, presence: true, uniqueness: true

  default_scope -> { order(:name) }

  def destroy_and_replace! form
    if form.valid?
      operations.update_all bank_account_id: form.replace_id

      self.destroy
    else
      self.errors.add :base, :invalid
    end
  end
end
