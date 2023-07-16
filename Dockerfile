FROM alpine

LABEL "name"="Git Repo Mirror"
LABEL "description"="Universal mirroring repository tool."
LABEL "maintainer"="iHub TO <mail@ihub.to>"
LABEL "repository"="https://github.com/ghastore/git-mirror.git"
LABEL "homepage"="https://github.com/ghastore"

COPY *.sh /
RUN apk add --no-cache bash git git-lfs

ENTRYPOINT ["/entrypoint.sh"]
