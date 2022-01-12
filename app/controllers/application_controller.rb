class ApplicationController < ActionController::Base
 #config.active_job.queue_adapter = :sidekiq
  before_action :authenticate_user!
end
