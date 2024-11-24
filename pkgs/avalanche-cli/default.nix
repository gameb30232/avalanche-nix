{ lib
, buildGoModule
, fetchFromGitHub
, go_1_22  # Add Go 1.22 dependency
}:

buildGoModule rec {
  pname = "avalanche-cli";
  version = "1.7.7";

  # Use Go 1.22 since Go 1.23 restricts access to runtime.stopTheWorld via go:linkname
  # which breaks the github.com/fjl/memsize dependency used by avalanche-cli
  go = go_1_22;

  src = fetchFromGitHub {
    owner = "ava-labs";
    repo = "avalanche-cli";
    rev = "v${version}";
    hash = "sha256-9n1TchgVnrNgJzeKws54eLelcDM9rNFK0nFFdTXweLY=";
  };

  vendorHash = "sha256-r5dDhL0MfsfDQOCNMgN93IIoD7e20GOQdechcx35kU8=";

  nativeBuildInputs = [ go_1_22 ];

  proxyVendor = true;
  modVendor = true;
  subPackages = [ "." ];

  buildFlags = [ "-tags=noslow,nomemsize" ];
  ldflags = [
    "-X main.version=${version}"
    "-checklinkname=0"
  ];

  CGO_ENABLED = "1";

  meta = with lib; {
    description = "Official CLI for Avalanche APIs";
    homepage = "https://github.com/ava-labs/avalanche-cli";
    license = licenses.bsd3;
    maintainers = [ ];
    platforms = platforms.unix;
  };
}
