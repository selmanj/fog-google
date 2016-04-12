require "fog/core/collection"
require "fog/google/models/pubsub/subscription"

module Fog
  module Google
    class Pubsub
      class Subscriptions < Fog::Collection
        model Fog::Google::Pubsub::Subscription

        def all
          data = service.list_subscriptions.body["subscriptions"] || []
          load(data)
        end

        def get(subscription_name)
          if subscription = service.get_subscription(subscription_name).body
            new(subscription)
          end
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
