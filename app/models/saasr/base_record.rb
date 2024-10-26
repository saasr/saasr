class Saasr::BaseRecord < Saasr.config.base_record_class.constantize
  include Saasr::BaseRecordMixin

  self.abstract_class = true

  ActiveSupport.run_load_hooks(:saasr_record, self)
end
