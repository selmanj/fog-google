module Fog
  module Google
    class Pubsub
      class Real
        def acknowledge_subscription(subscription, ack_ids)
          api_method = @pubsub.projects.subscriptions.acknowledge

          parameters = {
            "subscription" => subscription.to_s,
          }

          body = {
            "ackIds" => ack_ids
          }

          request(api_method, parameters, body)
        end
      end

      class Mock
        def acknowledge_subscription(subscription, ack_ids)
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
