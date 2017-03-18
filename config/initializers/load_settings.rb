p "Hi there! Current root is #{Rails.root}"
CONFIG = YAML.load(File.read("#{Rails.root}/config/settings.yml"))[Rails.env]
CONFIG.symbolize_keys!
