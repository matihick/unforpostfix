def put_template(source, destination)
  template = File.read(source)
  config = ERB.new(template, nil, '-')
  put config.result(binding), destination
end

def get_current_host
  capture("echo $CAPISTRANO:HOST$").strip
end

def absolute_path(path, user)
  path.gsub('$HOME', "/home/#{user}").gsub('~', "/home/#{user}")
end
