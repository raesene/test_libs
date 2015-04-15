#!/usr/bin/env ruby
require 'rack'
require 'logger'
require 'date'
require 'thin'
builder = Rack::Builder.new do
  @@logger = Logger.new('alien.log')
  @@ets = Array.new
  map '/' do
    run Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["<h1> Rack Pen Test Helper</h1>","<h2>Part of a project on lib security, see https://github.com/raesene/test_libs for more info </h2>"]]}
  end
 
  map '/et_no_way_you_got_here_randomly' do
    app = proc do |env|
      req = Rack::Request.new(env) 
      info = req.ip.to_s + ", " + DateTime.now.to_s + ',' + req.user_agent
      @@logger.info(info)
      @@ets << info
      [200, {"Content-Type" => "text/html"}, ["you got a response"]]
    end
    run app
  end
 
  map '/alien_stats' do
    app = proc do |env|
      out = Array.new
      if @@ets.length > 0
        out << "<H1>Got #{@@ets.length.to_s} callers so far</H1>"
        @@ets.each do |et|
          out << et + "<br />"
        end
      else
        out << "Nothing Grabbed so far"
      end
      [200, {"Content-Type" => "text/html"}, out]
    end
    run app
  end

end
Rack::Handler::Thin.run builder, {:Port => 80, :Host => '0.0.0.0'}