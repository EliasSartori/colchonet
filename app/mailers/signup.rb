class SignupMailer < ApplicationMailer
    default from: 'no-reply@colcho.net'

    def confirm_email(user)
        @user = user
        @confirmation_link = root_url
        mail({
            to: user.email,
            bcc: ['sign ups <signup@colcho.net>'],
            subject: I18n.t('signup.confirm_email.subject')
        })
    end
end