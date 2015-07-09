
# Notes:

For vagrant-embedded project.
Purpose: Training tools.
Note: For this file and the rest of files under this folder, use view/line ending/Unix!

Kiet T. Tran, 2015.


This VM is used for a Certified Scrum Developer (CSD) class that focus on Java & C++
using a Linux VM fully. This is a complete development environment for those who wants to 
develop Java/C++ code on a Linux box. It is very slow, however, if it is used as is for a
VM box on an ORACLE Virtual Box. Perhaps (VMWare or similar Type 1 Virtualization is better)

## Running xwindows:
- Login to VB through the Oracle VB windows as vagrant/vagrant
- Run 'startx' command.
- Run Eclipse from /opt/eclipse.
- Complete the manual provisioning.

## Vagrant commands:
To start up a VM: vagrant up --provision
To reload a VM  : vagrant reload --provision
To destroy a VM : vagrant destroy -f
To stop a VM    : vagrant halt

## Required downloaded software placed in the bin folder:
- jdk-8u45-linux-x64.tar.gz
- apache-tomcat-7.0.62.tar.gz
- eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz

## Manual provisioning for the Eclipse on Linux:
- Installing CDT - http://download.eclipse.org/tools/cdt/releases/8.6
- Installing CUTE Plugin - http://www.cute-test.com/updatesite
- Example website for CUTE: http://cute-test.com/projects/cute/wiki/Using_the_CUTE_Eclipse_Plugin
NOTE: Because of the installation of an XWindows, this install can take a long time.