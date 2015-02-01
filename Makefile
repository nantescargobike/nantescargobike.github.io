
prepare:
	bundle install

clean:
	@rake clean

build:
	@rake generate

docker: build
	@docker build -t ncb .

stopprod:
	docker ps | grep ncb | awk '{print $$1}' | xargs -r docker stop
	docker ps -a | grep ncb | awk '{print $$1}' | xargs -r docker rm

startprod: stopprod docker
	@docker run -d --name ncb -p 8891:80 ncb
	

	
