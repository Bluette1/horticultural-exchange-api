class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def render_jsonapi_response(resource)
    if resource.errors.empty?
      render json: resource
    else
      render json: resource.errors, status: 400
    end
  end
end
