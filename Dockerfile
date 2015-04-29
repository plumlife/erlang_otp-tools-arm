FROM plumlife/erlang_otp-arm:17.5-2_dialyzed

# Build relx
RUN cd /
RUN git clone https://github.com/erlware/relx.git
RUN cd relx && git checkout v1.3.1 && ./rebar3 escriptize && mv _build/default/bin/relx /usr/local/bin
RUN cd ../ && rm -rf _build

# Build rebar
RUN cd /
RUN git clone https://github.com/rebar/rebar.git
RUN cd rebar && git checkout 2.5.1 && make && mv rebar /usr/local/bin
RUN cd ../ && rm -rf rebar

# Build rebar3
RUN cd /
RUN git clone https://github.com/rebar/rebar3.git
RUN cd rebar3 && ./bootstrap && mv rebar3 /usr/local/bin
RUN cd ../ && rm -rf rebar3

# Build GPB (protocol buffers for Erlang)
RUN cd /
RUN git clone https://github.com/tomas-abrahamsson/gpb.git
RUN cd gpb && make all && cd ../
RUN mv gpb /usr/local/gpb
