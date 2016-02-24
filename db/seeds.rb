50.times do |n|
  Book.create! title: "Example Book" + n.to_s,
    content: "day la content",
    author: "NgocVu",
    publish_date: "2015/1/1",
    number_of_pages: n + 50,
    image: "/assets/anh1.jpg",
    category_id: 1
end
