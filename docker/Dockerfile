#FROM ubuntu:22.04
#
#RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends \
#        curl \
#     && apt-get update && apt-get -y upgrade
#
#RUN bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
#
#
#ENV PATH=~/.opam/
FROM ocaml/opam

RUN opam update \
    && opam install base core_kernel ounit qcheck dune ocamlformat
