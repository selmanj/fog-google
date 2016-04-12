module Fog
  module Google
    class Pubsub
      class Real
        def get_subscription(subscription_name)
          api_method = @pubsub.projects.subscriptions.get
          parameters = {
            "subscription" => subscription_name,
          }

          request(api_method, parameters)
        end
      end

      class Mock
        def get_subscription(subscription_name)
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
