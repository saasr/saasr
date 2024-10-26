class Saasr::BaseMailer < Saasr.config.base_mailer_class.constantize
  include Saasr::BaseMailerMixin

  ActiveSupport.run_load_hooks(:saasr_mailer, self)
end
