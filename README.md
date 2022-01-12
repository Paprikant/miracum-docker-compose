# MIRACUM docker-compose

A docker-compose environmant starting local instances of [IRIDA](https://irida.ca/), [galaxy](https://galaxyproject.org/) and [cBioPortal](https://www.cbioportal.org/).

## Purposes
For now this is more of a "proof of concept" rather than something that should actually be used in practice.
Feel free to fork this repo, play around and suggest improvements

## How to use
* Make sure docker is installed and docker-compose is available from your terminal
* Clone this repo
* run `docker-compose up -d --build` from repository root

> :warning: **the path matters**: this deployment uses a .env file. While docker-compose allows you to perform actions in sub-directries, the .env file will not be found from there



## Access 
### IRIDA
* IRIDA is available at **port** `8085`
* IRIDA can be accessed by **user** `admin` and **password** `password1`. After the first login IRIDA will prompt you to set up a new password for the admin user

### galaxy
* galaxy is available at **port** `8080`
* the galaxy admin credentials are set to **user** `admin`, **email** `admin@galaxy.local` and **password** `password1`
> :warning: **changing galaxy admin password**: the password can be changed in .env, but this should be done before the galaxy container first started.

## Data
All relevant data is stored in volumes. Therefore it is persisted, even after calling `docker-compose down`.
To remove all data use the `-v` flag i.e. `docker-compose down -v` 
