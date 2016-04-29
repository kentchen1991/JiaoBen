#! /bin/bash

version_string="1.7"
#需要改版本号
ipa_path="https://o58p0nl21.qnssl.com/XDJMallStandard$version_string.ipa"
buildNum="8"
projectName="电商标准版"
#itms-services协议需要使用的.plist文件的位置
plist_path=~/Desktop/appOutSide/XDJMallStandard${version_string}.plist
 
# 生成plist文件  在替换对应的路径中替换为你们的路径
#cat <<EOF> $plist_path
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
                    <string>${ipa_path}</string>
                </dict>
            </array>
            <key>metadata</key>
            <dict>
                <key>bundle-identifier</key>
                <string>com.xmisp.XDJMallStandard</string>
                <key>bundle-version</key>
                <string>$buildNum</string>
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

