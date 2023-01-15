########## Pull ##########
FROM nvidia/cuda:11.6.2-cudnn8-devel-ubuntu20.04
########## Non-interactive ##########
ENV DEBIAN_FRONTEND=noninteractive
########## Common Tools ##########
RUN apt-get update && \
    apt-get install -y \
	    vim \
    	wget \
    	unzip \
    	git \
		python3-tk
########## PyTorch ##########
RUN apt-get update && \
    apt-get install -y \
	    python3-pip && \
	pip3 install \
		torch==1.12.1+cu116 \
		torchvision==0.13.1+cu116 \
		torchaudio==0.12.1 \
		--extra-index-url https://download.pytorch.org/whl/cu116 \
		tensorboardX \
		tensorboard
########## Cache Busting ##########
ARG cachebust=1
########## pix2pixhd ##########
RUN mkdir -p /home/user && \
	cd /home/user && \
	git clone https://github.com/NVIDIA/pix2pixHD.git && \
	pip3 install \
		dominate \
		scipy
########## User ##########
RUN apt-get update && \
	apt-get install -y gosu
COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
########## Initial Position ##########
WORKDIR /home/user/pix2pixHD
CMD ["bash"]