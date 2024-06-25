module ApplicationHelper
  def active_locale?(locale_string)
    locale_string.to_sym == I18n.locale
  end

  def language_span(locale_string)
    content_tag :span, t("shared.languages.#{locale_string}"), lang: locale_string, "xml:lang": locale_string
  end
end
