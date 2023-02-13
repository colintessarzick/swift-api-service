FROM swift:5.7.3

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y

RUN swift package clean
RUN swift build

RUN mkdir /app/bin
RUN mv `swift build --show-bin-path` /app/bin

EXPOSE 5813
ENTRYPOINT ./bin/debug/Run serve --env live --hostname 0.0.0.0 --port 5813
