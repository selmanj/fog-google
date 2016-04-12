module Fog
  module Google
    class Pubsub
      class Real
        def create_subscription(subscription_name, topic, push_config = {}, ack_deadline_seconds = nil)
          api_method = @pubsub.projects.subscriptions.create

          parameters = {}
          parameters['name'] = subscription_name if !subscription_name.nil?

          body = {
            "topic" => (topic.is_a?(Topic) ? topic.name : topic.to_s),
          }

          if !push_config.nil? && push_config.key?('push_endpoint')
            body['pushConfig'] = push_config['push_endpoint'].clone
            body['pushConfig']['attributes'] = push_config['attributes'] if push_config.key?('attributes')
          end

          body['ackDeadlineSeconds'] = ack_deadline_seconds if !ack_deadline_seconds.nil?

          request(api_method, parameters, body)
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
