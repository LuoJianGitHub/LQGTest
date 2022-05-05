#
# Be sure to run `pod lib lint LQGTest.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    # 名称
    s.name = 'LQGTest'
    # 版本
    s.version = '1.0.0'
    # 摘要
    s.summary = '测试'
    # 详细说明
    s.description = <<-DESC
    TODO: Add long description of the pod here.
    DESC
    # 维护者
    s.authors = { '罗建' => '362130376@qq.com' }
    # 许可证
    s.license = { :type => 'MIT', :file => 'LICENSE' }
    # 主页
    s.homepage = 'https://github.com/LuoJianGitHub'
    # 检索地址
    s.source = { :git => 'https://github.com/LuoJianGitHub/LQGTest.git', :tag => s.version.to_s }
    
    # 部署目标
    s.ios.deployment_target = '10.0'
    
    # 资源文件
    # 当前bundle
     s.resources = ['LQGTest/Assets/LQGTest.bundle']
    # 子bundle
    # s.resource_bundles = {
    
    # }
    
    # 源文件
    s.source_files = 'LQGTest/Classes/**/*'
    
    # 依赖库
    s.dependency 'SnapKit'
    
    s.dependency 'LQGBaseView/BaseController'
    s.dependency 'LQGBaseModel'
    
    s.dependency 'LQGCTMediator'
    s.dependency 'LQGTip'
    s.dependency 'LQGPrivacy'
    
    s.dependency 'LQGUIStyle'
end
