namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_tweets
    make_connections
  end
end

def make_users
  99.times do |n|
    nickname = "name#{n+1}"
    email = "exampl#{n+1}@rails.ru"
    User.create!(nickname: nickname,
                 email: email)
  end
end

def make_tweets
  users = User.all(limit: 6)
  50.times do |n|
    content = "hello#{n}"
    users.each { |user| user.tweets.create!(text: content) }
  end
end

def make_connections
  users = User.all
  user = User.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user) }
end