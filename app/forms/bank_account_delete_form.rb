class BankAccountDeleteForm
  include ActiveModel::Model

  attr_accessor :replace_id

  validates :replace_id, presence: true
end
