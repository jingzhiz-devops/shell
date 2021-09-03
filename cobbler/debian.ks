#### Contents of the preconfiguration file (for &releasename;)
### 预配置文件（适合使用deb软件包格式的linux版本，如debian, ubuntu, linuxmint等）
### 注意不同的linux版本，本文件的部分命令和参数可能不一致，请留意并仔细检查。
# 根据 Debian 官方英文版文件翻译而成，用户可根据实际情况选择性参考使用
 
# 本文中以 d-i 或 tasksel 开头的行即为有效命令行
# 以英文#号开头的行为注释行，仅用作解释说明，与删除这一行的效果相同。
# Careone, <zzbusagain@yahoo.com.cn>, China, 2009
 
### Localization
# 本地化设置
# Locale sets language and country.
# 本地化是指语言和国家地区
# 官方默认为en_US,即美国英语
# 这里我设为中国，简体中文： zh_CN
# 台湾，繁体中文应设为： zh_TW
#d-i debian-installer/locale string en_US
d-i debian-installer/locale string zh_CN
 
# Keyboard selection.
#d-i console-tools/archs select at
d-i console-keymaps-at/keymap select us
# 键盘布局设为美国英语。中国大陆用户保留原值us（美国英语）即可，不用改
 
# Example for a different keyboard architecture
#d-i console-keymaps-usb/keymap select mac-usb-us
# 如果使用的是苹果Mac电脑的USB键盘，则键盘布局请改为mac-usb-us
 
### Network configuration
# netcfg will choose an interface that has link if possible. This makes it
# skip displaying a list if there is more than one interface.
d-i netcfg/choose_interface select auto
# 网络，这里设为自动。不必更改。
 
# To pick a particular interface instead:
#d-i netcfg/choose_interface select eth1
# 网卡选择。不改动
 
# If you have a slow dhcp server and the installer times out waiting for
# it, this might be useful.
#d-i netcfg/dhcp_timeout string 60
# 网络dhcp延时。不改动
 
# If you prefer to configure the network manually, uncomment this line and
# the static network configuration below.
#d-i netcfg/disable_dhcp boolean true
# 是否禁用网络dhcp延时。不改动
 
# If you want the preconfiguration file to work on systems both with and
# without a dhcp server, uncomment these lines and the static network
# configuration below.
#d-i netcfg/dhcp_failed note
# 网络DNCP失败后的动作。不改动
#d-i netcfg/dhcp_options select Configure network manually
# 网络DNCP其它参数。不改动
 
# Static network configuration.
#d-i netcfg/get_nameservers string 192.168.1.1
#d-i netcfg/get_ipaddress string 192.168.1.42
#d-i netcfg/get_netmask string 255.255.255.0
#d-i netcfg/get_gateway string 192.168.1.1
#d-i netcfg/confirm_static boolean true
# 静态IP时的主机，IP，子网掩码，网关，是否开启静态IP。不改动
 
# Any hostname and domain names assigned from dhcp take precedence over
# values set here. However, setting the values still prevents the questions
# from being shown, even if values come from dhcp.
d-i netcfg/get_hostname string unassigned-hostname
d-i netcfg/get_domain string unassigned-domain
# dncp域名服务器的设置
#
# Disable that annoying WEP key dialog.
d-i netcfg/wireless_wep string
# The wacky dhcp hostname that some ISPs use as a password of sorts.
#d-i netcfg/dhcp_hostname string radish
# 无线网络的设置
#
# If non-free firmware is needed for the network or other hardware, you can
# configure the installer to always try to load it, without prompting. Or
# change to false to disable asking.
#d-i hw-detect/load_firmware boolean true
# 如果需要为网络或其它硬件来配置非自由的固件，可以在这里设置让安装器进行加载，安装时不再提示。
# 或者把值设为false来关闭提示
#
### Mirror settings
### 镜像站点设置
 
# If you select ftp, the mirror/country string does not need to be set.
# 如果选择ftp站点，那么mirror/country一行可以不写
 
##d-i mirror/protocol string ftp
#d-i mirror/country string manual
#d-i mirror/http/hostname string http.us.debian.org
#d-i mirror/http/directory string /debian
#d-i mirror/http/proxy string
# 以上是官方原始设置, 仅供参考。
 
#d-i mirror/protocol string ftp
# 如果是ftp源, 请把行首的#号去掉
 
#d-i mirror/country string manual
d-i mirror/country string China
# 镜像位置所在国家区域选择，原始设置为manual(手动选择)，我改成了China(中国)
 
d-i mirror/http/hostname string mirrors.163.com
# 我改成了中国网易的源 http://mirrors.163.com
 
d-i mirror/http/directory string /ubuntu/dists
# 这里针对Ubuntu 8.04 hardy版本，填写了对应路径
# 即 http://mirrors.163.com/ubuntu/dists 为实际位置
 
d-i mirror/http/proxy string
# 代理服务器设置。
 
# Suite to install.
# 安装的软件包集
 
#d-i mirror/suite string testing
# 选择了testing(测试版)软件包集。这是针对debian版本的。debian版本下有以下几种选项：
# stable(稳定版)，oldstable(旧的稳定版)， testing(测试版)， unstable(不稳定版)，experimental(实验版)；
# debian软件包setion 有以下几中分组：main（主要），contrib（贡献的），non-free(非自由)
 
# ubuntu 下的软件包分类是main（主要），restricted（受限软件），multiverse（社区制作）,universe（通用）
 
# Suite to use for loading installer components (optional).
#d-i mirror/udeb/suite string testing
# 选择了适合debian的testing(测试版)
 
### Clock and time zone setup
# Controls whether or not the hardware clock is set to UTC.
d-i clock-setup/utc boolean false
# 时间、日期和时区设置。硬件时钟设为与UTC全球标准时间同步。默认值为 true，
# 建议改为false, 否则安装完成后你会发现时间差了好几个小时。
 
# You may set this to any valid setting for $TZ; see the contents of
# /usr/share/zoneinfo/ for valid values.
#d-i time/zone string US/Eastern
d-i time/zone string Asia/Shanghai
# 时区设置。可以指定一个有效的$TZ时区变量值。各国家地区的$TZ时区变量值可参考
# /usr/share/zoneinfo/ 下的相应文件。默认值为US/Eastern （美国/东部）
# 中国大陆为Asia/Shanghai
# 香港为Asia/Hong_Kong
# 澳门为Asia/Macau
# 台湾为Asia/Taipei
 
# Controls whether to use NTP to set the clock during the install
d-i clock-setup/ntp boolean true
# 是否使用NTP网络时间协议（用于同步和统一网络上众多计算机的时间）。
# 这里是true（启用）。不必更改
 
# NTP server to use. The default is almost always fine here.
#d-i clock-setup/ntp-server string ntp.example.com
# 自己指定NTP网络时间协议所参照的服务器。不用动，保留本行不变
 
### Partitioning
### 磁盘分区
#强烈建议不要改动，否则可能弄丢你磁盘上的所有数据！！！
 
# If the system has free space you can choose to only partition that space.
#d-i partman-auto/init_automatically_partition select biggest_free
# 如果磁盘上有空闲空间，可以直把全部空间分为一个分区
 
# Alternatively, you can specify a disk to partition. The device name must
# be given in traditional non-devfs format.
# 另外，你也可以对某个磁盘进行分区。注意填写时，设备名必须是传统的非devfs格式
 
# Note: A disk must be specified, unless the system has only one disk.
# 注意：如果电脑上有多个磁盘，必须指定磁盘名
 
# For example, to use the first SCSI/SATA hard disk:
#d-i partman-auto/disk string /dev/sda
# 比如使用第一个SCSI/SATA硬盘，设备名就是/dev/sda
 
# In addition, you'll need to specify the method to use.
# The presently available methods are: "regular", "lvm" and "crypto"
d-i partman-auto/method string lvm
# 还有，你需要指定磁盘的使用方式，是regular（常规）, lvm（虚拟磁盘阵列），或者crypto（加密）
 
# If one of the disks that are going to be automatically partitioned
# contains an old LVM configuration, the user will normally receive a
# warning. This can be preseeded away...
# 如果在执行自动分区时，系统检测到某个磁盘内有残余的LVM配置文件，安装程序会弹出警告。
# 这种情况，也可以在本文件中提前设定好处理方法
 
d-i partman-lvm/device_remove_lvm boolean true
# 如果有检测到磁盘上有旧的lvm虚拟磁盘阵列配置文件存在，仍然删除该磁盘分区
 
# The same applies to pre-existing software RAID array:
d-i partman-md/device_remove_md boolean true
# 与上面类似，如果检测到磁盘上有旧的RAID磁盘阵列的配置文件存在，仍然删除该磁盘分区
 
# And the same goes for the confirmation to write the lvm partitions.
d-i partman-lvm/confirm boolean true
# 再次确认磁盘以lvm方式使用 
 
# You can choose one of the three predefined partitioning recipes:
# - atomic: all files in one partition
# - home:   separate /home partition
# - multi:  separate /home, /usr, /var, and /tmp partitions
d-i partman-auto/choose_recipe select atomic
# 你可以选择下面3种选择中的任1种来作为磁盘分区技巧：
# atomic：   所有文件全放在一个分区（默认值）    
# home:     划分独立的/home分区    （我个人推荐这种，万一重装linux，自己个人目录下的文件还在）
# multi:    划分独立的/home, /usr, /var, 和/tmp分区
#       如果你是linux高手，并且硬盘空间足够大，可以选择multi方式。
 
# Or provide a recipe of your own...
# 或者你自己想怎么分就怎么分区吧
 
# The recipe format is documented in the file devel/partman-auto-recipe.txt.
# 有关安装时自动分区的详细说明，可以查看devel/partman-auto-recipe.txt文件
 
# If you have a way to get a recipe file into the d-i environment, you can
# just point at it.
#d-i partman-auto/expert_recipe_file string /hd-media/recipe
# 如果你手上有一个现成的适用于d-i程序进行自动分区的标准文件，也可以直接指定这个文件
# 如上面所示的，这个文件就是/hd-media/recipe
 
# If not, you can put an entire recipe into the preconfiguration file in one
# (logical) line. This example creates a small /boot partition, suitable
# swap, and uses the rest of the space for the root partition:
# 如果没有这类自动分区的标准文件，你应该把分区方案放在本配置文件中，
# 跟在d-i后面当参数输入，注意要一行写完，不要换行。
# 下面这个范例新建了一个很小的/boot启动分区，大小合理的swap交换文件分区，剩下的空间全部作为/根分区
# (swap相当于windows下的虚拟内存和页面文件）
 
#d-i partman-auto/expert_recipe string                         \
#      boot-root ::                                            \
#              40 50 100 ext3                                  \
#                      $primary{ } $bootable{ }                \
#                      method{ format } format{ }              \
#                      use_filesystem{ } filesystem{ ext3 }    \
#                      mountpoint{ /boot }                     \
#              .                                               \
#              500 10000 1000000000 ext3                       \
#                      method{ format } format{ }              \
#                      use_filesystem{ } filesystem{ ext3 }    \
#                      mountpoint{ / }                         \
#              .                                               \
#              64 512 300% linux-swap                          \
#                      method{ swap } format{ }                \
#              .
 
# This makes partman automatically partition without confirmation, provided
# that you told it what to do using one of the methods above.
# 下面的操作执行自动分区而不再提示，当然前提是你把该回答的都写到位了
 
d-i partman/confirm_write_new_label boolean true
# 确定要写入新卷标？已确定
 
d-i partman/choose_partition select finish
# 选择分区？ 已选好，完毕
 
d-i partman/confirm boolean true
# 确认吗？确认！
 
### Base system installation
### 基本系统安装
 
# Select the initramfs generator used to generate the initrd for 2.6 kernels.
#d-i base-installer/kernel/linux/initramfs-generators string yaird
# 使用initramfs生成器来自动生成针对2.6内核的initrd文件
 
# The kernel image (meta) package to be installed; "none" can be used if no
# kernel is to be installed.
#d-i base-installer/kernel/image string linux-image-2.6-486
# 指定需要安装的kernel内核镜像文件，如linux-image-2.6-486。如果没有指定内核kernel文件，
# 可以在相应位置写上 none (即无的意思）
 
### Account setup
### 账户设置
 
# Skip creation of a root account (normal user account will be able to
# use sudo).
#d-i passwd/root-login boolean false
# 跳过新建超级用户root.（普通用户可以用sudo命令来获取root超级用户的权限）
 
# Alternatively, to skip creation of a normal user account.
#d-i passwd/make-user boolean false
# 还可以跳过新建普通用户这一步
 
# Root password, either in clear text
# 超级用户root的密码，可以是明文，或者是md5加密后的密文，2种当中只能选1种
d-i passwd/root-password password root1234
 
# 上面假设root用户的密码设为 root1234 ,
# 如果你想省事，可以把上一行行首的"#"删除，并改成你希望的密码,
# 这样安装好后root用户的密码就是你预先设定的值
 
d-i passwd/root-password-again password root1234
# 第二次输入密码，以防密码输入错误。同样需要把行首#号删除后才能生效。
# 注意一定要和上面第一次输入的密码相同。
 
# or encrypted using an MD5 hash.
#d-i passwd/root-password-crypted password [MD5 hash]
#d-i passwd/root-password-crypted password $1$uvh20/$kUIdD2Jdu5JerGZHJPcvZ0
# 或者使用md5加密后的密文，上面输入的md5密文是 $1$uvh20/$kUIdD2Jdu5JerGZHJPcvZ0 ，明文即root1234
 
# 说两个生成md5加密密文的小技巧：
# 1.1 在linux终端或命令行下运行grub（普通用户就行），然后输入md5crypt 提示后输入你想加密的密码，回车后即可
#   得到的即为密文。再在终端中用鼠标选中密文。按Ctrl+Alt+C复制，然后可粘贴到记事本或其它位置。
#   在终端下的复制快捷键要多按一个Alt键。 注意同一密码，每次加密得到的密文都是不一样，不要感到意外。
# 1.2 在grub4dos或WinGrub中，操作与上面相似，请自行验证。
 
# To create a normal user account.
#d-i passwd/user-fullname string Debian User
d-i passwd/user-fullname string user password user1234
d-i passwd/username string user
# 新建一个叫全名叫 用户名user密码user1234,登陆名叫user的普通权限的用户，
 
# Normal user's password, either in clear text
d-i passwd/user-password password user1234
# 这个普通用户的密码设为user1234。注意密码前后不要有多余的空格键，否则可能报错密码不符
 
d-i passwd/user-password-again password user1234
# 第二次输入密码user1234 。一定要和上面第一次的密码相同。
 
# or encrypted using an MD5 hash.
#d-i passwd/user-password-crypted password [MD5 hash]
#d-i passwd/user-password-crypted password $1$7tg20/$hnbObW86VeE20WNC8dkqo/
# md5加密后的密码。密文是$1$7tg20/$hnbObW86VeE20WNC8dkqo/ ，明文也是user1234
 
# Create the first user with the specified UID instead of the default.
#d-i passwd/user-uid string 1010
# 指定ID为1010的用户为默认用户
 
# The user account will be added to some standard initial groups. To
# override that, use this.
#d-i passwd/user-default-groups string audio cdrom video
# 把普通用户user加入audio, cdrom, video组，这样普通用户就才可以听歌，使用光驱，看电影等
 
### Apt setup
# You can choose to install non-free and contrib software.
# apt软件包设置
 
#d-i apt-setup/non-free boolean true
# 启用非自由（non-free）分组中的软件。true表示启用，false表示禁止。这里是true启用
 
#d-i apt-setup/contrib boolean true
# 启用contrib分组中的软件，适合DEBIAN版本
 
# Uncomment this if you don't want to use a network mirror.
#如果你不打算使用网络镜像，请去掉行首的#号
 
#d-i apt-setup/use_mirror boolean false
# 禁用网络镜像站点。false表示禁用，true表示启用 
 
# Select which update services to use; define the mirrors to be used.
# Values shown below are the normal defaults.
# 选择软件更新所用的网络镜像站点
 
#d-i apt-setup/services-select multiselect security, volatile
# 软件更新方式的选择，可多选。这是选择了两种级别：security(安全级)，volatile(不稳定版）
# 注意linux下所说的不稳定版的软件，是相于作为网络服务器来说算不稳定版，
# 但对于普通家用电脑来说，稳定性还是比较可靠的。
# linux下软件稳定性能按以下排序：
# stable(稳定版) > testing（测试版） > unstable（不稳定版）
# 普通家用电脑使用unstable（不稳定版）的软件一般也没有太大问题。
 
#d-i apt-setup/security_host string security.debian.org
#d-i apt-setup/volatile_host string volatile.debian.org
# 以上两个镜像网址是 security.debian.org和volatile.debian.org，
# 都属于中国大陆以外的 debian 服务器，对国内网友来说，网速较慢
# 下面是一个 Ubuntu 官方安全补丁下载源：
#d-i apt-setup/security_host string security.ubuntu.com
 
 
# Additional repositories, local[0-9] available
# 附加软件库源
 
#d-i apt-setup/local0/repository string \
#       http://local.server/debian stable main
# 设置软件下载网址，产品代码，软件包种类等
 
#d-i apt-setup/local0/comment string local server
 
# Enable deb-src lines
d-i apt-setup/local0/source boolean true
# 允许下载源码包格式的软件
 
# URL to the public key of the local repository; you must provide a key or
# apt will complain about the unauthenticated repository and so the
# sources.list line will be left commented out
#d-i apt-setup/local0/key string http://local.server/key
# 设定本地软件库。对于未认证的软件库源，需要提供有效的公用签名密匙文件下载地址
# （公用签名密匙用于验证软件包可靠性和未被非法更改)
# 如有必要，请按实际位置填写
 
# By default the installer requires that repositories be authenticated
# using a known gpg key. This setting can be used to disable that
# authentication. Warning: Insecure, not recommended.
#d-i debian-installer/allow_unauthenticated string true
 
### Package selection
### 软件包选择
 
#tasksel tasksel/first multiselect standard, web-server
# 选中多个组件： standard（标准）, web-server（网页服务器）
 
# If the desktop task is selected, install the kde and xfce desktops
# instead of the default gnome desktop.
#tasksel tasksel/desktop multiselect kde, xfce
# 如果选择的是桌面环境，也可以同时选择kde 和 xfce桌面环境
 
# Individual additional packages to install
#d-i pkgsel/include string openssh-server build-essential
# 安装附加软件包openssh-server 和 build-essential
 
# Whether to upgrade packages after debootstrap.
# Allowed values: none, safe-upgrade, full-upgrade
#d-i pkgsel/upgrade select 
# 安装后是否升级软件。有3种选择：
# none（不升级）, safe-upgrade（只更新安全补丁）, full-upgrade（全部升级）
 
# Some versions of the installer can report back on what software you have
# installed, and what software you use. The default is not to report back,
# but sending reports helps the project determine what software is most
# popular and include it on CDs.
popularity-contest popularity-contest/participate boolean false
# 发送软件包安装清单。这是方便工程师统计哪些软件流行。建议保留为false (不发送)
 
### Boot loader installation
### 多操作系统启动管理器安装
# Grub is the default boot loader (for x86). If you want lilo installed
# instead, uncomment this:
#d-i grub-installer/skip boolean true
# 默认使用Grub. 如果你想用老式的lilo来代替grub, 请去掉行首的#号
# 强烈推荐使用默认的grub. 保留原样不要改动！
 
# To also skip installing lilo, and install no bootloader, uncomment this
# too:
#d-i lilo-installer/skip boolean true
# 跳过lilo安装程序。目前除了部分服务器版本的linux仍保留lilo外，
# 其它linux版本基本上已淘汰lilo软件包, 这1项也不用管了。
 
# This is fairly safe to set, it makes grub install automatically to the MBR
# if no other operating system is detected on the machine.
d-i grub-installer/only_debian boolean true
# 安装Grub到主引导纪录（MBR）,用来启动linux
 
# This one makes grub-installer install to the MBR if it also finds some other
# OS, which is less safe as it might not be able to boot that other OS.
d-i grub-installer/with_other_os boolean true
# 如果已安装其它操作系统，则保留原有的其它操作系统，如Windows。不要改 
 
# Alternatively, if you want to install to a location other than the mbr,
# uncomment and edit these lines:
#d-i grub-installer/only_debian boolean false
#d-i grub-installer/with_other_os boolean false
#d-i grub-installer/bootdev  string (hd0,0)
# 如果你想把Grub安装在主引导记录（即MBR）以外其它地方，请去掉这几行行首的#号，并对安装位置做相应更改
# 新手千万不要改动！很可能你改后系统就无法启动了。
 
# To install grub to multiple disks:
#d-i grub-installer/bootdev  string (hd0,0) (hd1,0) (hd2,0)
# 把Grub启动引导程序同时安装在第1，2，3个硬盘的主引导记录的操作：
# (hd0,0) 第一硬盘的主引导记录。第一硬盘又称第一主盘。
# (hd1,0) 第二硬盘的主引导记录。第二硬盘又称第一从盘。
# (hd2,0) 第三硬盘的主引导记录。第三硬盘又称第二主盘。
 
 
# Optional password for grub, either in clear text
# Grub也可设置启动密码。同样也可以选择加密后密码
 
#d-i grub-installer/password password root1234
# Grub密码为root1234
 
#d-i grub-installer/password-again password root1234
# 再次输入Grub密码root1234， 防止输入错误或前后密码不相同
 
# or encrypted using an MD5 hash, see grub-md5-crypt(8).
#d-i grub-installer/password-crypted password [MD5 hash]
#d-i grub-installer/password-crypted password [MD5 hash]
# 加密后的grub密码。密文为，明文为
 
### Finishing up the installation
### 完成安装
 
# During installations from serial console, the regular virtual consoles
# (VT1-VT6) are normally disabled in /etc/inittab. Uncomment the next
# line to prevent this.
#d-i finish-install/keep-consoles boolean true
# 安装过程中虚拟控制台1－6并没有禁用（配置文件为/etc/inittab）。
# 可以按Ctrl+Alt+F1--F6在6个控制台之间切换。
# 如果你想取消虚拟控制台，请去掉前面的#号。推荐保留原样不改动。
 
# Avoid that last message about the install being complete.
d-i finish-install/reboot_in_progress note
# 安装快结束时给出提示。不用改
 
# This will prevent the installer from ejecting the CD during the reboot,
# which is useful in some situations.
#d-i cdrom-detect/eject boolean false
# 安装完成后不弹出光驱。行首带#号则代表弹出光驱（推荐）
 
# This is how to make the installer shutdown when finished, but not
# reboot into the installed system.
#d-i debian-installer/exit/halt boolean true
# 安装完成后，是直接关机，还是重启动。这里true代表关机（一般不希望这样）。
# 保留行首的#号，则表示此行失效。推荐保留行首的#号。
 
# This will power off the machine instead of just halting it.
#d-i debian-installer/exit/poweroff boolean true
# 如果选择关机而不是重启，则关机后直接自动关闭电源，不需要手动按机箱上电源按钮。不用改。
 
### Preseeding other packages
# Depending on what software you choose to install, or if things go wrong
# during the installation process, it's possible that other questions may
# be asked. You can preseed those too, of course. To get a list of every
# possible question that could be asked during an install, do an
# installation, and then run these commands:
#   debconf-get-selections --installer > file
#   debconf-get-selections >> file
# 预安装的软件包
 
#### Advanced options
# 高级选项
### Running custom commands during the installation
# d-i preseeding is inherently not secure. Nothing in the installer checks
# for attempts at buffer overflows or other exploits of the values of a
# preconfiguration file like this one. Only use preconfiguration files from
# trusted locations! To drive that home, and because it's generally useful,
# here's a way to run any shell command you'd like inside the installer,
# automatically.
# 预安装操作其实并不保险。安装程序不会检查配置文件是否正确，或可能出现其它意想不到的情况。
# 请使用可靠和正确的配置文件（即指本文件）。
# 这里可在安装时预先运行某些命令，来起到特殊作用。
 
# This first command is run as early as possible, just after
# preseeding is read.
#d-i preseed/early_command string anna-install some-udeb
# 安装程序预先安装anna-install 和 some-udeb 这两个软件包
 
# This command is run just before the install finishes, but when there is
# still a usable /target directory. You can chroot to /target and use it
# directly, or use the apt-install and in-target commands to easily install
# packages and run commands in the target system.
#d-i preseed/late_command string apt-install zsh; in-target chsh -s /bin/zsh
# 本命令在安装快要结束时执行，直到系统存在一个有效的/根目录。你可以用chroot命令改变根目录到指定位置，
# 或者是在你指定的目的位置使用apt-install 和 in-target命令来执行简单的软件安装和其它命令
 
# 翻译完毕。
# 不同的linux版本（如Debian, Ubuntu, LinuxMint等），
# 不同的版本号，配置命令和参数可能有差异或变动，请自行验证. linux新手修改前更应慎重！
# 如有错误或不妥，请E-mail至Careone <carezero@qq.com>
# 2009.4.27
# 2010-6-18 修正1处"firmware"翻译错误(误译为防火墙)