module Fog
  module Google
    class Pubsub
      class Real
        def acknowledge_subscription(subscription, ack_ids)
          api_method = @pubsub.projects.subscriptions.acknowledge

          parameters = {
            "subscription" => (subscription.is_a?(Subscription) ? subscription.name : subscription.to_s),
          }

          body = {
            "ackIds" => ack_ids.map do |ack_id|
              return ack_id.ack_id if ack_id.is_a?(ReceivedMessage)
              ack_id.to_s
            end
          }

          response = request(api_method, parameters, body)
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
