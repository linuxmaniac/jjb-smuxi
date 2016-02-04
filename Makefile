ENABLED=jjb/smuxi.yml

RESULTS?=reports

all: update

update:
	jenkins-job-builder update $(ENABLED)

test:
	mkdir -p $(RESULTS)/config
	jenkins-job-builder test -o ${RESULTS}/config $(ENABLED)

clean:
	rm -rf $(RESULTS)
