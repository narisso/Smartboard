if Rails.env.development? || Rails.env.test?
  GITHUB_CLIENT_ID = "a17ee23270be3a63d79b" 
  GITHUB_CLIENT_SECRET = "cb8445265ba79e06d97ec488b459c0a2a514c6b4"
  URL_HOOK = "http://devel.smartboarddev.ultrahook.com"
else
  GITHUB_CLIENT_ID = "b0951ee7e6d6b9c50aa4" 
  GITHUB_CLIENT_SECRET = "c8ea2de5c74ca82fb89347bbf1a13d8cd052f24c"
  URL_HOOK = "http://iic2154-2.herokuapp.com/projects/:id/hook"
end