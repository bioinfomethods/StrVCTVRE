FROM continuumio/miniconda3:latest

LABEL maintainer="MCRI"

RUN apt-get update && apt-get install -y build-essential checkinstall \
    libssl-dev libsqlite3-dev libcurl4-openssl-dev libbz2-dev liblzma-dev \
    libncursesw5-dev tk-dev libgdbm-dev libc6-dev libffi-dev wget gcc tabix git curl

WORKDIR /opt/StrVCTVRE

COPY environment_py3.yml .

RUN conda config --append channels conda-forge && conda env create -f environment_py3.yml

COPY data /opt/StrVCTVRE/data
COPY *.py .
COPY *.ipynb .
COPY *.sh .

SHELL ["/bin/bash", "-c"]

CMD [ "/opt/StrVCTVRE/entrypoint.sh" ]
