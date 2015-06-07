class ImageBucketUploader
  include Sidekiq::Worker

  def perform(image_id)
    s3 = Aws::S3::Client.new
    # actually upload to s3
  end
end