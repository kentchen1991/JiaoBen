#!/usr/bin/python
# -*- coding: utf-8 -*-
import qiniu
accessKey = "SZI1t46r6qdgAXwmIkaySGLOmZ2-M_eykXpvplgh"
secretKey = "Wxq5upLUp4gdp8sAEYV-8Q-u_VR3pNB775h8bnWL"
#解析结果
def parseRet(retData, respInfo):
  if retData != None:
    print("Upload file success!")
    print("Hash: " + retData["hash"])
    print("Key: " + retData["key"])
    #检查扩展参数
    for k, v in retData.items():
      if k[:2] == "x:":
        print(k + ":" + v)
    #检查其他参数
    for k, v in retData.items():
      if k[:2] == "x:" or k == "hash" or k == "key":
        continue
      else:
        print(k + ":" + str(v))
  else:
    print("Upload file failed!")
    print("Error: " + respInfo.text_body)
#无key上传，http请求中不指定key参数
def upload_without_key(bucket, filePath):
  #生成上传凭证
  auth = qiniu.Auth(accessKey, secretKey)
  #上传到七牛后保存的文件名 key
  key = "ceshitupian"
  upToken = auth.upload_token(bucket, key)
  #上传文件
  retData, respInfo = qiniu.put_file(upToken, key, filePath)
  #解析结果
  parseRet(retData, respInfo)
def main():
  bucket = "xmisp-xdjmallstandard"
  filePath = "/Users/apple/Desktop/abc.png"
  upload_without_key(bucket, filePath)
if __name__ == "__main__":
  main()