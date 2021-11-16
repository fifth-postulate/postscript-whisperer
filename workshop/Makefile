SUB_DIRECTORIES=guide
CLEAN_TARGETS=$(addsuffix clean,$(SUB_DIRECTORIES))

.PHONY: clean all ${SUB_DIRECTORIES}

all: ${SUB_DIRECTORIES}
${SUB_DIRECTORIES}:
	${MAKE} -C $@

clean: ${CLEAN_TARGETS}
%clean: %
	${MAKE} -C $< clean