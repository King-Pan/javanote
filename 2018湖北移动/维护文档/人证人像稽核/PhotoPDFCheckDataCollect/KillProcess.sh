echo "kill process CreateEPAYFile  ..."
ps -ef|grep -e "CreateEPAYFile" | grep -v grep|awk '{print $2}'|xargs kill -9
echo "kill process CreateEPAYFile  end"