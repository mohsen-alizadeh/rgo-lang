require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rgo"

RSpec::Core::RakeTask.new(:spec)

task :generate_parser do
  `racc parse.y -o lib/rgo/parser.rb`
end

task :default => :spec

task :dev do
  `racc parse.y -o lib/rgo/parser.rb`
  statements = Rgo::Parser.new.parse(File.read("./samples/example_01_http_servers.rgo"))

  require 'pp'

  pp statements

  compile = Rgo::Compile.new(statements)
  out = compile.compile

  puts out

  puts "compile functions : #{compile.functions}"
  puts "compile functions_to_module_map : #{compile.function_to_module_map}"
end
