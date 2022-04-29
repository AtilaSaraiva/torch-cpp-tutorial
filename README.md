# Compilação do exemplo básico de Torch C++

Aqui é um exemplo simples do uso da Torch C++, presente no [tutorial do próprio pytorch](https://pytorch.org/tutorials/advanced/cpp_frontend.html) usando o [Nix package manager](https://nixos.org/download.html#nix-install-linux).

## Dependencias

A única dependência é o nix então siga as instruções para instalá-lo [aqui](https://nixos.org/download.html#nix-install-linux).

## Para compilar e executar o código

Para compilar o binário rode
```
git clone https://github.com/AtilaSaraiva/torch-cpp-tutorial.git
cd torch-cpp-tutorial
nix-build
```
e o binário vai estar disponível dentro da pasta ./result/bin.

Para executá-lo rode:
```
./result/bin/dcgan
```

## Gerar ambiente de desenvolvimento

Para obter um ambiente de desenvolvimento com as dependencias presentes como cmake e o libtorch, rode:
```
nix-shell
```
e uma shell nova vai ser criada.



Átila Saraiva Q. Soares
atilasaraiva@gmail.com

