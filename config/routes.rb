Rails.application.routes.draw do
  get '-/saasr/test', to: 'saasr/test#index' if Rails.env.development?
end if Saasr.config.draw_routes
