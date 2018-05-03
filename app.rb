require './lib/piece_matcher'
require 'pry'

print 'Enter IP address:'
begin
  ip = gets
  error_message = 'No input specified. Please specify ip'
  raise StandardError, error_message if ip.nil? || ip.empty?

  print PieceMatcher.new(ip.chomp).queen_matcher
  print '\n'
rescue StandardError => e
  puts e
end