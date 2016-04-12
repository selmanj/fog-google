module Fog
  module Google
    class Pubsub
      class Real
        def list_subscriptions(project = nil)
          api_method = @pubsub.projects.subscriptions.list
          parameters = {
            "project" => (project.nil? ? "projects/#{@project}" : project),
          }

          request(api_method, parameters)
        end
      end

      class Mock
        def list_subscriptions(project = nil)
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
