require './test/test_helper'
require 'test/unit'
require 'rack/test'
require_relative './inatra'
require_relative './my_app'

class RackTest < Test::Unit::TestCase
  def test_it_says_hello_world
      browser = Rack::Test::Session.new(Rack::MockSession.new(Inatra))
      browser.get '/hello'
      assert browser.last_response.ok?
      assert_equal 'Hello World', browser.last_response.body
  end
  
  def test_it_says_hey
    browser = Rack::Test::Session.new(Rack::MockSession.new(Inatra))
    browser.get '/hey'
    assert browser.last_response.ok?
    assert_equal 'hey!', browser.last_response.body
  end
  
  def test_it_says_goodbye
    browser = Rack::Test::Session.new(Rack::MockSession.new(Inatra))
    browser.post '/goodbye'
    assert browser.last_response.ok?
    assert_equal 'goodbye!', browser.last_response.body
  end
  
  def test_it_eror404
    browser = Rack::Test::Session.new(Rack::MockSession.new(Inatra))
    browser.get '/missing_method'
    assert browser.last_response.not_found?
    assert_equal 'Not Found', browser.last_response.body
  end

end
