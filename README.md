I'm encountering a case-insensitivity issue that only manifests when running yarn
    * on a Mac
    * inside a container
    * on a bind-mounted volume from the host

Here are steps to reproduce:

1. Be on a Mac
    ```sh
    $ uname
    Darwin
    ```
2. Have docker
    ```sh
    $ docker -v
    Docker version 18.09.1, build 4c52b90
    ```
3. Be in this root of this repository.
4. Clear the node modules, build a docker image with yarn installed, then run yarn inside the image with the PWD as a bind-mounted volume.
    ```sh
    $ rm -rf node_modules && docker build . -t yarnfail && docker run -v ${PWD}:/app -it yarnfail /yarn-v1.13.0/bin/yarn install
    ```
5. Observe an error
    ```
    error An unexpected error occurred: "EEXIST: file already exists, mkdir '/app/node_modules/typescript/lib/zh-cn'".
    ```
6. Observe the state of the filesystem:
    ```
    $ ls node_modules/typescript/lib
    cs  es  it  ko  pt-BR   tr  zh-tw
    de  fr  ja  pl  ru  zh-CN
    ```
