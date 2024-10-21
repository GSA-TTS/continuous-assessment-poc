class ApplicationController < ActionController::Base
  include Pundit::Authorization
  after_action :verify_pundit_authorization, unless: :devise_controller?
  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def verify_pundit_authorization
    if action_name == "index"
      verify_policy_scoped
    else
      verify_authorized
    end
  end

  def devise_controller?
    self.class.ancestors.include? DeviseController
  end
end
