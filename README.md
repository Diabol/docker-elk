# docker-elk
## A one button setup of ELK-stack

### How you do it:

```bash
    ./run.sh
```
### This will happen
 - The latest images of ELK-components (elasticsearch, logstash and kibana) will be downloaded from diabol docker-hub repo using the `docker pull` command
 - One instance of each component will be started according to the `docker-compose.yml` file
 - The logstash component will parse the demolog entrys found in the log file in `logstash/demologs`
  - This behaviour can be overridden by editing the `command:`-clause of the logstash service in the `docker-compose.yml` file.
  - The `/opt/logstash/config/demo.conf` part of the `command` indicates that the _demo config file_ found in the `logstash/config` directory is used - **A file of your choosing can be used instead**
  - You will most likely want to add a `volume` for your log files 
 - The components can also be started with the `docker-compose up` command (which is executed at the end of `run.sh`)
  - **This will make the startup faster** because no `docker pull` will be issued
   - Make sure to run the `run.sh` command if changes have been made to images

### Further customisation
 - Creating your own elk-stack images is totally possible by editing the `Dockerfile` files and then build them with the `docker build` command, e.g. `docker build -t local/myelastic .` in the directory containing the `Dockerfile`
  - There are number of reasons to create a your own images, these may include:
    - To be able to always use the latest versions of elk-stack components released by elastic
    - To be able to use another linux distribution of your liking
 - You can also add other services in the `docker-compose.yml` file
  - It can be useful to use a caching mechanism before parsing your log files with logstash
  - Multiple logstash instances for different kinds of log files can be useful to keep the logstash config readable
