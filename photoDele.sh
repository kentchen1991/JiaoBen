PATH=/bin:/usr/local/bin:~/bin:/sbin:/usr/bin
export PATH
for i in `find . -name "*.png" -o -name "*.jpg"`; do
	file=`basename -s .jpg "$i" | xargs basename -s .png | xargs basename -s @2x`
	result=`ack -i "$file"`
	if [ -z "$result" ]; then 
		 echo "$i"
		 #可更改为删除
		 #rm "$i"
		fi
	done
