module PunditSpecHelper
  def enable_pundit(view, user = nil)
    without_partial_double_verification do
      allow(view).to receive(:policy) do |record|
        Pundit.policy(user, record)
      end
    end
  end
end

RSpec.configure do |config|
  config.include PunditSpecHelper, type: :view
end
