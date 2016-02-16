require 'bundler/setup'
require 'rake/clean'
require 'rake/testtask'
$: << File.expand_path('../lib', __FILE__)
require 'rhaml'

CLEAN << FileList['document.png', 'document.gv']

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

file 'document.gv' => 'lib/rhaml/parser/document.rb' do |t|
  transitions_for = RHaml::Parser::Document.new(nil, nil).transitions_for
  out = ['digraph finite_state_machine {', 'node [ shape = circle ];']
  transitions_for.each do |event, transitions|
    transitions.each do |from, to|
      out << "#{from} -> #{to} [ label = \"#{event}\" ];"
    end
  end
  out << "}"
  IO.write('document.gv', out.join("\n"))
end

file 'document.png' => 'document.gv' do |t|
  sh "dot -Tpng #{t.prerequisites.first} > #{t.name}"
end

task :visualize => 'document.png' do |t|
  sh "feh -F #{t.prerequisites.first}"
end

task default: [:test]
