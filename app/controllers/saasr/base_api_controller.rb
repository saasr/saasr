class Saasr::BaseAPIController < Saasr.config.base_api_controller_class.constantize
  include Saasr::BaseAPIControllerMixin

  ActiveSupport.run_load_hooks(:saasr_api_controller, self)
end
