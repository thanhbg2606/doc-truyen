class Client::HomeController < Client::ClientController
  def index
    @latest_stories = Story.latest.select(:id, :name)
  end
end
