{
  username,
  pkgs,
  ...
}: {
  home.packages = with pkgs;
    [
      terraform
    ]
    ++ (with pkgs.terraform-providers; [
      dmacvicar_libvirt
      kreuzwerker_docker
      hashicorp_kubernetes
      hashicorp_helm
      hashicorp_local
      hashicorp_tls
      hashicorp_random
    ]);

  programs.vscode.profiles.${username}.extensions = with pkgs.vscode-extensions; [
    hashicorp.terraform
  ];
}
