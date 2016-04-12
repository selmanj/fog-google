require "fog/core/collection"
require "fog/google/models/pubsub/topic"

module Fog
  module Google
    class Pubsub
      class Topics < Fog::Collection
        model Fog::Google::Pubsub::Topic

        def all
          data = service.list_topics.body["topics"] || []
          load(data)
        end

        def get(topic_name)
          if topic = service.get_topic(topic_name).body
            new(topic)
          end
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
