class Books::PaapiSearchesController < ApplicationController
  before_action :call_client, only: :index

  def index
    # ↓本当は引数にkeyword_paramsだけで処理したかったがうまくいかず…
    si = @client.search_items(keywords: keyword_params[:keywords], SearchIndex: "Books")
    @items = si.items
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def call_client
    require 'paapi'
    @client = Paapi::Client.new(access_key: Rails.application.credentials[:pa_api][:access_key_id],
                                secret_key: Rails.application.credentials[:pa_api][:secret_key],
                                market: :jp,
                                partner_tag: Rails.application.credentials[:pa_api][:associate_tag])
  end

  def keyword_params
    params.permit(:keywords)
  end

end