# !/bin/bash
## set camera use space build and link pkg_config_path #############
IPU4_CAMERA_BINS_DIR=$PWD/ipu4-camera-bins/
IPU4_CAMERA_PKGCONFIG_PATH=${IPU4_CAMERA_BINS_DIR}/lib/pkgconfig
export PKG_CONFIG_PATH=${IPU4_CAMERA_PKGCONFIG_PATH}:$DEFAULT_PKG_CONFIG_PATH

customize_pkgconfigpath_buildLink(){
 if [[ ! -f $1 ]]; then echo "file $1 not exsist."; exit 0; fi
    sed -i '/prefix=/ d' $1
    sed -i '/exec_prefix=/ d' $1
    sed -i '/libdir=/ d' $1
    sed -i '/includedir=/ d' $1
    standard="prefix=${IPU4_CAMERA_BINS_DIR}\nexec_prefix=\${prefix}\nlibdir=\${exec_prefix}/lib\nincludedir=\${prefix}/include"
    sed -i "1i${standard}" $1
}

env_buildLink(){
	customize_pkgconfigpath_buildLink ${IPU4_CAMERA_BINS_DIR}/lib/pkgconfig/ia_imaging.pc
	#customize_pkgconfigpath_buildLink ${IPU4_CAMERA_BINS_DIR}/lib/pkgconfig/libgcss.pc
	customize_pkgconfigpath_buildLink ${IPU4_CAMERA_BINS_DIR}/lib/pkgconfig/libipu4.pc
	customize_pkgconfigpath_buildLink ${IPU4_CAMERA_BINS_DIR}/lib/pkgconfig/libiacss.pc
}
echo -e "======set ipu-camera-hal build and link env====="
echo -e "PKG_CONFIG_PATH:${PKG_CONFIG_PATH}"
echo -e "IPU4_CAMERA_BINS_DIR:${IPU4_CAMERA_BINS_DIR}"
echo -e "=================set env succeed==============="
env_buildLink
