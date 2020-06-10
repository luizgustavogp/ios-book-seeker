platform :ios, '10.0'

target 'BookSeeker' do
  use_frameworks!
  pod 'Swinject'
  pod 'SwiftLint'
end

target 'BookSeekerInfrastructure' do
  use_frameworks!
  pod 'Alamofire', '~> 5.1'
end

target 'BookSeekerPresenter' do
  use_frameworks!
  pod 'Swinject'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Kingfisher'
end

target 'BookSeekerTests' do
  use_frameworks!
  pod 'Swinject'
  pod 'Alamofire', '~> 5.1' 
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Kingfisher'
end

# ignore all warnings from all dependencies
inhibit_all_warnings!
# ignore warnings from a specific dependency
pod 'FBSDKCoreKit', :inhibit_warnings => true
