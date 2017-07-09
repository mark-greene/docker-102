# Docker-102 Project - Exploring docker-compose

## Docker-Development Environment

Ever want your own local github and dockerhub?  With docker-compose this is easy!  Below is all it takes to deploy Gogs - Go Git Service and Docker Registry Server V2.

```
git clone http://localhost:3000/mark/docker-development.git
docker-compose up
```

To use Gogs
```
http://localhost:3000
```
The first time you will get the Install page, select postgres database with ip address `database:5432`.  You will then need to Register.

To use the Registry
```
docker pull ubuntu && docker tag ubuntu localhost:5000/ubuntu
docker push localhost:5000/ubuntu
docker pull localhost:5000/ubuntu
```
To view the Registry
```
http://localhost:3001
```
The first time you will need to Sign In with admin/admin.  You can then set the admin password and create users.

### Self-signed certs
The certs are examples for my local development machine `mark-dev`. You will need to replace them with your own certs.

Use openssl to generate the certs.
```
openssl req -newkey rsa:4096 -nodes -sha256 -subj "/CN=localhost" -keyout certs/domain.key -x509 -days 365 -out certs/domain.crt
cp certs/domain.crt /etc/docker/certs.d/localhost:5000/ca.crt
```
Replace localhost with your domain (or host) name that you used when creating the certs

## References
* https://github.com/gogits/gogs
* https://docs.docker.com/registry/deploying/
* https://github.com/mkuchin/docker-registry-web
* https://github.com/mayflower/docker-ls
* https://github.com/docker/distribution/blob/master/docs/deploying.md#get-a-certificate
* https://docs.docker.com/registry/insecure/
* https://docs.docker.com/registry/spec/api/
