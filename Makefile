install:
	cargo install --path .

# make build_macos version=0.2.2
build_macos:
	cargo build --release --target x86_64-apple-darwin
	cargo build --release --target aarch64-apple-darwin
	make zip_macos_x86_64 version=$(version)
	make zip_macos_arm64 version=$(version)

# make zip_macos_x86_64 version=0.2.2
zip_macos_x86_64:
	cd target/x86_64-apple-darwin/release && \
	tar -zcvf $(version)_Darwin_x86_64.tar.gz server && \
	cd ../../../

# make zip_macos_arm64 version=0.2.2
zip_macos_arm64:
	cd target/aarch64-apple-darwin/release && \
	tar -zcvf $(version)_Darwin_arm64.tar.gz server && \
	cd ../../../

# make build_macos version=0.2.2
build_macos_release:
	make build_macos version=0.2.2