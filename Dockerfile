FROM alpine:latest

LABEL "com.github.actions.name"="Build Ghost Theme"
LABEL "com.github.actions.description"="Build a Ghost THeme zip file with file named determined by pack.json file"
LABEL "com.github.actions.icon"="folder-plus"
LABEL "com.github.actions.color"="gray-dark"

LABEL "repository"="https://github.com/foolscapcon/action-build-ghost-theme"
LABEL "homepage"="https://github.com/foolscapcon/action-build-ghost-theme"
LABEL "maintainer"="Douglas Beal <public@dougbeal.com>"

RUN apk --no-cache add jq zip

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
