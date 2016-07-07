
# NOTE, this file is not loaded as of inspec version 0.26
# https://github.com/chef/kitchen-inspec/issues/93

def docker_env
  return True if ENV['DOCKER']
  ::File.exist?('/.dockerenv')
end

