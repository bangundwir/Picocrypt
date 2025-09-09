Picocrypt Windows Build Guide
================================

Prerequisites:
- Go 1.22+ in PATH
- (Optional) UPX if you want to compress the binary
- (Optional) ResourceHacker if you want to embed icons/version metadata

Quick build:
  cd dist\windows
  build.bat

This will:
- Read version from the VERSION file (unless you pass a version argument)
- Produce Picocrypt-<version>-windows-amd64.exe in dist\windows

Custom version:
  build.bat v1.50

Optional post steps:
  upx --best --lzma Picocrypt-<version>-windows-amd64.exe

Notes:
- AES-256 and Paranoid modes now selectable via the Cipher combo.
- Paranoid mode remains strongest (ChaCha20+Serpent cascade).
- AES-256 uses CTR with 16-byte IV derived from first 16 bytes of 24-byte nonce.
