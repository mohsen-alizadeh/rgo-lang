require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rgo"

RSpec::Core::RakeTask.new(:spec)

task :generate_parser do
  `racc parse.y -o lib/rgo/parser.rb`
end

task :default => :spec

task :dev => :generate_parser do
  statements = Rgo::Parser.new.parse(File.read("./samples/1_hello_world.rgo"))

  require 'pp'

  pp statements

  compile = Rgo::Compile.new(statements)
  out = compile.compile

  puts "out : "
  puts out


  puts compile.functions
  puts compile.function_to_module_map
end
