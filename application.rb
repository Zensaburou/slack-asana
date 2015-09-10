require 'rack'

class Application
  def load
    ApplicationLoader.new.load_dirs
    EnvVarLoader.new.load_vars
  end
end

module AppRoot
  def application_root
    File.expand_path File.dirname(__FILE__)
  end
end

class ApplicationLoader
  include AppRoot

  def load_dirs
    dir_paths.each { |path| require_dir(path) }
  end

  private

  def require_dir(path)
    Dir[path << '/*.rb'].each { |file| require file }
  end

  def dir_paths
    dirs.map { |dir| application_root + "/#{dir}" }
  end

  def dirs
    %w(app lib)
  end
end

class EnvVarLoader
  include AppRoot

  def load_vars
    File.readlines(env_var_file).each { |line| load_new_var(line) }
  end

  private

  def env_var_file
    application_root << '/lib/env_vars.txt'
  end

  def load_new_var(key_value_string)
    key, value = parse_env_var(key_value_string)
    add_env_var(key, value) unless ENV[key]
  end

  def parse_env_var(key_value_string)
    key_value_string.chomp.split('=')
  end

  def add_env_var(key, value)
    ENV[key] = value
  end
end

Application.new.load
