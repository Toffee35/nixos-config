{
  username,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    (terraform.withPlugins
      (p: [
        p.libvirt
        p.docker
        p.kubernetes
        p.helm
        p.local
        p.tls
        p.random
      ]))
  ];

  programs.vscode.profiles.${username}.extensions = with pkgs.vscode-extensions; [
    hashicorp.terraform
  ];
}
