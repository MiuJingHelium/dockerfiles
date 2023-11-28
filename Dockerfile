FROM ubuntu:bionic

RUN apt-get update -y 	&& apt-get install -y --no-install-recommends\
 		apt-utils \
		python3.8 \
		python3-venv \
		python3-pip \
	&& apt-get clean

RUN python3.8 -m pip install --upgrade pip
RUN pip3 install setuptools
RUN pip3 install pandas
RUN pip3 install synapseclient
