module Inatra
  class << self
    def routes(&block)
      @route = {}
      instance_eval(&block)
    end

    def call(env)
      method_name = env['REQUEST_METHOD'].to_s.downcase
      path = env['PATH_INFO'].to_s.downcase
      @route[method_name][path] ? @route[method_name][path].call : [404, {}, 'Not Found']
    end

    def method_missing(method_name, path, &block)
      method_name = method_name.to_s
      @route[method_name] ||= {}
      @route[method_name][path] = block 
    end
  end
end

