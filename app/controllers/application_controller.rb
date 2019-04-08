class ApplicationController < ActionController::Base
  include JSONAPI::ActsAsResourceController

	# Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session
end