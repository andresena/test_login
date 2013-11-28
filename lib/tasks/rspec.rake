namespace :run spec tests do
  selenium_file_list = FileList['spec/selenium/*_spec.rb']
  
  desc "Run all specs in spec directory (excluding plugin specs)"
  Spec::Rake::SpecTask.new(:spec => spec_prereq) do |t|
    t.spec_opts = ['--options', "\"#{RAILS_ROOT}/spec/spec.opts\""]
    t.spec_files = FileList['spec/**/*_spec.rb'] - selenium_file_list
  end
end
