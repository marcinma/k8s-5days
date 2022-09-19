FROM python

WORKDIR /home

COPY . /home
RUN pip install --no-cache --extra-index-url https://TokenToBeProtected:@packagecloud.io/2rs2ts/newrepo/pypi/simple -r requirements.txt

ENTRYPOINT ["python", "fix-me.py"]