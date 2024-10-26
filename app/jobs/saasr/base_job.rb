class Saasr::BaseJob < Saasr.config.base_job_class.constantize
  include Saasr::BaseJobMixin

  ActiveSupport.run_load_hooks(:saasr_job, self)
end
