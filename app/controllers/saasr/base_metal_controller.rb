class Saasr::BaseMetalController < Saasr.config.base_metal_controller_class.constantize
  include Saasr::BaseMetalControllerMixin

  ActiveSupport.run_load_hooks(:saasr_metal_controller, self)
end
