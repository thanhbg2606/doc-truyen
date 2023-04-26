class Client::ClientController < ApplicationController
  before_action :header_client
  layout "client/layouts/application"

  private
  def header_client
    @categories = Category.all
  end
end
