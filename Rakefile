require 'rake/clean'
require 'rake/testtask'

RAGEL = 'ragel -R'
CLEAN << FileList['lib/rhaml/parser.rb']

file 'lib/rhaml/parser.rb' => %w(lib/rhaml/parser.rl lib/rhaml/parser_common.rl) do |t|
  sh "#{RAGEL} -o #{t.name} #{t.prerequisites.first}"
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

task compile: %w(lib/rhaml/parser.rb)

task default: [:compile, :test]
