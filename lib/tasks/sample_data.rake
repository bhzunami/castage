namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Nicolas Mauchle",
                 email: "nmauchle@gmail.com",
                 password: "Ki56vrz2xw",
                 password_confirmation: "Ki56vrz2xw")
  end
end