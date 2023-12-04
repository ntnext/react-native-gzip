Pod::Spec.new do |s|
  s.name             = "NVHTarGzipV2"
  s.version          = "0.0.4"
  s.summary          = "A library to handle .tgz and .tar.gz files on iOS"
  s.description      = <<-DESC
                      Unpack and pack tarred and gzipped files with ease. Features:
                       * Low memory footprint
                       * NSProgress based progress reporting
                       * Asynchronous and synchronous and API's
                       DESC
  s.homepage         = "https://github.com/fallending/NVHTarGzipV2"
  s.license          = 'MIT'
  s.author           = { "Niels van Hoorn" => "nvh@nvh.io" }
  s.source           = { :git => "https://github.com/fallending/NVHTarGzipV2.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/nvh'

  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.source_files = 'Classes/*'

  s.library = 'z'

end
