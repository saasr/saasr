pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin 'local-time' # @3.0.2
pin_all_from Saasr::Engine.root.join('app/javascript/lib/saasr'), under: 'saasr', to: 'lib/saasr'
pin_all_from Saasr::Engine.root.join('app/javascript/controllers'), under: 'controllers'
pin_all_from Saasr::Engine.root.join('app/javascript/helpers'), under: 'helpers'
