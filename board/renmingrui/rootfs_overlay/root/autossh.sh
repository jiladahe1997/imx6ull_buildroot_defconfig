#!/bin/sh        
# 这一行叫做shebang，不加systemd会报错：https://github.com/xerial/sbt-pack/issues/119
export AUTOSSH_LOGFILE=/root/.autossh.log
export AUTOSSH_FIRST_POLL=5
# POLL只能是60， 设置为30会一直报错：https://bugs.launchpad.net/ubuntu/+source/autossh/+bug/992110
export AUTOSSH_POLL=60

echo "checking ssh key in /root/.ssh/id_rsa ......"
test -f /root/.ssh/id_rsa
rsa=$?
echo "debug info: rsa is $rsa"
if [ $rsa != 0 ]; then
    echo "can not find ssh key, generate a new one..."
    ssh-keygen -f /root/.ssh/id_rsa -N ""        # -f代表文件位置 -N代表密码。两者一起使用sshkey可以免交互执行。
echo "ok"

echo "copy ssh key to remote server..."
		sshpass -p Freedom1997 ssh-copy-id root@182.92.164.220 -o StrictHostKeyChecking=no  # 将本机的sshkey添加到远程，之后免密登录
echo "ok"

echo "change sshd config file to allow root login..."
		sed -ie 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config    # 开启密码登录
        sed -ie 's/#PasswordAuthentication/PasswordAuthentication/' /etc/ssh/sshd_config
        systemctl restart sshd
        sleep 5
echo "ok"
fi

autossh -f -M 6000 -NR 7000:localhost:22 root@182.92.164.220 -i /root/.ssh/id_rsa