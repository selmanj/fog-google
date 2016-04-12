module Fog
  module Google
    class PubSub
      class Mock
        include Fog::Google::Shared

        def initialize(options)
          shared_initialize(options[:google_project], GOOGLE_PUBSUB_API_VERSION, GOOGLE_PUBSUB_BASE_URL)
        end
      end
    end
  end
end
