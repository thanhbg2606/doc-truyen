class Client::StoriesController < Client::ClientController
  before_action :find_story, only: %i(show)
  before_action :load_chapters, only: %i(show)

  def show

  end

  def find_story
    @story = Story.find_by id: params[:id]

    return if @story

    flash[:warning] = "not found"
    redirect_to root_path
  end

  def load_chapters
    @chapters = @story.chapters.order(order: :desc).select(:id, :name, :order)
  end
end
