class Story < ApplicationRecord
  enum status: { in_process: "in_process", complete: "complete", drop: "drop" }, _prefix: true
  enum visibility: { hidden: "hidden", visible: "visible" }, _prefix: true

  has_many :chapters
  belongs_to :author
  belongs_to :category

  scope :latest, ->{order(created_at: :desc).limit(Settings.story.items.latest)}
end
