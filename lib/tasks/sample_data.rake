namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_admin
    #make_user
  end
end

def make_admin
	admin = User.create!(name: "Nicolas Mauchle",
                 email: "nmauchle@gmail.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
end

def make_user
	99.times do |n|
		name = "user-#{n+1}"
		email = "user-#{n+1}@gmail.com"
		password = "foobar"

		u = User.create(name: name,
										email: email,
										password: password,
										password_confirmation: password)
	end
end