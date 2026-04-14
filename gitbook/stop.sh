application="gitbook-example"
version="latest"
port=4000

echo "stop start"
sudo docker ps -a -q --filter "name=${application}" |grep -q . && docker stop ${application} && docker rm -fv ${application}
echo "stop complete"