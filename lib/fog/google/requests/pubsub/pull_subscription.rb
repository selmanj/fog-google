module Fog
  module Google
    class Pubsub
      class Real
        def pull_subscription(subscription, options = {})
          api_method = @pubsub.projects.subscriptions.pull

          parameters = {
            "subscription" => (subscription.is_a?(Subscription) ? subscription.name : subscription.to_s),
          }

          body = {
            "returnImmediately" => options.fetch(:return_immediately, true),
            "maxMessages" => options.fetch(:max_messages, 10)
          }

          response = request(api_method, parameters, body)
        end
      end

      class Mock
        def pull_subscription(subscription_name, ack_deadline_seconds = nil)
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
