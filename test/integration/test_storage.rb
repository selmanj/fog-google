require "helpers/integration_test_helper"
require "helpers/storage"

class TestStorage < FogIntegrationTest

  def test_bucket_create
    google = Fog::Storage::Google.new
    bucket_name = Storage::create_test_bucket(google, "foobar")
    puts "Created bucket " + bucket_name
  end
end
