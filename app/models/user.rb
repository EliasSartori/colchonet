class User < ApplicationRecord
    EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

    validates :email,        presence: true, uniqueness: true, format: EMAIL_REGEXP
    validates :full_name,    presence: true
    validates :location,     presence: true
    validates :bio,          length: { minimum: 30 }, allow_blank: false

    has_secure_password

    before_create do |user|
        user.confirmation_token	= SecureRandom.urlsafe_base64
    end

    def confirm!
        return if confirmed?
        self.confirmed_at = Time.current
        self.confirmation_token = ''
        save!
    end

    def confirmed?
        confirmed_at.present?
    end
end