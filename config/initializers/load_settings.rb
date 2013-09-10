SETTINGS = YAML.load(File.read("#{Rails.root}/config/settings.yml"))[Rails.env]
SETTINGS.symbolize_keys!
