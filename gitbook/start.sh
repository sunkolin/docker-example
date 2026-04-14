application="gitbook-example"
version="latest"
port=4000

sudo docker build -f docker/Dockerfile --tag xiaozhi90/${application}:${version} .
sudo docker ps -a -q --filter "name=${application}" |grep -q . && docker stop ${application} && docker rm -fv ${application}
sudo docker run -itd --name ${application} -p ${port}:${port} xiaozhi90/${application}:${version}