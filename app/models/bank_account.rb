class BankAccount < ApplicationRecord
  multi_tenant :user

  validates :name, presence: true, uniqueness: true

  default_scope -> { order(:name) }

  def destroy_and_replace! form
    if form.valid?

      self.destroy
    else
      self.errors.add :base, :invalid
    end
  end
end
