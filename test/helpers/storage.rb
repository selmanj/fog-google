require 'securerandom'

module Storage
  def self.create_test_bucket(google, prefix="fog-test")
    bucket_name = "#{prefix}-" + SecureRandom.uuid
    lifecycle_config = {
      "rule" => [
        {
          "action"    => { "type" => "Delete" },
          "condition" => { "age"  => 1 }
        }
      ]
    }
    google.put_bucket(bucket_name, {"lifecycle" => lifecycle_config})
    bucket_name
  end
end
