.PHONY=ALL
MATERIAL_DIR=material
REFERENCE=${MATERIAL_DIR}/PLRM.pdf
DCS=${MATERIAL_DIR}/DCS.pdf

ALL: ${REFERENCE} ${DCS}
	@echo "finished retrieving external material"

${REFERENCE}:
	curl --output $@ https://www.adobe.com/content/dam/acom/en/devnet/actionscript/articles/PLRM.pdf

${DCS}:
	curl --output $@ https://www.adobe.com/content/dam/acom/en/devnet/actionscript/articles/5001.DSC_Spec.pdf
