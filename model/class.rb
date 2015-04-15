# users table
class User < ActiveRecord::Base
  has_many :user_subscriptions
  has_many :channel_feeds, through: :user_subscriptions
end

# feeds table
class UserSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :channel_feed
end

# channel_feeds table
class ChannelFeed < ActiveRecord::Base
  has_many :feeds #plural
  has_one :category
end

# feeds table
class Feed < ActiveRecord::Base
  serialize :content
  belongs_to :channel_feed
end

class Category < ActiveRecord::Base
  belongs_to :channel_feed
end
