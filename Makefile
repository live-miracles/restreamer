.PHONY: *

pretty:
	npx prettier "!**/*{.min.css,.min.js,output.css}" --write .

css:
	npx @tailwindcss/cli -i ./input.css -o ./output.css --watch

start-mediamtx:
	docker run --rm -it -p 8554:8554 -p 1935:1935 -p 8888:8888 -v ./mediamtx.yml:/mediamtx.yml bluenviron/mediamtx

start-ui:
	npm start

start-input:
	ffmpeg -re -i test/colorbar-timer.mp4 -c copy -f flv rtmp://localhost/live/stream1
