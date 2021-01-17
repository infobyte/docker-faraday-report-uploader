FROM python:3.8

ADD entrypoint.sh /entrypoint.sh
ADD src /src

RUN pip install faraday-cli

# Workaround because bandit is a plugin that still is not available in faraday_plugins
ADD bandit /usr/local/lib/python3.9/site-packages/faraday_plugins/plugins/repo/bandit

ARG HOST
ARG USERNAME
ARG PASSWORD
ARG WORKSPACE
ARG FILES

ENTRYPOINT ./entrypoint.sh $HOST $USERNAME $PASSWORD $WORKSPACE $FILES