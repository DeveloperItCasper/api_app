# frozen_string_literal: true
require 'open-uri'
require 'nokogiri'

module Importable
  extend ActiveSupport::Concern

  def import
    return false unless url.present?
    begin
      page = Nokogiri::HTML(open(url))
      if page.present?
        page.css('h1, h2, h3').each { |h| headers << h.text }
        page.css('a').each { |a| links << a['href'] }
        save
      else
        errors[:base] << 'Page does not exist'
        return false
      end
    rescue => e
      errors[:base] << e.to_s
      return false
    end
  end
end
