# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2013-1348.nasl 6558 2017-07-06 11:56:55Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@solinor.com> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.com
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
if(description)
 {
script_oid("1.3.6.1.4.1.25623.1.0.123561");
script_version("$Revision: 6558 $");
script_tag(name:"creation_date", value:"2015-10-06 14:05:33 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:56:55 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2013-1348");
script_tag(name: "insight", value: "ELSA-2013-1348 -  Oracle linux 5 kernel update - kernel [2.6.18-371] - [net] be2net: enable polling prior enabling interrupts globally (Ivan Vecera) [987539] [2.6.18-370] - [net] be2net: Fix to avoid hardware workaround when not needed (Ivan Vecera) [995961] - [kernel] signals: stop info leak via tkill and tgkill syscalls (Oleg Nesterov) [970875] {CVE-2013-2141} [2.6.18-369] - [fs] nlm: Ensure we resend pending blocking locks after a reclaim (Steve Dickson) [918592] - [kernel] kmod: kthread_run causes oom killer deadlock (Frantisek Hrbata) [983506] - [fs] nfs4: ratelimit some messages, add name to bad seq-id mess (Dave Wysochanski) [953121] - [fs] nfsd: fix EXDEV checking in rename (J. Bruce Fields) [515599] - [misc] tty: Fix abusers of current-sighand->tty (Aaron Tomlin) [858981] - [net] ipv6: don't call addrconf_dst_alloc again when enable lo (Jiri Benc) [981417] - [redhat] kabi: Adding symbol fc_fabric_login (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fcoe_ctlr_recv (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fc_exch_mgr_reset (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fc_lport_init (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fc_exch_recv (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fc_lport_destroy (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fcoe_ctlr_els_send (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fcoe_ctlr_destroy (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fc_exch_init (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fc_fabric_logoff (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fc_set_mfs (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fc_elsct_init (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fcoe_ctlr_link_up (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fcoe_ctlr_recv_flogi (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fc_change_queue_depth (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fcoe_ctlr_init (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fcoe_ctlr_link_down (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fc_change_queue_type (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fc_exch_mgr_free (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fc_exch_mgr_alloc (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fc_lport_config (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fc_disc_init (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol strict_strtoul (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fc_rport_init (Jiri Olsa) [864256] - [redhat] kabi: Adding symbol fc_get_host_port_state (Jiri Olsa) [864256] [2.6.18-368] - [net] tg3: Add read dma workaround for 5720 (Ivan Vecera) [984064] - [net] tg3: Add New 5719 Read DMA workaround (Ivan Vecera) [984064] - [net] vlan: fix perf regression due to missing features flags (Michal Schmidt) [977711] [2.6.18-367] - [net] ipv6: do udp_push_pending_frames AF_INET sock pending data (Jiri Benc) [987648] {CVE-2013-4162} - [net] mlx4: restore pre-RHEL5.9 default value of log_num_mac (Michal Schmidt) [968352] - [x86_64] Fix kdump failure due to 'x86_64: Early segment setup' (Paolo Bonzini) [987244] - [fs] vfs: remove unused __d_splice_alias argument (J. Bruce Fields) [785916] - [fs] vfs: stop d_splice_alias creating directory aliases (J. Bruce Fields) [785916] - [xen] skip tracing if it was disabled instead of dying (Igor Mammedov) [967053] [2.6.18-366] - [net] be2net: Activate new FW after FW download for Lancer (Ivan Vecera) [982590] - [net] be2net: Fix initialization sequence for Lancer (Ivan Vecera) [982590] - [net] be2net: Fix FW download in Lancer (Ivan Vecera) [982590] - [net] qlge: Fix receive path to drop error frames (Chad Dupuis) [975852] - [net] qlge: remove NETIF_F_TSO6 flag (Chad Dupuis) [975852] - [net] qlge: Moving low level frame error to ethtool statistics (Chad Dupuis) [975852] - [net] qlge: Fixed double pci free on tx_ring->q allocation fail (Chad Dupuis) [975852] [2.6.18-365] - [net] be2net: Mark checksum fail for IP fragmented packets (Ivan Vecera) [956322] - [net] be2net: Avoid double insertion of vlan tags (Ivan Vecera) [956322] - [net] be2net: disable TX in be_close() (Ivan Vecera) [956322] - [net] be2net: fix EQ from getting full while cleaning RX CQ (Ivan Vecera) [956322] - [net] be2net: avoid napi_disable() when not enabled (Ivan Vecera) [956322] - [net] be2net: Fix receive Multicast Packets w/ Promiscuous mode (Ivan Vecera) [956322] - [net] be2net: Fixed memory leak (Ivan Vecera) [956322] - [net] be2net: Fix PVID tag offload for packets w/ inline VLAN tag (Ivan Vecera) [956322] - [net] be2net: fix a Tx stall bug caused by a specific ipv6 packet (Ivan Vecera) [956322] - [net] be2net: Remove an incorrect pvid check in Tx (Ivan Vecera) [956322] - [net] be2net: Fix issues in error recovery with wrong queue state (Ivan Vecera) [956322] - [net] netpoll: revert 6bdb7fe3104 and fix be_poll() instead (Ivan Vecera) [956322] - [net] be2net: Fix to parse RSS hash Receive completions correctly (Ivan Vecera) [956322] - [net] be2net: Fix cleanup path when EQ creation fails (Ivan Vecera) [956322] - [net] be2net: Fix Endian (Ivan Vecera) [956322] - [net] be2net: Fix to trim skb for padded vlan packets (Ivan Vecera) [956322] - [net] be2net: Explicitly clear reserved field in Tx Descriptor (Ivan Vecera) [956322] - [net] be2net: remove unnecessary usage of unlikely() (Ivan Vecera) [956322] - [net] be2net: do not modify PCI MaxReadReq size (Ivan Vecera) [956322] - [net] be2net: cleanup be_vid_config() (Ivan Vecera) [956322] - [net] be2net: don't call vid_config() when there no vlan config (Ivan Vecera) [956322] - [net] be2net: Ignore status of some ioctls during driver load (Ivan Vecera) [956322] - [net] be2net: Fix wrong status getting returned for MCC commands (Ivan Vecera) [956322] - [net] be2net: Fix VLAN/multicast packet reception (Ivan Vecera) [956322] - [net] be2net: fix wrong frag_idx reported by RX CQ (Ivan Vecera) [956322] - [infiniband] cxgb4: Compile when CXGB4 is set, not CXGB3 (Doug Ledford) [871555] - Revert: [infiniband] qib: add qib, mod ipath to only support HTX (Doug Ledford) [871555] - Revert: [infiniband] Enable Kconfig for ipath (Doug Ledford) [871555] - Revert: [infiniband] Revert upstream 'Infiniband: make ipath' (Doug Ledford) [871555] - Revert: [infiniband] Revert upstream 'IB/ipath: Make ipath_port' (Doug Ledford) [871555] - Revert: [infiniband] Revert upstream 'IB/ipath: Convert from ...' (Doug Ledford) [871555] - Revert: [infiniband] Revert upstream 'cpumask: use new cpumask' (Doug Ledford) [871555] - Revert: [infiniband] Import of backport patch from ofed 1.4.2 (Doug Ledford) [871555] - Revert: [infiniband] Pull in backport from ofed 1.4.2 (Doug Ledford) [871555] - Revert: [infiniband] aio_write not right entrypoint to use in our (Doug Ledford) [871555] - Revert: [infiniband] make up for lack of HT_IRQ config option (Doug Ledford) [871555] - Revert: [infiniband] Don't use vmalloc_user (Doug Ledford) [871555] - Revert: [infiniband] More device->class_device conversions (Doug Ledford) [871555] - Revert: [scsi] qla4xxx: ISP8xxx: Correct retry of adapter initial (Chad Dupuis) [978150] - [net] af_key: fix info leaks in notify messages (Jiri Benc) [981000] {CVE-2013-2234} - [net] af_key: initialize satype in key_notify_policy_flush() (Jiri Benc) [981224] {CVE-2013-2237} - [net] Fix panic for vlan over gre via tun (Thomas Graf) [981337] - [net] ipv6: ip6_sk_dst_check() must not assume ipv6 dst (Jiri Pirko) [981557] {CVE-2013-2232} [2.6.18-364] - [net] sctp: Disallow new connection on a closing socket (Daniel Borkmann) [974936] {CVE-2013-2206} - [net] sctp: Use correct sideffect command in dup cookie handling (Daniel Borkmann) [974936] {CVE-2013-2206} - [net] sctp: deal with multiple COOKIE_ECHO chunks (Daniel Borkmann) [974936] {CVE-2013-2206} - [scsi] qla4xxx: Update vers to 5.02.04.06.05.10-d0 for Inbox rel (Chad Dupuis) [978150] - [scsi] qla4xxx: ISP8xxx: Correct retry of adapter initialization (Chad Dupuis) [978150] - [scsi] qla4xxx: Fix req queue count manipulation on response path (Chad Dupuis) [978150] - [scsi] qla4xxx: Fix targets not coming back if chap is enabled (Chad Dupuis) [978150] - [scsi] qla4xxx: Correct early completion of pending mbox (Chad Dupuis) [978150] - [net] fix invalid free in ip_cmsg_send() callers (Petr Matousek) [980142] {CVE-2013-2224} - [x86_64] Early segment setup for VT (Paolo Bonzini) [978305] - [block] cpqarray: info leak in ida_locked_ioctl() (Tomas Henzl) [971246] {CVE-2013-2147} - [net] tcp: bind() use stronger condition for bind_conflict (Flavio Leitner) [957604] [2.6.18-363] - [virt] netback: don't disconnect frontend with oversize packet (Andrew Jones) [971155] - [virt] netfront: reduce gso_max_size to account max TCP header (Andrew Jones) [971155] - [block] cdrom: use kzalloc() for failing hardware (Frantisek Hrbata) [973104] {CVE-2013-2164} - [block] cciss: Update version string (Linda Knippers) [919633] [2.6.18-362] - [block] cciss: Silence noisy per-device cciss messages (Tomas Henzl) [827515] - [fs] gfs2: flush work queue before clearing glock hash tables (Abhijith Das) [959532] - [fs] extN: tighten restrictions on inode flags (Eric Sandeen) [756309] - [mm] use-after-free in madvise_remove() (Jacob Tanenbaum) [849736] {CVE-2012-3511} - [internal] kernel.spec: add Provides line to kernel-debug-devel (Phillip Lougher) [709658] [2.6.18-361] - [fs] ext4: Avoid crashing on NULL ptr dereference on fs error (Carlos Maiolino) [867748] - [fs] ext4: set extents flag when migrating file to use extents (Carlos Maiolino) [867748] - [fs] ext4: Convert more i_flags references to use accessors (Carlos Maiolino) [867748] - [fs] ext4: Fix remaining racy updates of EXT4_I(inode)->i_flags (Carlos Maiolino) [867748] - [fs] ext4: Use bitops to read/modify i_flags in ext4_inode_info (Carlos Maiolino) [867748] - [fs] ext3/4: don't clear orphan list on ro mount with errors (Eric Sandeen) [850803] - [fs] jbd2: round commit timer up to avoid uncommitted transaction (Carlos Maiolino) [892393] - [scsi] ibmvfc: Ignore fabric RSCNs when link is dead (Steve Best) [964334] - [mm] Page migration: Don't accept invalid nodes in target nodeset (Jan Stancek) [848473] - [mm] Break out when there is nothing more to write for the fs. (Larry Woodman) [965359] - [sound] ALSA - fix the no-sound issue for Creative Recon3D cards (Jaroslav Kysela) [796912] [2.6.18-360] - [fs] zisofs: fix readpage() outside i_size (Eric Sandeen) [952860] - [net] fixed: fix module unloading for the 'fixed' driver (Nikolay Aleksandrov) [647894] - [net] ipv6: assign rt6_info to inet6_ifaddr in init_loopback (Jiri Benc) [971067] - [net] Bluetooth: fix possible info leak in bt_sock_recvmsg() (Radomir Vrbovsky) [955601] {CVE-2013-3224} - [block] gen8plus Smart Array IDs (Linda Knippers) [919633] - [net] Bluetooth: HCI & L2CAP information leaks (Jacob Tanenbaum) [922416] {CVE-2012-6544} - [virt] xen PV passthru: assign SR-IOV VFs to sep virtual slots (Laszlo Ersek) [865736] - [scsi] be2iscsi: This patch bumps the version number (Rob Evers) [962503] - [scsi] be2iscsi: This patch fixes the NOPIN issues (Rob Evers) [962503] - [xen] cap physmem at 1TB (Andrew Jones) [961667] - [xen] cleanup invalid checksum error (Andrew Jones) [914814] - [xen] mask cpuid avx (Andrew Jones) [894360] [2.6.18-359] - [fs] autofs4: use __simple_empty() for empty directory check (Ian Kent) [873922] - [fs] autofs: remove autofs dentry mount check (Ian Kent) [928098] - [redhat] kabi: Adding symbol register_lro_netdev (Jiri Olsa) [873514] - [redhat] kabi: Adding symbol unregister_lro_netdev (Jiri Olsa) [873514] - [misc] signal: use __ARCH_HAS_SA_RESTORER instead of SA_RESTORER (Nikola Pajkovsky) [920504] {CVE-2013-0914} - [misc] signal: always clear sa_restorer on execve (Nikola Pajkovsky) [920504] {CVE-2013-0914} - [misc] signal: Def __ARCH_HAS_SA_RESTORER for sa_restorer clear (Nikola Pajkovsky) [920504] {CVE-2013-0914} - [net] ipv6: Fix broken IPv6 routing table after loopback down-up (Jiri Benc) [745321] - [virt] hv: use gracefully shutdown instead of poweroff (Jason Wang) [903460] - [md] dm kcopyd throttling (Mikulas Patocka) [958556] - [scsi] storvsc: Properly handle in-transit packets during a reset (Jason Wang) [865292] - [net] sky2: fix scheduling while atomic in sky2_vlan_rx_register (Nikolay Aleksandrov) [920757] - [x86] fix timeout of poll(2) w/ 32-bit processes on x86_64 (Naoya Horiguchi) [794670] [2.6.18-358] - [net] tg3: buffer overflow in VPD firmware parsing (Jacob Tanenbaum) [949940] {CVE-2013-1929} - [net] atm: update msg_namelen in vcc_recvmsg() (Nikola Pajkovsky) [955223] {CVE-2013-3222} - [ia64] fix KABI breakage on ia64 (Prarit Bhargava) [960783] - [cpufreq] acpi-cpufreq more defensive against BIOS freq changes (Lenny Szubowicz) [921856] - [net] tcp: connect() race with timewait reuse (Jiri Pirko) [947038] - [block] ide: Allow configuration of prefer_ms_hyperv (Radomir Vrbovsky) [907231] - [infiniband] Return link layer type to userspace query port op (Jay Fenlason) [866331] - [scsi] ipr: Fix oops while resetting an ipr adapter (Steve Best) [914391] - [net] ipv6: Remove IPV6_ADDR_RESERVED (Amerigo Wang) [728922] - [net] IP_MULTICAST_IF setsockopt now recognizes struct mreq (Jiri Pirko) [847613] - [net] reduce per cpu ram used for loopback stats (Weiping Pan) [872466] - [net] ipv4: check optlen for IP_MULTICAST_IF option (Jiri Pirko) [866743] [2.6.18-357] - [fs] ext4: prevent race while walking extent tree for fiemap (Lukas Czerner) [692071] - [fs] ext4: Fix possibly very long loop in fiemap (Lukas Czerner) [692071] - [fs] ext4: make FIEMAP and delayed allocation play well together (Lukas Czerner) [692071] - [fs] ext4: handle NULL p_ext in ext4_ext_next_allocated_block() (Lukas Czerner) [692071] - [fs] ext4: drop ec_type from the ext4_ext_cache structure (Lukas Czerner) [692071] - [fs] afs: export a couple of core functions for AFS write support (Lukas Czerner) [692071] - [fs] cifs: show sec= option in /proc/mounts (Sachin Prabhu) [806481] - [fs] cifs: Introduce workaround for crypto module loading problem (Sachin Prabhu) [806481] - [fs] cifs: Fix extended security auth failure (Sachin Prabhu) [806481] - [fs] cifs: silence printk when establishing first sess on socket (Sachin Prabhu) [806481] - [fs] cifs: Fix sign failure when serv mandates sign for NTLMSSP (Sachin Prabhu) [806481] - [fs] cifs: Support NTLM2 sess security dur NTLMSSP authenticate (Sachin Prabhu) [806481] - [fs] cifs: ignore everything in SPNEGO blob after mechTypes (Sachin Prabhu) [806481] - [fs] cifs: check offset in decode_ntlmssp_challenge() (Sachin Prabhu) [806481] - [fs] cifs: endian fix in decode_ntlmssp_challenge (Sachin Prabhu) [806481] - [fs] cifs: NTLM auth/sign - create & send keys for key exchange (Sachin Prabhu) [806481] - [fs] cifs: mv 'ntlmssp' & 'local_leases' opts from experimental (Sachin Prabhu) [806481] - [fs] cifs: Remove distinction between rawntlmssp and ntlmssp. (Sachin Prabhu) [806481] - [fs] cifs: Fix broken sec=ntlmv2/i sec option (try #2) (Sachin Prabhu) [806481] - [fs] cifs: NTLM auth/sign - minor error corrections and cleanup (Sachin Prabhu) [806481] - [fs] cifs: NTLM auth/sign - Alloc sess key/client res dynamically (Sachin Prabhu) [806481] - [fs] cifs: NTLM authent & signing - Calc auth response per sess (Sachin Prabhu) [806481] - [fs] cifs: ntlm authent & signing - proper av/ti pair for ntlmv2 (Sachin Prabhu) [806481] - [fs] cifs: fix module refcount leak in find_domain_name (Sachin Prabhu) [806481] - [fs] cifs: ntlm authent & signing - Fix response len for ntlmv2 (Sachin Prabhu) [806481] - [fs] cifs: NTLMv2/NTLMSSP ntlmv2 within ntlmssp authenticate code (Sachin Prabhu) [806481] - [fs] cifs: NTLMv2/NTLMSSP Change var name mac_key to session key (Sachin Prabhu) [806481] - [fs] cifs: ntlmv2/ntlmssp rem function CalcNTLMv2_partial_mac_key (Sachin Prabhu) [806481] - [fs] cifs: have decode_negTokenInit set flags in server struct (Sachin Prabhu) [806481] - [fs] cifs: eliminate 'first_time' parm to CIFS_SessSetup (Sachin Prabhu) [806481] - [fs] cifs: Allow raw ntlmssp code to be enabled with sec=ntlmssp (Sachin Prabhu) [806481] - [fs] cifs: Fix SMB uid in NTLMSSP authenticate request (Sachin Prabhu) [806481] - [fs] cifs: NTLMSSP reenabled after move from connect.c to sess.c (Sachin Prabhu) [806481] - [fs] cifs: Add remaining ntlmssp flags & standardize field names (Sachin Prabhu) [806481] - [misc] genalloc: stop crashing the system when destroying a pool (Steve Best) [859194] - [x86] mm: introduce proper mem barriers smp_invalidate_interrupt (Rafael Aquini) [865095] - [x86] Add sysctl to allow panic on IOCK NMI error (Prarit Bhargava) [918279] [2.6.18-356] - [fs] nfs: flush cached dir information slightly more readily (Scott Mayhew) [853145] - [fs] nfs: Fix resolution prob with cache_change_attribute (Scott Mayhew) [853145] - [fs] nfs: define function to update nfsi->cache_change_attribute (Scott Mayhew) [853145] - [fs] nfsv4: Save the owner/group name string when doing open (Scott Mayhew) [609252] - [fs] nfsv4: Don't do idmapper upcalls for asynchronous RPC calls (Scott Mayhew) [609252] - [fs] nfsv4: Fix cache validate bug where getcwd() returns ENOENT (Scott Mayhew) [609252] - [fs] nfsv4: Simplify some cache consistency post-op GETATTRs (Scott Mayhew) [609252] - [fs] nfsv4: set fattr->valid to reflect what was decoded (Scott Mayhew) [609252] - [fs] nfsv4: Clean up decode_getfattr() (Scott Mayhew) [609252] - [fs] nfsv4: Support NFSv4 optional attrs in the struct nfs_fattr (Scott Mayhew) [609252] - [fs] nfs: Fix nfs_post_op_update_inode_force_wcc() (Scott Mayhew) [609252] - [md] shutdown, don't switch to RO, mark clean and set safemode=2 (Jes Sorensen) [864727] - [net] cxgb4: zero out another firmware request struct (Jay Fenlason) [872531] - [net] cxgb4: clear out most firmware request structures (Jay Fenlason) [872531] - [net] ethtool: allow enable GRO even if RX csum is disabled (Ivan Vecera) [894636] - [net] enable GRO by default for vlan devices (Ivan Vecera) [894636] - [net] bonding: enable gro by default (Ivan Vecera) [894636] - [mm] writeback: remove unnecessary wait in throttle_vm_writeout() (Frantisek Hrbata) [822768] - [mm] throttle_vm_writeout: don't loop on GFP_NOFS/GFP_NOIO alloc (Frantisek Hrbata) [822768] - [char] random: mix in architectural randomness in extract_buf() (Prarit Bhargava) [871559] - [char] random: Use arch-specific RNG to init the entropy store (Prarit Bhargava) [871559] - [x86] random: Verify RDRAND function and allow it to be disabled (Prarit Bhargava) [871559] - [x86] random: Arch inlines to get random integers with RDRAND (Prarit Bhargava) [871559] - [char] random: Add support for architectural random hooks (Prarit Bhargava) [871559] - [char] random: make mixing interface byte-oriented (Prarit Bhargava) [871559] - [char] random: remove some prefetch logic (Prarit Bhargava) [871559] - [char] random: improve variable naming, clear extract buffer (Prarit Bhargava) [871559] - [x86] add clear_cpu_cap() operation (Prarit Bhargava) [871559] - [x86] 32-bit, add alternative_io() (Prarit Bhargava) [871559] - [x86] add X86_FEATURE_RDRAND (Prarit Bhargava) [871559] - [x86] add ASM_OUTPUT2 (Prarit Bhargava) [871559] - [x86] mce, kernel supports MCE for Nehalem (Prarit Bhargava) [958905] - [scsi] qla2xxx: Add a mutex around use of optrom variables. (Chad Dupuis) [795550] - [net] be2net: fix wrong frag_idx reported by RX CQ (Ivan Vecera) [862520] - [net] bnx2x: Prevent NULL pointer dereference in kdump (Michal Schmidt) [867302] - [scsi] cxgb4i hot-unplug (Jay Fenlason) [786024] - [net] bond: add support to read speed and duplex via ethtool (Andy Gospodarek) [704575] - [net] netpoll: workaround a race condition (Amerigo Wang) [742495] - [net] IPV6: Allow address changes while administrative down (Flavio Leitner) [868622] - [sound] ALSA - HDA - fix NULL pointer dereference for ALC268 (Jaroslav Kysela) [901337] - [scsi] cciss: use lun reset not target reset (Tomas Henzl) [893049] - [net] igbvf: work around i350 erratum (Stefan Assmann) [878904] - [net] llc: Fix missing msg_namelen update in llc_ui_recvmsg() (Jesper Brouer) [956097] {CVE-2013-3231} - [net] tipc: fix info leaks via msg_name in recv_msg/recv_stream (Jesper Brouer) [956149] {CVE-2013-3235} - [net] Bluetooth: RFCOMM Fix info leak in ioctl(RFCOMMGETDEVLIST) (Radomir Vrbovsky) [922407] {CVE-2012-6545} - [net] Bluetooth: RFCOMM - Fix info leak via getsockname() (Radomir Vrbovsky) [922407] {CVE-2012-6545} - [kernel] Make futex_wait() use an hrtimer for timeout (Prarit Bhargava) [864648] [2.6.18-355] - [char] ipmi: use a tasklet for handling received messages (Tony Camuso) [947732] - [char] ipmi: do run_to_completion properly in deliver_recv_msg (Tony Camuso) [947732] - [fs] nfs4: fix locking around cl_state_owners list (Dave Wysochanski) [948317] - [s390] qeth: fix qeth_wait_for_threads() deadlock for OSN devices (Hendrik Brueckner) [952451] - [fs] ext4: check for zero length extent (Lukas Czerner) [866433] - [net] be2net: fix be_close() to ensure all events are ack'ed (Ivan Vecera) [950137] - [net] be2net: fix a race in be_xmit() (Ivan Vecera) [949959] - [kernel] kmod: avoid deadlock from recursive request_module call (Frantisek Hrbata) [949568] - [net] netxen: write IP address to firmware when using bonding (Nikolay Aleksandrov) [756502] - [s390] kernel: sched_clock() overflow (Hendrik Brueckner) [903338] - [net] devinet: Register inetdev earlier (Jiri Pirko) [770813] - [fs] nfs: Fix bugs on short read (Sachin Prabhu) [924011] - [fs] nfs: Don't allow NFS silly-renamed files to be deleted (Dave Wysochanski) [906472] - [xen] AMD IOMMU: spot missing IO-APIC entries in IVRS table (Igor Mammedov) [910913] {CVE-2013-0153} - [xen] AMD, IOMMU: Make per-device interrupt remap table default (Igor Mammedov) [910913] {CVE-2013-0153} - [xen] AMD, IOMMU: Disable IOMMU if SATA Combined mode is on (Igor Mammedov) [910913] {CVE-2013-0153} - [xen] AMD, IOMMU: On creating entry clean up in remapping tables (Igor Mammedov) [910913] {CVE-2013-0153} - [xen] ACPI: acpi_table_parse() should return handler's err code (Igor Mammedov) [910913] {CVE-2013-0153} - [xen] introduce xzalloc() & Co (Igor Mammedov) [910913] {CVE-2013-0153} [2.6.18-354] - [x86] fpu: fix CONFIG_PREEMPT=y corruption of FPU stack (Prarit Bhargava) [731531] - [i386] add sleazy FPU optimization (Prarit Bhargava) [731531] - [x86-64] non lazy 'sleazy' fpu implementation (Prarit Bhargava) [731531] - [net] be2net: fix calling __vlan_put_tag() after eth_type_trans() (Ivan Vecera) [916640] - [net] be2net: increment/decrement vlans_added only once (Ivan Vecera) [922223] - [net] tg3: use PCI PM core funcs not direct access to registers (Ivan Vecera) [866822] - [fs] ext3: fix update of mtime and ctime on rename (Carlos Maiolino) [919191] - [fs] nfs: handle getattr failure during nfsv4 open (David Jeffery) [906909] - [pci] read-modify-write PCIe dev control reg when initiating FLR (Myron Stowe) [854001] - [fs] ext3: fix wrong gfp type under transaction (Lukas Czerner) [816665] - [pci] intel-iommu: Prev devs with RMRRs from going in SI Domain (Tony Camuso) [839334] - [net] tcp: fix >2 iw selection (Daniel Borkmann) [871787] - [ata] sata_svw: check DMA start bit before reset (David Milburn) [754311] - [s390] qeth: set new mac even if old mac is gone (Hendrik Brueckner) [883459] - [s390] qeth: fix deadlock between recovery and bonding driver (Hendrik Brueckner) [869646] - [s390] dasd: check count address during online setting (Hendrik Brueckner) [859527] - [s390] hugetlb: use direct TLB flushing for hugetlbfs pages (Hendrik Brueckner) [861178] [2.6.18-353] - [virt] xen-netback: backports (Andrew Jones) [910885] {CVE-2013-0216 CVE-2013-0217} - [virt] xen-netback: netif_schedulable should take a netif (Andrew Jones) [910885] {CVE-2013-0216 CVE-2013-0217} - [virt] pciback: rate limit error mess from pciback_enable_msi() (Igor Mammedov) [910877] {CVE-2013-0231} - [net] be2net: remove BUG_ON() in be_mcc_compl_is_new() (Ivan Vecera) [907524] - [net] ipv4: Update MTU to all related cache entries (Amerigo Wang) [905190] - [net] annotate rt_hash_code() users (Amerigo Wang) [905190] - [net] xfrm_user: fix info leak in copy_to_user_state() (Thomas Graf) [922427] {CVE-2012-6537} - [net] xfrm_user: fix info leak in copy_to_user_policy() (Thomas Graf) [922427] {CVE-2012-6537} - [net] xfrm_user: fix info leak in copy_to_user_tmpl() (Thomas Graf) [922427] {CVE-2012-6537} - [net] atm: fix info leak in getsockopt(SO_ATMPVC) (Thomas Graf) [922385] {CVE-2012-6546} - [net] atm: fix info leak via getsockname() (Thomas Graf) [922385] {CVE-2012-6546} - [net] tun: fix ioctl() based info leaks (Thomas Graf) [922349] {CVE-2012-6547} - [net] llc, zero sockaddr_llc struct (Thomas Graf) [922329] {CVE-2012-6542} - [net] llc: fix info leak via getsockname() (Thomas Graf) [922329] {CVE-2012-6542} - [net] xfrm_user: return error pointer instead of NULL (Thomas Graf) [919387] {CVE-2013-1826} - [kernel] wait_for_helper: SIGCHLD from u/s cause use-after-free (Frantisek Hrbata) [858753] {CVE-2012-4398} - [kernel] Fix ____call_usermodehelper errs being silently ignored (Frantisek Hrbata) [858753] {CVE-2012-4398} - [kernel] wait_for_helper: remove unneeded do_sigaction() (Frantisek Hrbata) [858753] {CVE-2012-4398} - [kernel] kmod: avoid deadlock from recursive kmod call (Frantisek Hrbata) [858753] {CVE-2012-4398} - [kernel] kmod: make request_module() killable (Frantisek Hrbata) [858753] {CVE-2012-4398} - [net] ixgbevf: allocate room for mailbox MSI-X interrupt's name (Laszlo Ersek) [862862] - [fs] knfsd: allow nfsd READDIR to return 64bit cookies (Niels de Vos) [918952] [2.6.18-352] - [utrace] ensure arch_ptrace() can never race with SIGKILL (Oleg Nesterov) [912072] {CVE-2013-0871} - [x86] msr: Add capabilities check (Nikola Pajkovsky) [908697] {CVE-2013-0268} [2.6.18-351] - [misc] tainted flags, fix buffer size (Prarit Bhargava) [901547] - [net] be2net: fix unconditionally returning IRQ_HANDLED in INTx (Ivan Vecera) [878316] - [net] be2net: fix INTx ISR for interrupt behaviour on BE2 (Ivan Vecera) [878316] - [net] be2net: fix a possible events_get() race on BE2 (Ivan Vecera) [878316] [2.6.18-350] - [firmware] Expand kernel boot-time storage for DMI table structs (Lenny Szubowicz) [862865] - [fs] udf: Fortify loading of sparing table (Nikola Pajkovsky) [843141] {CVE-2012-3400} - [fs] udf: Improve table length check to avoid possible overflow (Nikola Pajkovsky) [843141] {CVE-2012-3400} - [fs] udf: Avoid run away loop when partition table is corrupted (Nikola Pajkovsky) [843141] {CVE-2012-3400} [2.6.18-349] - [pci] intel-iommu: reduce max num of domains supported (Don Dutile) [885125] - [fs] gfs2: Fix leak of cached directory hash table (Steven Whitehouse) [831330] - [x86] mm: randomize SHLIB_BASE (Petr Matousek) [804954] {CVE-2012-1568} - [net] be2net: create RSS rings even in multi-channel configs (Ivan Vecera) [878209] - [net] tg3: Avoid dma read error (John Feeney) [877474] - [misc] Fix unsupported hardware message (Prarit Bhargava) [876587] - [net] ipv6: discard overlapping fragment (Jiri Pirko) [874838] {CVE-2012-4444} - [usb] Fix serial port reference counting on hotplug remove (Don Zickus) [845447] - [net] bridge: export its presence and fix bonding igmp reporting (Veaceslav Falico) [843473] - [fs] nfs: move wait for server->active from put_super to kill_sb (Jeff Layton) [839839] - [scsi] libfc: fix indefinite rport restart (Neil Horman) [595184] - [scsi] libfc: Retry a rejected PRLI request (Neil Horman) [595184] - [scsi] libfc: Fix remote port restart problem (Neil Horman) [595184] - [xen] memop: limit guest specified extent order (Laszlo Ersek) [878450] {CVE-2012-5515} - [xen] get bottom of EBDA from the multiboot data structure (Paolo Bonzini) [881885]"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2013-1348");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2013-1348.html");
script_cve_id("CVE-2012-4398");
script_tag(name:"cvss_base", value:"4.9");
script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:N/A:C");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/oracle_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_copyright("Eero Volotinen");
script_family("Oracle Linux Local Security Checks");
exit(0);
}
include("revisions-lib.inc");
include("pkg-lib-rpm.inc");
release = get_kb_item("ssh/login/release");
res = "";
if(release == NULL)
{
 exit(0);
}
if(release == "OracleLinux5")
{
  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.18~371.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-PAE", rpm:"kernel-PAE~2.6.18~371.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-PAE-devel", rpm:"kernel-PAE-devel~2.6.18~371.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~2.6.18~371.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~2.6.18~371.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~2.6.18~371.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~2.6.18~371.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~2.6.18~371.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-xen", rpm:"kernel-xen~2.6.18~371.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-xen-devel", rpm:"kernel-xen-devel~2.6.18~371.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"ocfs2", rpm:"ocfs2~2.6.18~371.el5~1.4.10~1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"ocfs2", rpm:"ocfs2~2.6.18~371.el5PAE~1.4.10~1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"ocfs2", rpm:"ocfs2~2.6.18~371.el5debug~1.4.10~1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"ocfs2", rpm:"ocfs2~2.6.18~371.el5xen~1.4.10~1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"oracleasm", rpm:"oracleasm~2.6.18~371.el5~2.0.5~1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"oracleasm", rpm:"oracleasm~2.6.18~371.el5PAE~2.0.5~1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"oracleasm", rpm:"oracleasm~2.6.18~371.el5debug~2.0.5~1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"oracleasm", rpm:"oracleasm~2.6.18~371.el5xen~2.0.5~1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
