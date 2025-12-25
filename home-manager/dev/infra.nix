{pkgs, ...}: {
  home.packages = with pkgs; [
    minikube

    kubectl
    kubernetes-helm

    jetbrains.datagrip
  ];
}
