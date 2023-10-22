# LightThemAll

 Try to switch on all the lights

## To developpers

### Building AppImage for Linux

1. Setup Docker (docker-ce-cli is free) on your Linux Host
2. Go into the root of the project from your terminal
3. Build the base image : `docker build -t light_them_all_build .`
4. Build the AppImage inside a container: `docker run -ti --mount type=bind,source=$(pwd),target=/home/developer/project light_them_all_build bash`
5. Inside the container, run `cd project`
6. Go on with the following command `flutter clean`
7. Now `flutter build linux`
8. Run `appimage-builder --recipe AppImageBuilder.yml`

Your AppImage should have been generated in the root of the project, so you can close the running Docker container (run `exit`).

## Credits

### Images

#### FreePik

Some images have been downloaded from freepik.com
* light_on (and so also light) => https://www.freepik.com/icon/ecology-environment_1730641 (made by Surang)
* light_off => https://www.freepik.com/icon/ecology-environment_1730650 (made by Surang)