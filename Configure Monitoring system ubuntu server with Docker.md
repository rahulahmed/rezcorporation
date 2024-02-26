Monitoring solution for Docker hosts and containers with Prometheus, Grafana & Node Express.
Prerequisites
Make sure that you have Docker and Docker Compose installed:
Docker Engine
Docker Compose

To run Prometheus, Grafana, and Node Exporter using Docker, require Docker Compose file which defines the services and their configurations. Using Docker Compose it simplifies the process to run multi-container Docker applications.



Let’s start set up a Docker Compose file to run Prometheus, Grafana, and Node Exporter.

Step 1: Need a directory for project create directory and enter using ‘mkdir monitoring’ & ‘cd /monitoring’.

Step 2: Create docker-compose.yml file using ‘nano  docker-compose.yml’, and add necessary commands to the files.

version: '3'

services:
  prometheus:
    image: prom/prometheus
    container_name: prometheus
    ports:
      - "9090:9090"
    volumes:
      - ./prometheus:/etc/prometheus
    command:
      - "--config.file=/etc/prometheus/prometheus.yml"
datasources:
  - name: Prometheus
    type: prometheus
    access: proxy
    orgId: 1
    url: http://prometheus:9090
    basicAuth: false

  grafana:
    image: grafana/grafana
    container_name: grafana
    ports:
      - "3000:3000"
    Volumes:
 volumes:
      - ./grafana:/var/lib/grafana

version: "3.8"
services:
  grafana:
    image: grafana/grafana-enterprise
    container_name: grafana
    restart: unless-stopped
    ports:
     - '3000:3000'

  nodeexporter:
    image: prom/node-exporter
    container_name: nodeexporter
    ports:
      - "9100:9100"




Step 3: Create a prometheus directory and add a prometheus.yml file for Prometheus configuration
		

global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'node-exporter'
    static_configs:
      - targets: ['nodeexporter:9100']

Step 4:  Now write command ‘docker-compose up -d’  ‘-d’ for detach mode.

Step 5: Check all containers are in running condition or not using ‘docker ps’

Step 7: Access prometheus, nodeexporter and grafana from browser with host name and port number example: 10.145.14.01:9090



Connect Grafana with Prometheus:

Step 1: Using a web browser, visit port 3000 of the monitoring server. For example, enter http://local_ip_addr:3000, replacing local_ip_addr with the actual IP address. Grafana displays the login page. Use the user name admin and the default password password. Change the password to a more secure value when prompted to do so.



Step 2: After a successful password change, Grafana displays the Grafana Dashboard.



Step 3: To add Prometheus as a data source, click the gear symbol, standing for Configuration, then select Data Sources.


Step 4: At the next display, click the Add data source button.

Step 5: Choose Prometheus as the data source.

For a local Prometheus source, as described in this guide, set the URL to http://localhost:9090. Most of the other settings can remain at the default values. If you want to fetch data from host name then you have to define the datasources in ‘docker-compose.yml’ file. 

datasources:
  - name: Prometheus
    type: prometheus
    access: proxy
    orgId: 1
    url: http://prometheus:9090
    basicAuth: false



Step 5: When everything done, select the Save & test button at the bottom of the screen.



Step 6: If all settings are correct, Grafana confirms the Data source is working.






Import Grafana Dashboard:

Step 1: Navigate to Grafana dashboard. Select the Dashboard icon and choose “+ Import”.




Step 2: In the Import via grafana.com box, enter the ID you can find it on grafanahub, then select the Load button.




Step 3: At the next screen, confirm the import details. Choose Prometheus as the data source and click the Import button.







					Dashboard


The Node Exporter Full dashboard takes effect immediately. It displays the performance metrics and state of the client node, including the Memory, RAM, and CPU details. Several drop-down menus at the top of the screen allow users to select the host to observe and the time period to highlight.



