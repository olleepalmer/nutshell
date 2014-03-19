require 'redcarpet'

module ApplicationHelper

  def title(value)
    unless value.nil?
      @title = "#{value}"
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      autolink: true, space_after_headers: true, fenced_code_blocks: false)
    markdown.render(text).html_safe
  end

end
