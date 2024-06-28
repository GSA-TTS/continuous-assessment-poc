module ApplicationHelper
  def active_locale?(locale_string)
    locale_string.to_sym == I18n.locale
  end

  def language_span(locale_string)
    content_tag :span, t("shared.languages.#{locale_string}"), lang: locale_string, "xml:lang": locale_string
  end

  def external_link(text, url = nil)
    url ||= text
    link_to text, url, class: "usa-link usa-link--external", rel: "noreferrer", target: "_blank"
  end

  def required_field_label(field_name)
    "#{field_name}<abbr title=\"required\" class=\"usa-hint usa-hint--required\">*</abbr>".html_safe
  end
end
