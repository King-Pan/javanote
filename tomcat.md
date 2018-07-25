




```
<Executor name="tomcatThreadPool" namePrefix ="TomcatThreadPool-exec-" maxThreads="2000" minSpareThreads="200" maxIdleTime="60000" />
```


<Executor name="tomcatThreadPool" namePrefix ="TomcatThreadPool-exec-" maxThreads="2000" minSpareThreads="200" maxIdleTime="60000" />

<Connector executor="tomcatThreadPool" port="8080" protocol="HTTP/1.1" connectionTimeout="20000" redirectPort="8443" acceptCount="1000" />



ps -p 7745 -lfT | wc -l



