class Api::V1::ApiController < ActionController::Base

  # ParamError is superclass of ParamMissing, ParamInvalid
  rescue_from Apipie::ParamError do |e|
    render text: e.message, status: :unprocessable_entity
  end

end
