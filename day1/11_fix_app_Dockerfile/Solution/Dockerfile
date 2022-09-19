FROM python:3 as builder

WORKDIR /home

COPY requirements.txt /home
ARG PIP_EXTRA_INDEX_URL
RUN pip install --no-cache --extra-index-url ${PIP_EXTRA_INDEX_URL} -r requirements.txt

From python:3
COPY --from=builder / /
COPY fix-me.py /home

ENV AZUREDBURI 127.0.0.1:5009
ENV AZUREDBPASS changme
EXPOSE 80
ENTRYPOINT ["python", "main.py"]