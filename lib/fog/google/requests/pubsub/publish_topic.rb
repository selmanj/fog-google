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
          
          body = {
            "messages" => messages,
          }

          request(api_method, parameters, body)
        end
      end

      class Mock
        def publish_topic(topic, messages)
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
