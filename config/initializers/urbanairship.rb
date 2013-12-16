if Rails.env == 'development'
  Urbanairship.application_key = 'te-JTfoxRL-LmDGY9avL_A'
  Urbanairship.application_secret = 'ZidP5bpWRxy5Om3C0JORAQ'
  Urbanairship.master_secret = 'Vw8p759xSiq4peqG-sZ-Gg'
else
  Urbanairship.application_key = 'DL1r-6wVRsK3EuAtzhCjEA'
  Urbanairship.application_secret = 'OgeUXul0Qu-P2ynN8UBgCA'
  Urbanairship.master_secret = 'ATtvetKWS5GCkMnaArSVfQ'
end

Urbanairship.logger = Rails.logger
Urbanairship.request_timeout = 5 # default