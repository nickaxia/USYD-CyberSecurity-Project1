# USYD-CyberSecurity-Project1
Homework: GitHub Fundamentals and Project1  (Week-13 ELK Stack Submission)

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![alt text](https://github.com/nickaxia/USYD-CyberSecurity-Project1/blob/main/Diagrams/Project1-ELK_Stack_Diagram.png)



These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the **_yml and config file_** may be used to install only certain pieces of it, such as Filebeat.

  
- [My First Playbook]( https://github.com/nickaxia/USYD-CyberSecurity-Project1/blob/main/Ansible/Docker/my-playbook.yml) 
- [ELK-Playbook]( https://github.com/nickaxia/USYD-CyberSecurity-Project1/blob/main/Ansible/ELK_Stack/elk-playbook.yml)
- [Filebeat-Playbook]( https://github.com/nickaxia/USYD-CyberSecurity-Project1/blob/main/Ansible/Filebeat/filebeat-playbook.yml)
- [Metricbeat-Playbook]( https://github.com/nickaxia/USYD-CyberSecurity-Project1/blob/main/Ansible/Metricbeat/metricbeat-playbook.yml)


These documents contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


## Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly **_functional and available_**, in addition to restricting **_traffic_** to the network.

- What aspect of security do load balancers protect? 

**_Load balancers add resiliency by rerouting live traffic from one server to another if a server falls prey to a DDoS attack or otherwise becomes unavailable_**

- What is the advantage of a jump box?

**_A Jump Box Provisioner is also important as it prevents Azure VMs from being exposed via a public IP Address. This allows us to do monitoring and logging on a single box. We can also restrict the IP addresses able to communicate with the Jump Box_**

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the **_network_** and **_system logs_**.

- What does Filebeat watch for?

**_Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing._**


- What does Metricbeat record?

**_Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash_**

The configuration details of each machine may be found below.
 

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux  (Ubuntu)  |
| Web1     | DVWA     | 10.0.0.5   | Linux  (Ubuntu)  |
| Web2     | DVWA     | 10.0.0.6   | Linux  (Ubuntu)  |
| ELK      | Server   | 10.1.0.5   | Linux  (Ubuntu)  |


## Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the **_Jump-Box Provisioner_** machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

**_My Remote Desktop via my Public IP connecting to the Jump-Box Public IP: 20.213.156.62 via port22 SSH connection_**.
 
Machines within the network can only be accessed by via **_SSH Jump-Box_**

- Which machine did you allow to access your ELK VM? 

**_The Jump-Box Provisioner_**

- What was its IP address?_

**_IP: 10.1.0.5 via SSH port 22_**

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes	                | 20.213.156.62:22(SSH)|
| Web1     | Yes (Load Balancer) | 20.213.81.187:22(SSH)|
| Web2     | Yes (Load Balancer) | 20.213.81.187:22(SSH)|                  
| ELK      | Yes (Kibana)        | 20.106.88.230:5601   |



## Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...

- What is the main advantage of automating configuration with Ansible?

**_The advantages of Ansible lets you quickly and easily deploy multitier applications through a YAML playbook. don't need to write custom code to automate your systems. Ansible will also figure out how to get your systems to the state you want them to be in_**.


The playbook implements the following tasks:

In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc.

- **Installs first task docker.io**
- **Install 2nd task python3-pip3**
- **Install 3rd task Docker module**
- **Increase virtual memory**
- **Download and launch a docker ELK container**
 

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![alt text]( https://github.com/nickaxia/USYD-CyberSecurity-Project1/blob/main/Diagrams/Images/Capture_ELK_Docker%20PS.PNG)

## Target Machines & Beats

This ELK server is configured to monitor the following machines:

- List the IP addresses of the machines you are monitoring

**_Web1 10.0.0.5_**
**_Web2 10.0.0.6_**

We have installed the following Beats on these machines:

- Specify which Beats you successfully installed

**_FileBeat_**
**_MetricBeat_**

These Beats allow us to collect the following information from each machine:
- In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc.

**_ The Beats allow us to collect the following information and data from each machine: -Filebeat system log management and collecting data like Sudo commands, SSH logins, and new users and groups -Metricbeat is used to monitor VM stats per CPU core, filesystem stats, memory stats and network stats. Monitoring the DWVA services it tracks CPU usage, Memory, and Number of Containers._**

## Using the Playbook

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the **_yml_** file to **_/etc/ansible folder_**.
- Update the **_config_** file to include **_remote users and ports_**
- Run the playbook, and navigate to **_Kibana (http://[your.ELK-VM.External.IP]:5601/app/kibana)_** to check that the installation worked as expected.

Answer the following questions to fill in the blanks:_

Which file is the playbook? 

- [ELK installation file]( https://github.com/nickaxia/USYD-CyberSecurity-Project1/blob/main/Ansible/ELK_Stack/elk-playbook.yml)

Where do you copy it?

**_Copied into root@a062c34c9d59:/etc/ansible#_**
- [Elk Yaml file location]( https://github.com/nickaxia/USYD-CyberSecurity-Project1/blob/main/Diagrams/Images/Capture_ELK_location_file.PNG)


Which file do you update to make Ansible run the playbook on a specific machine? 

**_Updating the /etc/amsible/hosts_**
- [Host_File]( https://github.com/nickaxia/USYD-CyberSecurity-Project1/blob/main/Ansible/ELK_Stack/hosts.txt)


How do I specify which machine to install the ELK server on versus which to install Filebeat on?_

**_For the ELK server editing the Host file with new group name called “ELK” add the IP address of the ELK virtual machine and its python link ansible_python_interpreter=/usr/bin/python3_**
**_For the Filebeat edit etc/ansible/filebeat-config.yml and scroll to line #1106 and #1806, replace the IP address with the IP address of the ELK machine.-
**

LINE 1106
![alt text]( https://github.com/nickaxia/USYD-CyberSecurity-Project1/blob/main/Diagrams/Images/Capture_FilbeatConfig_line1106.PNG)

LINE 1806
![alt text]( https://github.com/nickaxia/USYD-CyberSecurity-Project1/blob/main/Diagrams/Images/Capture_FilbeatConfig_line1186.PNG)

- _Which URL do you navigate to in order to check that the ELK server is running?

https://20.106.88.230:5601/app/kibana


_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._




