require "fog/core/model"

module Fog
  module Google
    class Pubsub
      class Topic < Fog::Model
        identity :name

        def create
          requires :name

          service.create_topic(name)
          self
        end

        def destroy
          requires :name

          service.delete_topic(name)
        end

        def publish(messages)
          requires :name

          # Ensure our messages are base64 encoded
          encoded_messages = []

          messages.each do |message|
            encoded_message = {}
            if message.is_a?(Hash)
              encoded_message['attributes'] = message['attributes']
              if message.key?('data')
                encoded_message['data'] = Base64.strict_encode64(message['data'])
              end
            else
              encoded_message['data'] = Base64.strict_encode64(message.to_s)
            end

            encoded_messages << encoded_message
          end

          service.publish_topic(name, encoded_messages).body['messageIds']
        end

        def save
          create
        end
      end
    end
  end
end
