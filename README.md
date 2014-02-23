# docker-opengrok

The one-liner to spin up a code search engine

OpenGrok is a code search engine made by Sun (and now Oracle). It provides
similar functions to [LXR](http://lxr.linux.no/) but more. This project
encapsulated OpenGrok into a docker container. Allowing you to start an
instance of OpenGrok by one command.

## Usage

To start the OpenGrok, simply run:

```sh
docker run -d -v [source to be indexed on host]:/src -p [public port]:8080 itszero/opengrok
```

It may take a while for the indexer to finish the first-time indexing, after
that, the search engine is available at `http://host:[public port]/source/`.

## Note

The project does not support dynamic index updating for now. It could be
achieved by `touch /grok/reindex` in the container. However, I haven't found
the best way to expose this mechanism.
