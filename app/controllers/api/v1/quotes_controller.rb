class Api::V1::QuotesController < ApplicationController
  before_action :find_quote, only: [:update]
  def index
    @Quotes = Quote.all
    render json: @Quotes
  end

  def update
    @quote.update(quote_params)
    if @quote.save
      render json: @quote, status: :accepted
    else
      render json: { errors: @quote.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def quote_params
    params.permit(:content, :author)
  end

  def find_quote
    @quote = Quote.find(params[:id])
  end
end
end
