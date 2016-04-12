module Fog
  module Google
    class Pubsub
      class Real
        def create_topic(topic_name)
          api_method = @pubsub.projects.topics.create
          parameters = {
            "name" => topic_name
          }

          request(api_method, parameters)
        end
      end

      class Mock
        def create_topic(topic_name)
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
