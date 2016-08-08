# frozen_string_literal: true
json.cache!(Digest::MD5.hexdigest(@contents.last.try(:id).to_s), expires_in: 20.minutes) do
  json.contents @contents
end
