require 'bundler/setup'
$:.unshift File.expand_path('../../lib/rhaml', __FILE__)
require 'json'
require 'rhaml'
require 'pry'
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
