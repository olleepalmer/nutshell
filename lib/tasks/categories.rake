namespace :categories do

  desc "Add a new category"
  task :add, [:category] => :environment do |t, args|

    raise "usage: rake categories:add['category name']" unless args.category

    if Category.where(title: args.category).exists?
      puts "Category already exists."
    else
      Category.create!(title: args.category)
    end

  end

  desc "Remove a category"
  task :remove, [:category] => :environment do |t, args|
    raise "usage: rake categories:remove['category name']" unless args.category
    Category.destroy_all(title: args.category)
  end

end
