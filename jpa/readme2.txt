export JAVA_6_HOME=/Library/Java/JavaVirtualMachines//1.6.0.jdk/Contents/Home
export JAVA_7_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home
export JAVA_8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home

alias jdk6="export JAVA_HOME=$JAVA_6_HOME" #编辑一个命令jdk6，输入则转至jdk1.6
alias jdk7="export JAVA_HOME=$JAVA_7_HOME" #编辑一个命令jdk8，输入则转至jdk1.8
alias jdk8="export JAVA_HOME=$JAVA_8_HOME" #编辑一个命令jdk8，输入则转至jdk1.8

export JAVA_HOME='/usr/libexec/java_home'  #最后安装的版本，这样当自动更新时，始终指向最新版本

export JAVA_HOME='/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin/java'


export M2_HOME="/Users/king-pan/tools/maven-3.5.0/" 
export PATH="$JAVA_HOME/bin:$M2_HOME/bin:/opt/local/bin:/opt/local/sbin:$PATH"


