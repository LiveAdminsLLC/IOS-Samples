#
#  Be sure to run `pod spec lint WGVisitorSDK.podspec'
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name         = "WGVisitorSDK"
  s.version      = "1.0.3"
  s.summary      = "Liveadmins VisitorPanel library for iOS"
  s.homepage     = "https://liveadmins.com"
  s.author       = { "LPMObile" => "zaigham.maqsood@liveadmins.com" }



  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  # s.platform     = :ios

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source       = { :git => "https://github.com/LiveAdminsLLC/IOSFrameworks"}


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    s.resource = "WGSDK/*/*.bundle"
    s.ios.vendored_frameworks = 'WGSDK/*/*.framework'

# ――― Project Dependencies ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.dependency 'Reachability'

s.dependency 'XMPPFramework'

s.dependency 'TPKeyboardAvoiding'

s.dependency 'MCLocalization'



s.license      = { :type => 'Apache License, Version 2.0', :text => <<-LICENSE
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
LICENSE
}

end
