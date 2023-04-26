class Client::ChaptersController < Client::ClientController
  before_action :find_chapter, only: %i(show)
  before_action :load_chapters, only: %i(show)

  def show

  end

  def find_chapter
    @chapter = Chapter.find_by id: params[:id]
    return if @chapter

    flash[:warning] = "not found"
    redirect_to root_path
  end

  def load_chapters
    @chapters = @chapter.story.chapters.order(order: :desc).select(:id, :name, :order)
  end
end
