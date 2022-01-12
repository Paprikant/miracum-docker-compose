# IRIDA image

IRIDA image built on top of tomcat8 with java 11

## Configuring this image
The IRIDA image creates configuration from environment variables. Following variables must be set

| environment variable  |                                                           |
|-----------------------|-----------------------------------------------------------|
| `IRIDA_DATABASE_NAME` | name of the database to use                               |
| `IRIDA_DATABASE_USER` | database user to access IRIDA database                    |
| `IRIDA_DATABASE_PASS` | password of the database user                             |
| `IRIDA_GALAXY_USER`   | email of a galaxy user that will be used to run workflows |
| `IRIDA_GALAXY_KEY`    | galaxy API key of the galaxy user                         |


