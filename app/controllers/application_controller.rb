class ApplicationController < ActionController::API
	include ExceptionHandler
	include Knock::Authenticable
end
