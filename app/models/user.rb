# email:string
# password_digest:string

# password:string VIRTUAL
# password_confirmation:string VIRTUAL
class User < ApplicationRecord
  has_many :twitter_accounts, class_name: "twitter_account", foreign_key: "reference_id"
  has_secure_password
 
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be a valid email address'}
end
