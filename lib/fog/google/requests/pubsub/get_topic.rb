module Fog
  module Google
    class Pubsub
      class Real
        def get_topic(topic_name)
          api_method = @pubsub.projects.topics.get
          parameters = {
            "topic" => topic_name,
          }

          request(api_method, parameters)
        end
      end

      class Mock
        def get_topic(topic_name)
          Fog::Mock.not_implemented
        end
      end
    end
  end
end

