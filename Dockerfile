FROM debian:12.6
EXPOSE 5000
WORKDIR /srv
COPY . .

RUN apt-get update && apt-get install -y \
  git \
  htop \
  python3 \
  python3-pip  

RUN pip3 install --break-system-packages -r requirements.txt

ENTRYPOINT ["/usr/local/bin/gunicorn", "-b", "0.0.0.0:5000", "hello:app"]
