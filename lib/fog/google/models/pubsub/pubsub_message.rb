require "fog/core/model"

module Fog
  module Google
    class Pubsub
      class PubsubMessage < Fog::Model
        identity :message_id, :aliases => "messageId"
        
        attribute :data
        attribute :attributes
        attribute :publish_time, :aliases => "publishTime"
      end
    end
  end
end
