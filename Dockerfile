FROM plumlife/erlang_otp-arm:17.3-4_dialyzed

# Build relx
RUN cd /
RUN git clone https://github.com/erlware/relx.git
RUN cd relx && make && mv relx /usr/local/bin
RUN cd ../ && rm -rf relx

# Build rebar
RUN cd /
RUN git clone https://github.com/rebar/rebar.git
RUN cd rebar && git checkout 2.5.1 && make && mv rebar /usr/local/bin
RUN cd ../ && rm -rf rebar

# Build rebar3
RUN cd /
RUN git clone https://github.com/rebar/rebar3.git
RUN cd rebar3 && make && ./bootstrap/bootstrap && mv rebar3 /usr/local/bin
RUN cd ../ && rm -rf rebar3
