FROM python:3.7

RUN mkdir -p /home/ubuntu/docker-app/
WORKDIR /home/ubuntu/docker-app/
COPY . /home/ubuntu/docker-app/

RUN apt-get update -y
RUN apt-get -q upgrade -y
RUN apt-get -q install -y rubygems ruby-dev

#Install & Run Jekyll:
RUN gem install bundler jekyll
RUN cd /home/ubuntu/docker-app/
RUN jekyll new . --force

EXPOSE 80

CMD bundle exec jekyll serve --port 80 --host 0.0.0.0

