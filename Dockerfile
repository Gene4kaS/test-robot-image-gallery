FROM centos:centos7.9.2009
ENV DISPLAY_CONFIGURATION=1024x768x24

# Install python3.9.15 and dependencies 
RUN yum -y update && yum -y install gcc openssl-devel bzip2-devel libffi-devel wget make bzip2 libgtk-3-0 alsa-lib-devel gtk3-devel java && yum clean all
RUN cd /opt && wget --no-check-certificate https://www.python.org/ftp/python/3.9.15/Python-3.9.15.tgz && \
tar xzf Python-3.9.15.tgz && cd Python-3.9*/ && ./configure --enable-optimizations && make altinstall && \
rm -rf /opt/Python*

RUN ln -s /usr/local/bin/python3.9 /usr/bin/python3
RUN ln -s /usr/local/bin/pip3.9 /usr/bin/pip3

# Install tools for testing: firefox, robot framework and selenium
RUN yum install -y wget 
RUN pip3 install "urllib3 <=1.26.15"
RUN pip3 install selenium==4.6.0
RUN pip3 install robotframework==6.0.1 && pip3 install robotframework-seleniumlibrary==6.0.0
RUN pip3 install robotframework-requests==0.9.4
RUN pip3 install robotframework-jsonlibrary
# RUN wget https://download-installer.cdn.mozilla.net/pub/firefox/releases/115.0/linux-x86_64/en-GB/firefox-115.0.tar.bz2 -O /opt/firefox-115.0.tar.bz2 --no-check-certificate 
# RUN mkdir /opt/firefox && tar xvjf /opt/firefox-115.0.tar.bz2 -C /opt/firefox
# RUN ln -s /opt/firefox/firefox/firefox /usr/bin/firefox

#Install tool to compare images
RUN yum install -y ImageMagick && yum install -y ImageMagick-devel

# Install JMeter 5.4.1 and JMeter Plugins Manager
RUN cd /opt && wget -nv https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.4.1.tgz && \
tar xzf apache-jmeter-5.4.1.tgz
RUN ln -s /opt/apache-jmeter-5.4.1/bin/jmeter.sh /usr/local/bin/jmeter.sh

RUN wget -nv https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/1.6/jmeter-plugins-manager-1.6.jar
RUN mv jmeter-plugins-manager-1.6.jar /opt/apache-jmeter-5.4.1/lib/ext/


RUN pip3 list
