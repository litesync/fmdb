Pod::Spec.new do |s|
  s.name = 'LiteSyncFMDB'
  s.version = '1.0.0'
  s.summary = 'A Cocoa / Objective-C wrapper around LiteSync & SQLite'
  s.homepage = 'https://github.com/litesync/fmdb'
  s.license = 'MIT'
  s.author = { 'August Mueller' => 'gus@flyingmeat.com' }
  s.source = { :git => 'https://github.com/litesync/fmdb.git', :tag => "#{s.version}" }
  s.requires_arc = true
  s.ios.deployment_target = '9.0'
  #s.osx.deployment_target = '10.11'
  #s.watchos.deployment_target = '2.0'
  s.default_subspec = 'litesync'

  # build with the LiteSync static libraries
  s.subspec 'litesync' do |ss|
    ss.source_files = 'src/fmdb/FM*.{h,m}'
    ss.exclude_files = 'src/fmdb.m'
    ss.header_dir = 'fmdb'

    ss.ios.libraries = 'litesync', 'binn', 'uv'

    ss.ios.xcconfig = {
      'LIBRARY_SEARCH_PATHS' => "$(inherited) $(PROJECT_DIR)/litesync/lib/ $(PWD)/litesync/lib/",
      'HEADER_SEARCH_PATHS' => "$(inherited) $(SRCROOT)/litesync/include/"
    }

    ss.osx.xcconfig = {
      'LIBRARY_SEARCH_PATHS' => "$(inherited) /usr/local/lib",
      'HEADER_SEARCH_PATHS' => "$(inherited) /usr/local/include/"
    }

    ss.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
    ss.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
  end

end
