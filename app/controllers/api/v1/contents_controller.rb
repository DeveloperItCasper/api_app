# frozen_string_literal: true
class Api::V1::ContentsController < Api::V1::ApiController
  def index
    @contents = Content.all
  end

  def create
    @content = Content.new(content_params)
    if @content.import
      render json: @content, status: 200
    else
      render json: @content.errors, status: :error
    end
  end

  private

  def content_params
    params.require(:content).permit(:url)
  end
end
