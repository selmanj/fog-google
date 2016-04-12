require "fog/core/model"

module Fog
  module Google
    class PubSub
      class Topic < Fog::Model
        identity :name

        def create
          requires :identity

          service.create_topic(name)
          self
        end

        def destroy
          requires :identity

          service.delete_topic(name)
        end

        def save
          create
        end
      end
    end
  end
end
