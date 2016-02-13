FROM plumlife/erlang_otp-arm:17.5-6-2_smp-nacl-dialyzed

# Build rebar
RUN cd /
RUN git clone https://github.com/rebar/rebar.git
RUN cd rebar && git checkout 2.5.1 && make && mv rebar /usr/local/bin
RUN cd ../ && rm -rf rebar

# Build rebar3
RUN cd /
RUN rm -rf rebar3
RUN git clone https://github.com/rebar/rebar3.git
RUN cd rebar3 && git checkout 3.0.0-beta.4 && ./bootstrap && mv rebar3 /usr/local/bin
RUN cd ../ && ls && rm -rf rebar3

# Build relx
#
# NOTE: we need the `master` branch of relx because an issue with
# custom rebar3 build profiles interacting poorly with relx is
# fixed. This can be switched to a tag once that changes makes it to a
# release.
RUN cd /
RUN rm -rf relx
RUN git clone https://github.com/erlware/relx.git
RUN cd relx && git checkout master && ./rebar3 update && ./rebar3 escriptize && mv _build/default/bin/relx /usr/local/bin
RUN cd ../ && rm -rf _build

RUN /opt/arm/lib/erlang/Install -minimal /opt/arm/lib/erlang

# Build GPB (protocol buffers for Erlang)
RUN cd /
RUN git clone https://github.com/tomas-abrahamsson/gpb.git
RUN cd gpb && make all && cd ../
RUN mv gpb /usr/local/gpb
