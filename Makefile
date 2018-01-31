TAG_BASE=cjouve/
VERSION=latest

all: apt-cacher-ng debian-cacher-ng alpine-cacher-ng gentoo-cacher-ng

apt-cacher-ng:
	cd acng && docker build . -t $(TAG_BASE)apt-cacher-ng:$(VERSION)

debian-cacher-ng: apt-cacher-ng
	cd acng-debian && docker build . -t $(TAG_BASE)debian-cacher-ng:$(VERSION) --build-arg BASE_IMG=$(TAG_BASE)apt-cacher-ng:$(VERSION)

alpine-cacher-ng: apt-cacher-ng
	cd acng-alpine && docker build . -t $(TAG_BASE)alpine-cacher-ng:$(VERSION) --build-arg BASE_IMG=$(TAG_BASE)apt-cacher-ng:$(VERSION)

gentoo-cacher-ng: apt-cacher-ng
	cd acng-gentoo && docker build . -t $(TAG_BASE)gentoo-cacher-ng:$(VERSION) --build-arg BASE_IMG=$(TAG_BASE)apt-cacher-ng:$(VERSION)

.PHONY: apt-cacher-ng debian-cacher-ng alpine-cacher-ng gentoo-cacher-ng

