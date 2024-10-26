class Saasr::BaseController < Saasr.config.base_controller_class.constantize
  include Saasr::BaseControllerMixin

  ActiveSupport.run_load_hooks(:saasr_controller, self)
end
