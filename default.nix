{ lib, stdenv, ... }:

stdenv.mkDerivation (finalAttrs: {
  pname = "grub-theme";
  version = "0.1";
  src = ./theme;

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/grub/themes/${finalAttrs.pname}

    cp -R . $out/grub/themes/${finalAttrs.pname}

    runHook postInstall
  '';

  meta = {
    homepage = "https://github.com/Aceroph/grub-theme";
    description = "Light & modern GRUB theme";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
  };
})
