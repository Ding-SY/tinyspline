#!/bin/bash
set -e

if [ "$TRAVIS_OS_NAME" == "linux" ]; then
	sudo apt-get -qq update
	sudo apt-get install --no-install-recommends \
		cmake               \
		doxygen             \
		graphviz            \
		python-dev          \
		ruby-dev            \
		php-dev             \
		liblua5.3-dev       \
		octave-pkg-dev      \
		openjdk-8-jdk       \
		r-base              \
		r-cran-rcpp         \
		-y;
fi

if [ "$CIRCLECI" == "true" ]; then
	sudo apt-get -qq update
	sudo apt-get install --no-install-recommends \
		cmake               \
		doxygen             \
		graphviz            \
		python-dev          \
		ruby-dev            \
		octave-pkg-dev      \
		openjdk-8-jdk       \
		r-base              \
		r-cran-rcpp         \
		-y;
fi

if [ "$TRAVIS_OS_NAME" == "osx" ]; then
	brew tap homebrew/php
	brew update
	brew install \
		swig                \
		php71               \
		lua
fi

# Compile and install Swig-3.0.12 from source.
wget https://github.com/swig/swig/archive/rel-3.0.12.tar.gz
tar xf rel-3.0.12.tar.gz
pushd swig-rel-3.0.12
	./autogen.sh
	./configure
	make
	sudo make install
popd
