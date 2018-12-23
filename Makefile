TAG?=latest

.PHONY: build
build:
	docker build -t openfaas/openfaas-operator:$(TAG) . -f Dockerfile

.PHONY: build-armhf
build-armhf:
	docker build -t openfaas/openfaas-operator:$(TAG)-armhf . -f Dockerfile.armhf

.PHONY: push
push:
	docker push openfaas/openfaas-operator:$(TAG)

.PHONY: test
test:
	go test ./...

.PHONY: verify-codegen
verify-codegen:
	./hack/verify-codegen.sh

.PHONY: ci-armhf-build
ci-armhf-build:
	docker build -t openfaas/openfaas-operator:$(TAG)-armhf . -f Dockerfile.armhf

.PHONY: ci-armhf-push
ci-armhf-push:
	docker push openfaas/openfaas-operator:$(TAG)-armhf

.PHONY: ci-arm64-build
ci-arm64-build:
	docker build -t openfaas/openfaas-operator:$(TAG)-arm64 . -f Dockerfile.arm64

.PHONY: ci-arm64-push
ci-arm64-push:
	docker push openfaas/openfaas-operator:$(TAG)-arm64
