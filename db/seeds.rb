require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all
puts "Creating Movies"
p Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
p Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
p Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
p Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
List.destroy_all
puts "Creating Lists"
5.times do
  p new_list = List.create(name: Faker::Book.genre)
  file = URI.open('https://picsum.photos/200/300?random=2')
  new_list.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  new_list.save
 end

 movie_ids = []
 list_ids = []

 Movie.find_each do |movie|
  movie_ids << movie.id
 end

 List.find_each do |list|
  list_ids << list.id
 end



 list_ids.each do |list_id|
  2.times do
    is_saved = false
      while is_saved == false
        new_bookmark = Bookmark.new(list_id: list_id, movie_id: movie_ids.sample(1)[0], comment: Faker::Movies::Lebowski.quote)
           if new_bookmark.valid?
             new_bookmark.save
             p new_bookmark
            is_saved = true
          end
      end

  end

 end
