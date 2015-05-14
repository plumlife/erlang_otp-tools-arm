.PHONY: build push

build:
	sudo docker build -t plumlife/erlang_otp-tools-arm:17.5-2-rebar3-relx-gpb .

push:
	sudo docker push plumlife/erlang_otp-tools-arm:17.5-2-rebar3-relx-gpb
