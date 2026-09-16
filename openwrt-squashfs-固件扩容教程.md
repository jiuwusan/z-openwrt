opkg update
# apk update
opkg install fdisk resize2fs blkid
# apk add fdisk resize2fs blkid
fdisk -l
fdisk  /dev/sda
# 依次 
p
d
2
n
2
33280
N
w

blkid
vi /boot/grub/grub.cfg
#把里面的2个uuid都改成，sda2的PARTUUID
7acb86f2-6858-43f5-8d24-39329175f72c

# 重启 后执行
resize2fs -f /dev/loop0

# 再次重启