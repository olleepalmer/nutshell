# create sample categories, if none already exist
if Category.count == 0

  ["News & History", "Books, Movies & TV", "Theories & Concepts"].each do |title|
    Category.create! title: title
  end

end
