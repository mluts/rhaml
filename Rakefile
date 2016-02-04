require 'rake/clean'
require 'rake/testtask'

RAGEL = 'ragel -R'
CLEAN << FileList['lib/rparser.rb']

file 'lib/rparser.rb' => %w(lib/rparser.rl lib/rparser_common.rl) do |t|
  sh "#{RAGEL} -o #{t.name} #{t.prerequisites.first}"
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

task default: %w(lib/rparser.rb test)
