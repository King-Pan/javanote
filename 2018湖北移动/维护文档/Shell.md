# shell脚本





## Resart.sh脚本



```java

#!/bin/sh
ps -ef|grep smart-0.0.1-SNAPSHOT.jar|grep -v grep|cut -c 9-15|xargs kill -9
nohup java -jar smart-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod >/dev/null 2>&1  &
```



```shell
kill -9 `ps -ef|grep stall_v11.py|grep -v grep|grep -v kill|awk '{print $2}'`
```

