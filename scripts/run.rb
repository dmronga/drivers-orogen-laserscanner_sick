#!/usr/bin/env ruby

require 'orocos'
require 'vizkit'

Orocos.initialize

ENV['PKG_CONFIG_PATH'] = "#{File.expand_path("..", File.dirname(__FILE__))}/build:#{ENV['PKG_CONFIG_PATH']}"
Orocos.run 'laserscanner_sick_test' do 
    scanner = Orocos::TaskContext.get 'laserscanner_sick'
    scanner.hostname = "192.168.103.203"
    scanner.port = 2111
    Orocos.log_all_ports
    scanner.configure
    scanner.start

    Vizkit.display scanner.scan
    Vizkit.exec
end



