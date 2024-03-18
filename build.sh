#!/bin/bash 

command=$1
arg1=$2
rootdir=`pwd`
toolchain=$rootdir/toolchain/bin
uboot_src=$rootdir/uboot-2021.10
kernel_src=$rootdir/linux-5.15.4
buildroot=$rootdir/buildroot

usage () {
    echo "eg:"
    echo "./build.sh u-boot -j4"
    echo "./build.sh kernel -j4"
    echo "./build.sh rootfs -j4"
    echo "./build.sh clean"
}

build_uboot () {
    echo "build_uboot"
    echo "enter $uboot_src"
    cp $uboot_src/configs/sunxi_v3s_nand_deconfig $uboot_src/.config
    cd $uboot_src
    make ARCH=arm CROSS_COMPILE=$toolchain/arm-linux- $arg1
    echo "exit $uboot_src"
    cd $rootdir

}

build_kernel () {
    echo "build_kernel"
    echo "enter $kernel_src"
    cp $kernel_src/arch/arm/configs/sunxi_v3s_nand_deconfig $kernel_src/.config
    cd $kernel_src
    make ARCH=arm  CROSS_COMPILE=$toolchain/arm-linux- $arg1
    make ARCH=arm  CROSS_COMPILE=$toolchain/arm-linux- dtbs
    echo "exit $kernel_src"
    cd $rootdir

}

build_rootfs () {
    echo "build_rootfs"
    # echo "enter $buildroot"
    # cp $uboot_src/configs/sunxi_v3s_nand_deconfig uboot-2021.10/.config
    # cd $buildroot
    # make ARCH=arm CROSS_COMPILE=$toolchain/arm-linux- -j
    # echo "exit $buildroot"
    # cd $rootdir

}

build_driver () {
    echo "build_driver"
}

clean_all () {
    echo "clean uboot"
    cd $uboot_src
    make distclean
    cd $rootdir

    echo "clean kernel"
    cd $kernel_src
    make distclean
    cd $rootdir

    # echo "clean builfroot"
    # cd $buildroot
    # make distclean
    # cd $rootdir
}

case $command in
    (uboot)
        build_uboot
        ;;
    (kernel)
        build_kernel
        ;;
    (rootfs)
        build_rootfs
        ;;
    (driver)
        build_driver
        ;;
    (all)
        build_uboot
        build_kernel
        build_rootfs
        ;;
    (clean)
        clean_all
        ;;
    (*)
        echo "Error command"
        usage
        ;;
esac