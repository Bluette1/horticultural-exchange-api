class DirectUploadController < ApplicationController
  response = generate_direct_upload(blob_params)
  render json: response
end

private
def blob_params
  params.require(:file).permit(:filename, :byte_size, :checksum, :content_type, metadata: {})
end

def generate_direct_upload(blob_args)
  blob = create_blob(blob_args)
  response = signed_url(blob)
  response[:blob_signed_id] = blob.signed_id
  response
end
