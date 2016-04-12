module Fog
  module Google
    class PubSub
      class Real
        def delete_topic(topic_name)
          api_method = @pubsub.projects.topics.delete
          parameters = {
            "topic" => topic_name
          }

          request(api_method, parameters)
        end
      end

      class Mock
        def delete_topic(topic_name)
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
