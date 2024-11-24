{ lib
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  pname = "avalanche-cli";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "ava-labs";
    repo = "avalanche-cli";
    rev = "v${version}";
    sha256 = "sha256-XXXXXX";
  };

  vendorSha256 = "sha256-XXXXXX";

  meta = with lib; {
    description = "Official CLI for Avalanche APIs";
    homepage = "https://github.com/ava-labs/avalanche-cli";
    license = licenses.bsd3;
    maintainers = [ "Amar Singh" ];
    platforms = platforms.unix;
  };
}
