# frozen_string_literal: true
class Content < ActiveRecord::Base
  include Importable

  validates :url, presence: true
end
