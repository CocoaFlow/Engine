include FileUtils::Verbose

namespace :test do
  desc "Run the Engine Tests for iOS"
  task :ios do
    run_tests('Engine-iOS', 'iphonesimulator')
    tests_failed('iOS') unless $?.success?
  end

  desc "Run the Engine Tests for Mac"
  task :mac do
    run_tests('Engine-Mac', 'macosx')
    tests_failed('Mac') unless $?.success?
  end
end

desc "Run the Engine Tests for Mac and iOS"
task :test do
  Rake::Task['test:ios'].invoke
  Rake::Task['test:mac'].invoke if not ENV['TRAVIS'] or is_yosemite_or_above
end

task :default => 'test'


private

def run_tests(scheme, sdk)
  sh("xcodebuild -workspace Engine.xcworkspace -scheme '#{scheme}' clean test; exit ${PIPESTATUS[0]}") rescue nil
end

def is_yosemite_or_above
  os_version = `sw_vers -productVersion`.chomp
  Gem::Version.new(os_version) >= Gem::Version.new('10.10')
end

def tests_failed(platform)
  puts red("#{platform} unit tests failed")
  exit $?.exitstatus
end

def red(string)
 "\033[0;31m! #{string}\033[0;38m"
end
