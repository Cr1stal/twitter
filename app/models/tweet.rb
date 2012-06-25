class Tweet < ActiveRecord::Base
  belongs_to :user

  def <=>(other_tweet)
    self.created_at <=> other_tweet.created_at
  end
end
