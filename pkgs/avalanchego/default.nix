{ lib
  , buildGoModule
  , fetchFromGitHub
  , go_1_22
  , gcc
  , pkg-config
  , blst
}:

  buildGoModule rec {
    pname = "avalanchego";
    version = "1.11.13";

    src = fetchFromGitHub {
      owner = "ava-labs";
      repo = "avalanchego";
      rev = "v${version}";
      hash = "sha256-enSbKqG9QBUnsbkXqBh2tAPmuWGXg7xR9ai9aSlovbM=";
    };

    vendorHash = "sha256-C73uh0MKOE16JbzvFgeFnnibVQoXYlNJ+/DVSZ5rovQ=";

    nativeBuildInputs = [
      go_1_22
      gcc
      pkg-config
    ];

    buildInputs = [
      blst
    ];

    CGO_ENABLED = "1";
    CGO_CFLAGS = "-I${blst}/include";
    CGO_LDFLAGS = "-L${blst}/lib -lblst";

    subPackages = [ "main" ];

    ldflags = [
      "-X github.com/ava-labs/avalanchego/version.GitCommit=${src.rev}"
      "-X github.com/ava-labs/avalanchego/version.Version=${version}"
    ];

    postInstall = ''
      mv $out/bin/main $out/bin/avalanchego
    '';

    meta = with lib; {
      description = "Go implementation of an Avalanche node";
      homepage = "https://github.com/ava-labs/avalanchego";
      license = licenses.bsd3;
      platforms = platforms.linux ++ platforms.darwin;
      mainProgram = "avalanchego";
    };
}
