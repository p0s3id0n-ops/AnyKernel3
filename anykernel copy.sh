### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers
# Không tự điều chỉnh nếu không muốn Hard Brick! Hãy chắc chắn rằng bạn biết mình đang làm gì!

### AnyKernel setup
# global properties
properties() { '
kernel.string=KernelSU By KernelSU Developers || by p0s3id0n
do.devicecheck=0
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


### AnyKernel install
## boot shell variables
block=boot
is_slot_device=auto
ramdisk_compression=auto
patch_vbmeta_flag=auto
no_magisk_check=1

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/flash-core.sh

kernel_version=$(cat /proc/version | awk -F '-' '{print $1}' | awk '{print $3}')
case $kernel_version in
    5.1*) ksu_supported=true ;;
    6.1*) ksu_supported=true ;;
    6.6*) ksu_supported=true ;;
    *) ksu_supported=false ;;
esac

ui_print " "
ui_print "$(echo 'S2VybmVsX2J1aWxkZXIgOiBAcDBzM2lkMG4=' | base64 -d)"
ui_print " "
ui_print "$(echo 'TmdoacOqbSBj4bqlbSBt4buNaSBow6BuaCB2aSBz4butYSDEkeG7lWkgaG/hurdjIGLDoW4gbOG6oWkgdHLDoWkgcGjDqXAgdsOgIHPhur0gYuG7iyB0cnV5IHThu5Eu' | base64 -d)"
ui_print "$(echo 'Tm8gdW5hdXRob3JpemVkIG1vZGlmaWNhdGlvbiBvciByZXNhbGUgYWxsb3dlZC4gVmlvbGF0b3JzIHdpbGwgYmUgcHJvc2VjdXRlZC4=' | base64 -d)"
ui_print " "
ui_print "$(echo 'VGVsZWdyYW06IEBwMHMzaWQwbjY4Ng==' | base64 -d)"
ui_print "$(echo 'Sm9pbiBPdXIgVGVsZWdyYW0gR3JvdXAhIDogdC5tZS9wc2Rfa2VybmVs==' | base64 -d)"
ui_print " " "  -> ksu_supported: $ksu_supported"
$ksu_supported || abort "  -> Non-GKI device, abort."

# boot install
split_boot
if [ -f "split_img/ramdisk.cpio" ]; then
    unpack_ramdisk
    write_boot
else
    flash_boot
fi
## end boot install
