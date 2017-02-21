Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1842162316064762", "3fd06afa5efe622a1c492922a51b2b3c", image_size: 'large'
end
