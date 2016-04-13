require "base64"
require "fog/core/model"
require "fog/google/models/pubsub/received_message"

module Fog
  module Google
    class Pubsub
      class Subscription < Fog::Model
        identity :name
        attribute :topic
        attribute :push_config, :aliases => "pushConfig"
        attribute :ack_deadline_seconds, :aliases => "ackDeadlineSeconds"

        def pull(options = {})
          requires :name

          data = service.pull_subscription(name, options).body

          return [] if !data.key?('receivedMessages')
          # Turn into a list of ReceivedMessage, but ensure we perform a base64 decode first
          data['receivedMessages'].map do |recv_message|
            attrs = { 
              :service => service,
              :subscription_name => name,
            }.merge(recv_message)
            
            attrs['message']['data'] = Base64.decode64(recv_message['message']['data']) if recv_message['message'].key?('data')
            ReceivedMessage.new(attrs)
          end
        end

        def save
          requires :name, :topic

          data = service.create_subscription(name, topic, push_config, ack_deadline_seconds).body
          merge_attributes(data)
        end
      end
    end
  end
end
