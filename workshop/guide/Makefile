.PHONY: clean images

BOOK=book
SOURCE_DIRECTORY=src
IMAGE_SOURCE_DIRECTORY=image-src
IMAGE_TARGET_DIRECTORY=src/image/generated
SOURCES=$(shell find ${SOURCE_DIRECTORY} -name '*.md')
IMAGE_SOURCES=$(shell find ${IMAGE_SOURCE_DIRECTORY} -name '*.ps')
IMAGE_TARGETS=$(addprefix ${IMAGE_TARGET_DIRECTORY}/,$(addsuffix .png,$(basename $(notdir ${IMAGE_SOURCES}))))

${BOOK}: ${SOURCES} images 
	mdbook build

images: ${IMAGE_TARGETS}
	@echo "finished building png images"

${IMAGE_TARGET_DIRECTORY}/%.png: ${IMAGE_SOURCE_DIRECTORY}/%.ps
	gs -sDEVICE=png256 -sPAPERSIZE=a5 -o $@ $<

clean:
	mdbook clean
	rm -f ${IMAGE_TARGETS}