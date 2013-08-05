namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Nicolas Mauchle",
                 email: "nmauchle@gmail.com",
                 password: "foobar",
                 password_confirmation: "foobar")
  end
end