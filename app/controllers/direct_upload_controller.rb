class DirectUploadController < ApplicationController
  # before_action :authenticate_user!

  def create
    presigned_url = request_for_presigned_url
    data = { url: presigned_url.url, url_fields: presigned_url.fields }

    render json: data, status: :ok
  end

  private

  def request_for_presigned_url
    aws_credentials = Aws::Credentials.new(
      ENV.fetch('AWS_ACCESS_KEY_ID', nil),
      ENV.fetch('AWS_SECRET_ACCESS_KEY', nil)
    )

    s3_bucket = Aws::S3::Resource.new(
      region: 'us-east-1',
      credentials: aws_credentials
    ).bucket(ENV.fetch('S3_BUCKET', nil))

    s3_bucket.presigned_post(
      key: "#{Rails.env}/#{SecureRandom.uuid}/${filename}",
      success_action_status: '201',
      signature_expiration: (Time.now.utc + 15.minutes)
    )
  end

  def blob_params
    params.require(:file).permit(:filename, :byte_size, :checksum, :content_type, metadata: {})
  end
end
