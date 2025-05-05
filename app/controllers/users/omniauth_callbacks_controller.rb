module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    protect_from_forgery with: :reset_session

    def saml
      response = request.env["omniauth.auth"].extra.response_object
      if response.is_valid?
        user = User.find_or_create_by(email: response.name_id) do |u|
          u.password = SecureRandom.base64
        end
        flash.notice = "Logged in as #{response.name_id}"
        sign_in_and_redirect user
      else
        flash.error = "SAML reponse is invalid"
        redirect_to root_path
      end
    end
  end
end
