module Fog
  module Google
    class Pubsub < Fog::Service
      autoload :Mock, File.expand_path("../pubsub/mock", __FILE__)
      autoload :Real, File.expand_path("../pubsub/real", __FILE__)

      requires :google_project
      recognizes :google_client_email, :google_key_location, :google_key_string, :google_client,
                 :app_name, :app_version, :google_json_key_location, :google_json_key_string

      GOOGLE_PUBSUB_API_VERSION    = "v1"
      GOOGLE_PUBSUB_BASE_URL       = "https://www.googleapis.com/pubsub"
      GOOGLE_PUBSUB_API_SCOPE_URLS = %w(https://www.googleapis.com/auth/pubsub)

      ##
      # MODELS
      model_path "fog/google/models/pubsub"

      model :topic
      collection :topics

      model :subscription
      collection :subscriptions

      model :received_message

      ##
      # REQUESTS
      request_path "fog/google/requests/pubsub"

      request :list_topics
      request :get_topic
      request :create_topic
      request :delete_topic
      request :publish_topic

      request :list_subscriptions
      request :get_subscription
      request :create_subscription
      request :pull_subscription
      request :acknowledge_subscription
    end
  end
end
