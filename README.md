
# Pacific Community -  Divisions Wordpress Sites

### Requirements

* Docker installation with docker-compose.
* Licensed versions of Extra and Divi themes, along with Divi-Builder plugin from eleganthemes.com, and saved as extra.zip, divi.zip and divi-plugin.zip respectively in the cloned project folder.


### Installation

1. `git clone --depth=1 https://github.com/sopac/spcweb.git`

2. Modify variables in the top part of setup.sh file

3. Run `./setup.sh`

### Subsequent Runs

`docker-compose up -d`

### Stopping Containers

`docker-compose stop`

### Destroying Containers

`docker-compose down`

