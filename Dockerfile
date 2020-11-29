FROM python:3.6.8-alpine

LABEL maintainer="David Yun <sncap7@gmail.com>" \
      name="Alpine Machine Learning Base Container" \
      description="Alpine for Machine Learning/Deep Learning stuffs with Python" \
      version="1.0"

RUN echo "|--> Updating" \
    && apk update && apk upgrade \
    && echo http://dl-cdn.alpinelinux.org/alpine/edge/main | tee /etc/apk/repositories \
    && echo http://dl-cdn.alpinelinux.org/alpine/edge/testing | tee -a /etc/apk/repositories \
    && echo http://dl-cdn.alpinelinux.org/alpine/edge/community | tee -a /etc/apk/repositories \
    && echo "|--> Install basics pre-requisites" \
    && pip3 install --upgrade pip \
    && pip install certifi --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org \
    && echo "|--> Install pip Lib"

RUN apk update
RUN echo "http://dl-8.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk --no-cache --update-cache add gcc gfortran build-base wget freetype-dev libpng-dev openblas-dev
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
RUN pip install cython
RUN apk add --no-cache jpeg-dev zlib-dev
RUN pip install numpy==1.17.3 pandas matplotlib scipy
RUN apk --no-cache add --virtual .builddeps g++ musl-dev \
     && pip install scikit-learn==0.19.1 \
     && apk del .builddeps \
     && rm -rf /root/.cache
RUN pip install swifter==1.0.7 opencv-python==4.4.0.46

#    && pip3 install numpy \
#    && pip3 install -U --no-cache-dir \
#        sklearn \
#        swifter==1.0.7 pandas opencv-python==4.4.0.46 tensorflow==2.3.1 \
#        keras==2.4.3 flask==1.1.2 gunicorn==20.0.4 uvicorn==0.12.2 parso==0.7.1 \
#        --trusted-host=pypi.org --trusted-host=pypi.python.org --trusted-host=files.pythonhosted.org\
#    && pip3 install numpy==1.17.3 \
#    && echo "|--> Done!"
#    && pip install https://download.pytorch.org/whl/cpu/torch-1.1.0-cp36-cp36m-linux_x86_64.whl



#torch==1.1.0
#torchvision==0.3.0
#fastai==1.0.54
#werkzeug==1.0.1
#annoy==1.17.0


#swifter==1.0.7
#numpy==1.17.3
#pandas==1.1.4
#matplotlib==3.3.2
#sklearn==0.0
#opencv-python==4.4.0.46
#tensorflow==2.3.1
#keras==2.4.3
#flask==1.1.2
#gunicorn==20.0.4
#uvicorn==0.12.2
#setuptools==45.2.0
#parso==0.7.1

#RUN echo "|--> Install pip Lib" \
#    && pip3 install -U --no-cache-dir \
#        sklearn \
##        swifter==1.0.7 numpy==1.17.3 pandas==1.1.4 opencv-python==4.4.0.46 tensorflow==2.3.1 \
##        keras==2.4.3 flask==1.1.2 gunicorn==20.0.4 uvicorn==0.12.2 parso==0.7.1 \
#        --trusted-host=pypi.org --trusted-host=pypi.python.org --trusted-host=files.pythonhosted.org \
#
#    && echo "|--> Install PyTorch" \

#    && git clone --recursive https://github.com/pytorch/pytorch \
#    && cd pytorch && python setup.py install \
#    && echo "|--> Install Torch Vision" \
#    && git clone --recursive https://github.com/pytorch/vision \
#    && cd vision && python setup.py install \
#    && echo "|--> Cleaning" \
#    && rm -rf /pytorch \
#    && rm -rf /root/.cache \
#    && rm -rf /var/cache/apk/* \
#    && apk del .build-deps \
#    && find /usr/lib/python3.6 -name __pycache__ | xargs rm -r \
#    && rm -rf /root/.[acpw]*
#    && echo "|--> Done!"

#ENTRYPOINT ["/bin/sh"]
