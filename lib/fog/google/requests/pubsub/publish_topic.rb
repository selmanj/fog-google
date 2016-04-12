require "base64"

module Fog
  module Google
    class Pubsub
      class Real
        def publish_topic(topic, messages)
          api_method = @pubsub.projects.topics.publish

          parameters = {
            "topic" => topic,
          }
          
          # Data, if present, must be base64 encoded
          encoded_messages = []

          messages.each do |message|
            encoded_message = {}
            if message.is_a?(Hash)
              encoded_message[:attributes] = message[:attributes]
              if message.key?(:data)
                encoded_message[:data] = Base64.strict_encode64(message[:data])
              end
            else
              encoded_message[:data] = Base64.strict_encode64(message.to_s)
            end

            encoded_messages << encoded_message
          end

          body = {
            "messages" => encoded_messages,
          }

          request(api_method, parameters, body)
        end
      end

      class Mock
      end
    end
  end
end
