class User < ApplicationRecord
    EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

    validates :email, presence: true, uniqueness: true, format: EMAIL_REGEXP
    validates :full_name, presence: true
    validates :location, presence: true
    validates :password, presence: true
    validates :password, confirmation: true
    validates :bio, length: { minimum: 30 }, allow_blank: false

    has_secure_password

end