#! /bin/bash
# 传入这次的版本号
version_string="1.7"
 
# build号  我们是使用前时间作为build号的 2016041517 即为16年4月15号17点
build_number="8"
#产品名字
projectName="电商标准版"
#产品下载地址
ipa_downUrl="https://o58p0nl21.qnssl.com/XDJMallStandard_$version_string.ipa"
#产品bundleID
projectBundleID="com.xmisp.XDJMallStandard"

# 打包项目名字
scheme_name=XDJMallStandard
# 工程环境路径
workspace_path=~/Desktop/Dianjimall/XDJMallStandard/XDJMallStandard

# 打包使用的证书 
CODE_SIGN_IDENTITY=" iPhone Distribution: Xiamen Xin Click Network Polytron Technologies Inc "
 
# 打包使用的描述文件 这描述文件的名字不是自己命名的那个名字，而是对应的8b11ac11-xxxx-xxxx-xxxx-b022665db452这个名字
PROVISIONING_PROFILE="xxx"
 
# 指定yeemiao.app的输出位置 也就是Demo中build文件夹的位置
build_path=~/Desktop/appOutSide
# 指定yeemiao.ipa的输出位置
ipa_path=~/Desktop/appOutSide
 
# info.plist文件的位置
info_plist=~/Desktop/Dianjimall/XDJMallStandard/XDJMallStandard/Info.plist
 
# 下面是读取.plist文件的位置然后修改版本号和build号，这点没有使用xcodebuild提供的命令，在上面也有叙述
# 修改版本号
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $version_string" ${info_plist}
 
# 修改build号
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $build_number" ${info_plist}
 
# 生成yeemiao.app, 在build_path路径下面
xcodebuild -workspace ${workspace_path}.xcworkspace -scheme ${scheme_name} -configuration Release clean -sdk iphoneos build CODE_SIGN_IDENTITY="${CODE_SIGN_IDENTITY}" PROVISIONING_PROFILE="${PROVISIONING_PROFILE}" SYMROOT="${build_path}"
 
# 生成yeemiao.ipa, 在ipa_path路径下面
xcrun -sdk iphoneos -v PackageApplication ${build_path}/Release-iphoneos/XDJMallStandard.app -o ${ipa_path}/XDJMallStandard_${version_string}.ipa
 
# itms-services协议需要使用的.plist文件的位置
plist_path=~/Desktop/appOutSide/XDJMallStandard_${version_string}.plist
 
# 生成plist文件  在替换对应的路径中替换为你们的路径
cat <<EOF> $plist_path
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>items</key>
<array>
<dict>
<key>assets</key>
<array>
<dict>
<key>kind</key>
<string>software-package</string>
<key>url</key>
<string>${ipa_downUrl}</string>
</dict>
</array>
<key>metadata</key>
<dict>
<key>bundle-identifier</key>
<string>$projectBundleID</string>
<key>bundle-version</key>
<string>$build_number</string>
<key>kind</key>
<string>software</string>
<key>title</key>
<string>$projectName</string>
</dict>
</dict>
</array>
</dict>
</plist>
EOF


# .ipa文件的位置
ipa_file_path=~/Desktop/appOutSide/XDJMallStandard_${version_string}.ipa

# .plist文件的位置
plist_file_path=~/Desktop/appOutSide/XDJMallStandard_${version_string}.plist

