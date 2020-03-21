{ stdenv, fetchurl, autoPatchelfHook }:

# I was unable to find an url with a specific version of dbgp-client.
# So whenever the client update, the fetchurl will break.
stdenv.mkDerivation {
  pname = "dbgp-client";
  version = "latest";

  src = fetchurl {
    url = "https://xdebug.org/files/binaries/dbgpClient";
    sha256 = "1kaj0dr4zv3dzmaqsdxr6y129ypikfjm8d6cbr5qljqxb3w02539";
  };

  dontUnpack = true;

  nativeBuildInputs = [ autoPatchelfHook ];

  installPhase = ''
    install -Dm555 $src $out/bin/dbgpClient
  '';
}
