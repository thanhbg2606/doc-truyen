# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
20.times do
  name = Faker::Name.name
  description = Faker::Lorem.sentence
  Author.create!(name: name, description: description)
end

10.times do
  name = Faker::Book.unique.genre
  description = Faker::Lorem.sentence
  Category.create!(name: name, description: description)
end

stories = []
50.times do |n|
  name = Faker::Book.unique.title
  stories << {
    name: name,
    slug: name.parameterize + n.to_s,
    description: Faker::Books::Lovecraft.paragraph,
    source: Faker::Book.publisher,
    status: Story.statuses.keys.sample,
    visibility: Story.visibilities.keys.sample,
    author_id: Author.ids.sample,
    category_id: Category.ids.sample
  }
end
Story.import stories

chapters = []
1000.times do |n|
  name =  Faker::Books::TheKingkillerChronicle.book
  chapters << {
    name: name,
    slug: name.parameterize + n.to_s,
    content: Faker::Books::Lovecraft.paragraphs(number: 10).join,
    order: rand(1..20),
    posting_date: Time.now,
    story_id: Story.ids.sample
  }
end
Chapter.import chapters
