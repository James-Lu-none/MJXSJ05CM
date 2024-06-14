#!/bin/sh
chip=ssc323
variant=lite

uboot=u-boot-$chip-nor.bin
uImage=uImage.$chip
rootfs=rootfs.squashfs.$chip

release=openipc-$chip-nor-$variant.bin

dd if=/dev/zero bs=1K count=5000 status=none | tr '\000' '\377' > $release
dd if=output/images/$uboot of=$release bs=1K seek=0 conv=notrunc status=none
dd if=output/images/$uImage of=$release bs=1K seek=320 conv=notrunc status=none
dd if=output/images/$rootfs of=$release bs=1K seek=2368 conv=notrunc status=none

echo "Created: $release"
