class Saasr::Configuration
  include ActiveModel::Model
  include ActiveModel::Serialization
  include Saasr::Configuration::Attributes

  required :base_controller_class, :string, default: '::ApplicationController'
  required :base_api_controller_class, :string, default: '::ActionController::API'
  required :base_metal_controller_class, :string, default: '::ActionController::Metal'
  required :base_mailer_class, :string, default: '::ApplicationMailer'
  required :base_job_class, :string, default: '::ApplicationJob'
  required :base_record_class, presence: true, default: '::ApplicationRecord'

  required :draw_routes, :boolean, default: true

  ActiveSupport.run_load_hooks(:saasr_configuration, self)
end
