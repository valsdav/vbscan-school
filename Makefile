default: image

all: image

image:
	docker build . \
	-f ubuntu/Dockerfile \
	--build-arg BUILDER_IMAGE=rootproject/root:6.24.02-ubuntu20.04 \
	--build-arg HEPMC_VERSION=2.06.11 \
	--build-arg FASTJET_VERSION=3.3.4 \
	--build-arg LHAPDF_VERSION=6.3.0 \
	--build-arg PYTHIA_VERSION=8243 \
	--build-arg MG_VERSION=3.1.1 \
	--build-arg PDFSET=NNPDF31_lo_as_0118 \
	-t valsdav/vbscan-school:latest \
	-t valsdav/vbscan-school:1.2 \
	--compress
