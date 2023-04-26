module Client::ChaptersHelper
  def name_chapters chapter
    "Chương #{chapter.order}: #{chapter.name}"
  end
end
