Pod::Spec.new do |s|
  s.name         = "SITABLE"
  s.version      = "0.0.2"
  s.summary      = "BLE Tools."
  s.description  = <<-DESC
                    The tool used to connect the central control device is convenient for fast integration
                    various projects. It is easy to maintain the main functions: connect bluetooth,
                    scan bluetooth, and send instructions to bluetooth.
                   DESC
  s.homepage     = "https://github.com/githubsj/SitaBle"
  s.license      = 'MIT'
  s.author             = { "宋军" => "songjun_0806@163.com" }
  s.source       = { :git => "https://github.com/githubsj/SitaBle.git", :tag => s.version.to_s }
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files  = 'SITABLE/*'
end
