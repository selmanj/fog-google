require "fog/core/model"

module Fog
  module Google
    class Pubsub
      class ReceivedMessage < Fog::Model
        identity :ack_id, :aliases => "ackId"
        
        attribute :message

        def initialize(new_attributes = {})
          # Here we secretly store the subscription name we were received on
          # in order to support #acknowledge
          attributes = new_attributes.clone
          @subscription_name = attributes.delete(:subscription_name)
          super(attributes)
        end

        def acknowledge
          requires :ack_id

          service.acknowledge_subscription(@subscription_name, [ack_id])
          return
        end

        def reload
          # Message is immutable - do nothing
        end

      end
    end
  end
end
