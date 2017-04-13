SETTINGS = YAML.load(File.read("#{Rails.root}/config/settings.yml"))[Rails.env]
SETTINGS.deep_symbolize_keys!
