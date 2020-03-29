class ApplicationController < ActionController::Base
  include Authentication

  before_action :set_locale

  def default_url_options(options={})
    options.merge(locale: I18n.locale)
  end

  private

  def set_locale
    I18n.locale = params.fetch(:locale, I18n.default_locale)
  end
end
