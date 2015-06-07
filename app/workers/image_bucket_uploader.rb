class ImageBucketUploader
  include Sidekiq::Worker

  def perform(image_id)
    image = Image.find_by_id(image_id)
    s3 = Aws::S3::Resource.new
    case not nil
    when image.vehicle
      image_parent = "vehicle_#{image.vehicle.id}"
    when image.modification
      image_parent = "modification_#{image.modification.id}"
    when image.time_card
      image_parent = "time_card_#{image.time_card.id}"
    else
      raise ActiveRecord::RecordInvalid
    end
  end
end