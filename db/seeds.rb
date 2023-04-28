# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# 20.times do
#   name = Faker::Name.name
#   description = Faker::Lorem.sentence
#   Author.create!(name: name, description: description)
# end

# 10.times do
#   name = Faker::Book.unique.genre
#   description = Faker::Lorem.sentence
#   Category.create!(name: name, description: description)
# end

# stories = []
# 50.times do |n|
#   name = Faker::Book.unique.title
#   stories << {
#     name: name,
#     slug: name.parameterize + n.to_s,
#     description: Faker::Books::Lovecraft.paragraph,
#     source: Faker::Book.publisher,
#     status: Story.statuses.keys.sample,
#     visibility: Story.visibilities.keys.sample,
#     author_id: Author.ids.sample,
#     category_id: Category.ids.sample
#   }
# end
# Story.import stories

# chapters = []
# 1000.times do |n|
#   name =  Faker::Books::TheKingkillerChronicle.book
#   chapters << {
#     name: name,
#     slug: name.parameterize + n.to_s,
#     content: Faker::Books::Lovecraft.paragraphs(number: 10).join,
#     order: rand(1..20),
#     posting_date: Time.now,
#     story_id: Story.ids.sample
#   }
# end
# Chapter.import chapters

# Story.create!(
#   name: "Linh Vũ Thiên Hạ",
#   slug: "linh-vu-thien-ha",
#   description: "Lục Thiếu Du</b>, linh hồn bị xuyên qua đến thế giới khác, nhập vào thân thể của một thiếu gia không có địa vị phải trải qua cuộc sống không khác gì nô bộc.<br>Thế giới này lấy Vũ vi cường, lấy Linh vi tôn, nghe đồn khi võ đạo đỉnh phong, linh đạo đạt đến cực hạn có thể phá toái hư không. <br>Lục Thiếu Du mang theo ký ức từ kiếp trước tái sinh, không cam lòng làm một thiếu gia chẳng khác gì củi mục.<br><br>Trong thế giới xa lạ, <br>Say - nằm trên gối mỹ nhân, <br>Tỉnh - nắm quyền thiên hạ.<br>Đây mới là cuộc sống đáng mơ ước. <br>Linh - Vũ song tu<br>Bá chủ kiêu hùng<br>Đã đến, ta sẽ lưu lại một huyền thoại......<br><br><strong><b>Hệ Thống Tu Luyện:</b></strong><br><br><b>- Vũ giả: </b>Vũ khí, Vũ đồ, Vũ sĩ, Vũ sư, Vũ phách, Vũ tướng, Vũ suất, Vũ vương, Vũ tôn, Vũ đế.<br><b>- Linh giả: </b>Linh khí, Linh đồ, Linh sĩ, Linh sư, Linh phách, Linh tướng, Linh suất, Linh vương, Linh tôn, Linh đế.<br><br>Mỗi cấp được chia làm cửu trọng (chín tầng). Ngoài ra còn có Yêu thú, Linh thú các thể loại, chia làm nhất giai, nhị giai,... mỗi giai chia làm sơ kỳ, trung kỳ, hậu kỳ.<br><br>- <b>Công pháp:</b> chia làm sáu loại, từ cao đến thấp: Thiên, Địa, Huyền, Hoàng, Tinh, Thần<br><br>Tất nhiên là vẫn tồn tại một số công pháp đặc biệt bí ẩn khác.<br><br>- <b>Ngũ hệ: </b>Vũ giả, Vũ kỹ (công pháp cho vũ giả) được chia thành năm loại Mộc, Thủy, Hỏa, Thổ, Phong",
#   source: "Sói Già",
#   status: Story.statuses.keys.sample,
#   visibility: Story.visibilities.keys.sample,
#   author_id: Author.ids.sample,
#   category_id: Category.ids.sample
# )

chapters = []
file = CSV.read("story.csv")

ActiveRecord::Base.transaction do
  file.each do |record|
    name =  record[1].blank? ? "" : record[1].split(":")[1].strip
    chapters << {
      name: name,
      slug: name.blank? ? "chapter-#{record[0].to_i}" : name.parameterize + "-chapter-#{record[0].to_i}",
      content: record[3].blank? ? "" : record[3],
      order: record[0].to_i,
      posting_date: Time.now,
      story_id: Story.last.id
    }
  end
  Chapter.import chapters
  p "Thành Công"
end
