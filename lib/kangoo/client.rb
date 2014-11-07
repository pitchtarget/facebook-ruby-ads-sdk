require 'koala'

module Kangoo
  class Client
    attr_reader :koala

    def initialize(auth_token, app_secret = nil)
      @koala = Koala::Facebook::API.new(auth_token, app_secret)
    end

    def get_object(*args)
      self.koala.get_object *args
    end

    def get_connections(*args)
      self.koala.get_connections *args
    end
  end
end