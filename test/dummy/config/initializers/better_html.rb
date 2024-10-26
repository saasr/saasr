file_path = Saasr::Engine.root.join('config/better-html.yml')
BetterHtml.config = BetterHtml::Config.new(YAML.load_file(file_path, permitted_classes: [Regexp]))
BetterHtml.configure do |config|
  config.template_exclusion_filter = lambda { |template|
    !template.start_with?(Rails.root.to_s) || !template.start_with?(Saasr::Engine.root.to_s)
  }
end
