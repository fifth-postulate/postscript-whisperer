ARCHIVE=workshop-material.tar.gz
MATERIAL_DIR=postscript-workshop
WEBPAGE_DIR=public
SUB_DIRECTORIES=workshop
CLEAN_TARGETS=$(addsuffix clean,$(SUB_DIRECTORIES))

.PHONY: all clean ${SUB_DIRECTORIES} ${CLEAN_TARGETS}

all: ${ARCHIVE} ${WEBPAGE_DIR}
${ARCHIVE}: ${MATERIAL_DIR} 
	tar cvfz $@ $<

${MATERIAL_DIR}: ${SUB_DIRECTORIES}
	mkdir -p $@
	cp -rf resources/material/* $@/
	cp -rf workshop/guide/book $@/guide
	mkdir -p $@/example
	cp -rf workshop/example/* $@/example
	cp -rf presentation $@/presentation

${SUB_DIRECTORIES}:
	${MAKE} -C $@

${WEBPAGE_DIR}: ${MATERIAL_DIR} ${ARCHIVE}
	mkdir -p $@
	cp -rf $</guide $@/guide
	cp -rf $</presentation $@/presentation
	cp resources/public/* $@/

clean: ${CLEAN_TARGETS}
	rm -rf ${ARCHIVE} ${MATERIAL_DIR} ${WEBPAGE_DIR}

%clean: %
	${MAKE} -C $< clean