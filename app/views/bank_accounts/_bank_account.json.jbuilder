json.extract! bank_account, :id, :user_id, :name, :created_at, :updated_at
json.url bank_account_url(bank_account, format: :json)
