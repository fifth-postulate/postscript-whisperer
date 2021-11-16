.PHONY: clean

BOOK=book
SOURCE_DIRECTORY=src
SOURCES=$(shell find ${SOURCE_DIRECTORY} -name '*.md')

${BOOK}: ${SOURCES} 
	mdbook build

clean:
	mdbook clean