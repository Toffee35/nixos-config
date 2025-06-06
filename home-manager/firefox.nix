{
  pkgs,
  username,
  firefox-addons,
  system,
  ...
}: let
  nixSearchParams = [
    {
      name = "query";
      value = "{searchTerms}";
    }
  ];

  nixosSearchParams = [
    {
      name = "channel";
      value = "unstable";
    }

    {
      name = "from";
      value = "0";
    }

    {
      name = "size";
      value = "50";
    }

    {
      name = "sort";
      value = "relevance";
    }
  ];

  buildFirefoxXpiAddon = {
    pname,
    version,
    addonId,
    url,
    sha256,
  }:
    pkgs.stdenv.mkDerivation {
      name = "${pname}-${version}";

      src = pkgs.fetchurl {inherit url sha256;};

      preferLocalBuild = true;
      allowSubstitutes = true;

      passthru = {inherit addonId;};

      buildCommand = ''
        dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
        mkdir -p "$dst"
        install -v -m644 "$src" "$dst/${addonId}.xpi"
      '';
    };
in {
  programs.firefox = {
    enable = true;

    profiles.${username} = {
      id = 0;
      isDefault = true;

      settings = {
        "extensions.autoDisableScopes" = 0;
      };

      bookmarks = {
        force = true;

        settings = [];
      };

      extensions = {
        packages =
          (with firefox-addons.packages.${system}; [
            darkreader
            sponsorblock
            ublock-origin
            adaptive-tab-bar-colour
            translate-web-pages
            sidebery
            privacy-badger
            tabliss
            auto-tab-discard
          ])
          ++ [
            (buildFirefoxXpiAddon (let
              version = "0.2.5";
            in {
              pname = "youtube_repeat_button";
              inherit version;

              addonId = "{28c18e92-ab27-403f-973d-49d1d0fa7665}";

              url = "https://addons.mozilla.org/firefox/downloads/file/4324915/youtube_repeat_button-${version}.xpi";
              sha256 = "sha256-IkItSOv16Lazo/XAZehrs1KI9PtUH2hUdQpBuLxnW4g=";
            }))

            (buildFirefoxXpiAddon (let
              version = "1.5";
            in {
              pname = "adless_spotify";
              inherit version;

              addonId = "{62e31096-34e6-4503-8806-3d7a6004a1f4}";

              url = "https://addons.mozilla.org/firefox/downloads/file/4098050/adless_spotify-${version}.xpi";
              sha256 = "sha256-U+bQndQkg0NDIfRmSAwu3rbD6Cx+GrC/I43uPs+CMRQ=";
            }))
          ];
      };

      search = {
        privateDefault = "google";

        order = [
          "Nix Packages"
          "Nix Options"
          "HomeM Options"
        ];

        engines = {
          "Nix Packages" = {
            definedAliases = ["@np"];

            urls = [
              {
                template = "https://search.nixos.org/packages";
                params =
                  nixSearchParams
                  ++ nixosSearchParams
                  ++ [
                    {
                      name = "sort";
                      value = "relevance";
                    }
                  ];
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          };

          "Nix Options" = {
            definedAliases = ["@no"];

            urls = [
              {
                template = "https://search.nixos.org/options";
                params =
                  nixSearchParams
                  ++ nixosSearchParams
                  ++ [
                    {
                      name = "sort";
                      value = "alpha_asc";
                    }
                  ];
              }
            ];
          };

          "HomeM Options" = {
            definedAliases = ["@hmo"];

            urls = [
              {
                template = "https://home-manager-options.extranix.com";
                params = nixSearchParams;
              }
            ];
          };

          google.metaData.hidden = true;
          bing.metaData.hidden = true;
          ddg.metaData.hidden = true;
          wikipedia.metaData.hidden = true;
        };
      };
    };
  };
}
