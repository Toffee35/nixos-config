{
  username,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    terraform.withPlugins
    (prov: [
      prov.libvirt
      prov.docker
      prov.kubernetes
      prov.helm
      prov.local
      prov.tls
      prov.random
    ])
  ];

  programs.vscode.profiles.${username}.extensions = with pkgs.vscode-extensions; [
    hashicorp.terraform
  ];
}
