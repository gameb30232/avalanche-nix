{ lib
, buildGoModule
, fetchFromGitHub
, go_1_22
}:

buildGoModule rec {
  pname = "subnet-evm";
  version = "0.6.12";

  src = fetchFromGitHub {
    owner = "ava-labs";
    repo = "subnet-evm";
    rev = "v${version}";
    hash = "sha256-svrUWq4WHwG7C4BrAzrKB3JhmolDtiFaB821s/hWszg=";
  };

  vendorHash = "sha256-lCRPVR13zeVKJzURUCJ/2vnbOp2FH+qu3QzdbOd7B+k=";

  nativeBuildInputs = [ go_1_22 ];

  proxyVendor = true;
  modVendor = true;

  subPackages = [ "." ];
  doCheck = false;

  ldflags = [
    "-X github.com/ava-labs/subnet-evm/plugin/evm.Version=${version}"
  ];

  meta = with lib; {
    description = "Subnet EVM implementation for Avalanche networks";
    homepage = "https://github.com/ava-labs/subnet-evm";
    license = licenses.bsd3;
    maintainers = [ ];
    platforms = platforms.unix;
  };
}
