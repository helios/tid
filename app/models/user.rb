class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
    include Sunspot::Mongoid2
   
  field :email, type: String
  field :password, type: String
  field :password_confirmation, type: String
  field :password_digest, type: String
  
  has_secure_password
  validates_presence_of :password
  validates_presence_of :email
  
    searchable do
    text :password
  end
  
end
