# Uncomment this line to define a global platform for your project
# platform :ios, '7.0'

target 'CircleCITest' do
    pod 'AFNetworking', '~> 2.5'
end

target 'Unit Specs', :exclusive => true do
	pod 'Specta'
	pod 'Expecta'   # expecta matchers
    pod 'OCMock'   # OCMock
    pod 'OHHTTPStubs'
end

target 'KIF Specs', :exclusive => true do
    pod 'Specta'
    pod 'KIF', '~> 3.0', :configurations => ['Debug']
    pod 'OHHTTPStubs'
end