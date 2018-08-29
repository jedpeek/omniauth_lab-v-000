Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['440662843123846'], ENV['7238ba69f9de425c037f7a60d660277a']
end
