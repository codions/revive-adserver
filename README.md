# Revive Adserver
<img src="logo.png" alt="revive">

Docker image Revive Adserver 5.5

### Setup

```
git clone https://github.com/codions/revive-adserver.git
cd revive-adserver
docker-compose up -d
```

Once you have the containers deployed, you can access  [http://localhost:8080](http://localhost:8080)

Complete with the following MySQL configuration:
* host: `mysql`
* database name `revive` 
* mysql username: `root`
* mysql password: `secret`

### References
* https://www.revive-adserver.com/
* https://github.com/revive-adserver/revive-adserver/