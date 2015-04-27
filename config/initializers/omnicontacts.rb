require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :facebook, "1420135261622700", "f5317b20bd0c3062684663f8ee9efb60", {:callback_path => "/invites/facebook/contact_callback"}
end