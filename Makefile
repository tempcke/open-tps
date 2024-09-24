build:
	docker build -t opentps .

run: build
	xhost +local:root
	docker run -e DISPLAY=$(DISPLAY) -v /tmp/.X11-unix:/tmp/.X11-unix --rm opentps
