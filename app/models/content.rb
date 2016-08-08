# frozen_string_literal: true
# == Schema Information
#
# Table name: contents
#
#  id         :integer          not null, primary key
#  url        :string           not null
#  headers    :string           default([]), is an Array
#  links      :string           default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Content < ActiveRecord::Base
  include Importable

  validates :url, presence: true
end
