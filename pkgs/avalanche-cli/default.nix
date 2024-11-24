{ lib
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  pname = "avalanche-cli";
  version = "1.7.7";

  src = fetchFromGitHub {
    owner = "ava-labs";
    repo = "avalanche-cli";
    rev = "v${version}";
    hash = "sha256-9n1TchgVnrNgJzeKws54eLelcDM9rNFK0nFFdTXweLY=";
  };

  vendorHash = "sha256-r5dDhL0MfsfDQOCNMgN93IIoD7e20GOQdechcx35kU8=";

  proxyVendor = true;
  modVendor = true;
  subPackages = [ "." ];

  meta = with lib; {
    description = "Official CLI for Avalanche APIs";
    homepage = "https://github.com/ava-labs/avalanche-cli";
    license = licenses.bsd3;
    maintainers = [ ];
    platforms = platforms.unix;
  };
}
