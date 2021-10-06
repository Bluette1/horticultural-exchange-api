class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  rescue_from CanCan::AccessDenied do |exception|
    render json: {message: exception.message}, status: 401
  end

  def render_jsonapi_response(resource)
    if resource.errors.empty?
      render json: resource
    else
      render json: resource.errors, status: 400
    end
  end
end
