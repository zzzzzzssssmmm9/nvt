# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2015-3064.nasl 9402 2018-04-09 07:20:26Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123045");
script_version("$Revision: 9402 $");
script_tag(name:"creation_date", value:"2015-10-06 09:47:04 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2018-04-09 09:20:26 +0200 (Mon, 09 Apr 2018) $");
script_name("Oracle Linux Local Check: ELSA-2015-3064");
script_tag(name: "insight", value: "ELSA-2015-3064 - Unbreakable Enterprise kernel security , bug fix and enhancement update - kernel-uek [3.8.13-98] - KVM: x86: SYSENTER emulation is broken (Nadav Amit) [Orabug: 21502729] {CVE-2015-0239} {CVE-2015-0239} - fs: take i_mutex during prepare_binprm for set[ug]id executables (Jann Horn) [Orabug: 21502159] {CVE-2015-3339} [3.8.13-97] - add ql2400, ql2500 firmware versions to prerequisites (Dan Duval) [Orabug: 21474929] - correct QLogic firmware dependencies in the spec file (Dan Duval) [Orabug: 21474929] [3.8.13-96] - xen-blkfront: don't add indirect page to list when !feature_persistent (Bob Liu) [Orabug: 21459266] [3.8.13-95] - add firmware dependencies to spec files (Dan Duval) [Orabug: 21417522] [3.8.13-94] - ipv6: Don't reduce hop limit for an interface (D.S. Ljungmark) [Orabug: 21444784] {CVE-2015-2922} - ipv4: Missing sk_nulls_node_init() in ping_unhash(). (David S. Miller) [Orabug: 21444685] {CVE-2015-3636} [3.8.13-93] - config: sync up config files to make build clean (Guangyu Sun) [Orabug: 21425838] - acpi: fix typo in drivers/acpi/osl.c (Guangyu Sun) [Orabug: 21418329] [3.8.13-92] - Revert 'i40e: Add support for getlink, setlink ndo ops' (Brian Maly) [Orabug: 21314906] - x86: Do not try to sync identity map for non-mapped pages (Dave Hansen) [Orabug: 21326516] [3.8.13-91] - rds: re-entry of rds_ib_xmit/rds_iw_xmit (Wengang Wang) [Orabug: 21324074] - drm/mgag200: Reject non-character-cell-aligned mode widths (Adam Jackson) [Orabug: 20868823] - drm/mgag200: fix typo causing bw limits to be ignored on some chips (Dave Airlie) [Orabug: 20868823] - drm/mgag200: remove unused driver_private access (David Herrmann) [Orabug: 20868823] - drm/mgag200: Invalidate page tables when pinning a BO (Egbert Eich) [Orabug: 20868823] - drm/mgag200: Fix LUT programming for 16bpp (Egbert Eich) [Orabug: 20868823] - drm/mgag200: Fix framebuffer pitch calculation (Takashi Iwai) [Orabug: 20868823] - drm/mgag200: Add sysfs support for connectors (Egbert Eich) [Orabug: 20868823] - drm/mgag200: Add an crtc_disable callback to the crtc helper funcs (Egbert Eich) [Orabug: 20868823] - drm/mgag200: Fix logic in mgag200_bo_pin() (v2) (Egbert Eich) [Orabug: 20868823] - drm/mgag200: inline reservations (Maarten Lankhorst) [Orabug: 20868823] - drm/mgag200: do not attempt to acquire a reservation while in an interrupt handler (Maarten Lankhorst) [Orabug: 20868823] - drm/mgag200: Added resolution and bandwidth limits for various G200e products. (Julia Lemire) [Orabug: 20868823] - drm/mgag200: Reject modes that are too big for VRAM (Christopher Harvey) [Orabug: 20868823] - drm/mgag200: Don't do full cleanup if mgag200_device_init fails (Christopher Harvey) [Orabug: 20868823] - drm/mgag200: Hardware cursor support (Christopher Harvey) [Orabug: 20868823] - drm/mgag200: Add missing write to index before accessing data register (Christopher Harvey) [Orabug: 20868823] - drm/mgag200: Fix framebuffer base address programming (Christopher Harvey) [Orabug: 20868823] - drm/mgag200: Convert counter delays to jiffies (Christopher Harvey) [Orabug: 20868823] - drm/mgag200: Fix writes into MGA1064_PIX_CLK_CTL register (Christopher Harvey) [Orabug: 20868823] - drm/mgag200: Don't change unrelated registers during modeset (Christopher Harvey) [Orabug: 20868823] - Revert 'lpfc: Fix for lun discovery issue with 8Gig adapter.' (Guru Anbalagane) [Orabug: 21304962] [3.8.13-90] - x86/asm/entry/64: Remove a bogus 'ret_from_fork' optimization (Andy Lutomirski) [Orabug: 21308309] {CVE-2015-2830} - Update patched for lpfc from 10.6.61.0 to 10.6.61.1 for UEK R3 U6 release. (Dick Kennedy) - lpfc: Change buffer pool empty message to miscellaneous category (Dick Kennedy) - lpfc: Fix incorrect log message reported for empty FCF record. (Dick Kennedy) - lpfc: Fix rport leak. (Dick Kennedy) - lpfc: Correct loss of RSCNs during array takeaway/giveback testing. (Dick Kennedy) - lpfc: Fix crash in vport_delete. (Dick Kennedy) - lpfc: Fix to remove IRQF_SHARED flag for MSI/MSI-X vectors. (Dick Kennedy) - lpfc: Fix discovery issue when changing from Pt2Pt to Fabric. (Dick Kennedy) - lpfc: Correct reporting of vport state on fdisc command failure. (Dick Kennedy) - lpfc: Add support for RDP ELS command. (Dick Kennedy) - lpfc: Fix ABORTs WQ selection in terminate_rport_io (Dick Kennedy) - lpfc: Correct reference counting of rport (Dick Kennedy) - lpfc: Add support for ELS LCB. (Dick Kennedy) - lpfc: Correct loss of target discovery after cable swap. (Dick Kennedy) - dtrace: sigaltstack is no longer a stub syscall (Kris Van Hees) [Orabug: 21304183] - hpsa: add in new offline mode (Don Brace) [Orabug: 21289871] - hpsa: add in new controllers (Don Brace) [Orabug: 21289871] - hpsa: hpsa decode sense data for io and tmf (Don Brace) [Orabug: 21289871] - hpsa: enable bus mastering during init (Don Brace) [Orabug: 21289871] - hpsa: enhance kdump (Don Brace) [Orabug: 21289871] - hpsa: enhance error checking. (Don Brace) [Orabug: 21289871] - hpsa: enhance driver output (Don Brace) [Orabug: 21289871] - hpsa: update pci device table (Don Brace) [Orabug: 21289871] - vmw_pvscsi: Fix pvscsi_abort() function. (Arvind Kumar) [Orabug: 21266080] - qla2xxx: Update driver version to 8.07.00.18.39.0-k. (Sawan Chandak) [Orabug: 21241070] - qla2xxx: Restore physical port WWPN only, when port down detected for FA-WWPN port. (Sawan Chandak) [Orabug: 21241070] - qla2xxx: Fix virtual port configuration, when switch port is disabled/enabled. (Sawan Chandak) [Orabug: 21241070] - qla2xxx: Prevent multiple firmware dump collection for ISP27XX. (Himanshu Madhani) [Orabug: 21241070] - qla2xxx: Disable Interrupt handshake for ISP27XX. (Himanshu Madhani) [Orabug: 21241070] - qla2xxx: Add debugging info for MBX timeout. (Himanshu Madhani) [Orabug: 21241070] - qla2xxx: Add serdes read/write support for ISP27XX (Andrew Vasquez) [Orabug: 21241070] - qla2xxx: Add udev notification to save fw dump for ISP27XX (Himanshu Madhani) [Orabug: 21241070] - qla2xxx: Add message for successful FW dump collected for ISP27XX. (Himanshu Madhani) [Orabug: 21241070] - qla2xxx: Add support to load firmware from file for ISP 26XX/27XX. (Sawan Chandak) [Orabug: 21241070] - qla2xxx: Fix beacon blink for ISP27XX. (Nigel Kirkland) [Orabug: 21241070] - qla2xxx: Increase the wait time for firmware to be ready for P3P. (Chad Dupuis) [Orabug: 21241070] - qla2xxx: Fix printks in ql_log message (Yannick Guerrini) [Orabug: 21241070] - qla2xxx: Fix printk in qla25xx_setup_mode (Yannick Guerrini) [Orabug: 21241070] - bnx2i: update to 2.11.2.0 (Vaughan Cao) [Orabug: 21241055] - bnx2fc: update to 2.9.3 (Vaughan Cao) [Orabug: 21241055] - bnx2x: update to 1.712.33 (Vaughan Cao) [Orabug: 21241055] - cnic: update to 2.5.20h (Vaughan Cao) [Orabug: 21241055] - bnx2: update to 2.2.5o (Vaughan Cao) [Orabug: 21241055] - md: use SRCU to improve performance (Mikulas Patocka) [Orabug: 18231164] - kvm: raise KVM_SOFT_MAX_VCPUS to support more vcpus (Dan Duval) [Orabug: 21144488] - vsock: Make transport the proto owner (Andy King) [Orabug: 21266075] - VSOCK: Move af_vsock.h and vsock_addr.h to include/net (Asias He) [Orabug: 21266075] [3.8.13-89] - drivers: xen-blkfront: only talk_to_blkback() when in XenbusStateInitialising (Bob Liu) - xen/block: add multi-page ring support (Bob Liu) - driver: xen-blkfront: move talk_to_blkback to a more suitable place (Bob Liu) - drivers: xen-blkback: delay pending_req allocation to connect_ring (Bob Liu) - xen/grant: introduce func gnttab_unmap_refs_sync() (Bob Liu) - xen/blkback: safely unmap purge persistent grants (Bob Liu) - xenbus_client: Extend interface to support multi-page ring (Wei Liu) - be2net: update the driver version to 10.6.0.2 (Sathya Perla) [Orabug: 21275400] - be2net: update copyright year to 2015 (Vasundhara Volam) [Orabug: 21275400] - be2net: use be_virtfn() instead of !be_physfn() (Kalesh AP) [Orabug: 21275400] - be2net: simplify UFI compatibility checking (Vasundhara Volam) [Orabug: 21275400] - be2net: post full RXQ on interface enable (Suresh Reddy) [Orabug: 21275400] - be2net: check for INSUFFICIENT_VLANS error (Kalesh AP) [Orabug: 21275400] - be2net: receive pkts with L3, L4 errors on VFs (Somnath Kotur) [Orabug: 21275400] - be2net: log link status (Ivan Vecera) [Orabug: 21275400] - be2net: Fix a bug in Rx buffer posting (Ajit Khaparde) [Orabug: 21275400] - be2net: bump up the driver version to 10.6.0.1 (Sathya Perla) [Orabug: 21275400] - be2net: use PCI MMIO read instead of config read for errors (Suresh Reddy) [Orabug: 21275400] - be2net: restrict MODIFY_EQ_DELAY cmd to a max of 8 EQs (Suresh Reddy) [Orabug: 21275400] - be2net: Prevent VFs from enabling VLAN promiscuous mode (Vasundhara Volam) [Orabug: 21275400] - ethernet: codespell comment spelling fixes (Joe Perches) [Orabug: 21275400] - be2net: avoid creating the non-RSS default RXQ if FW allows to (Vasundhara Volam) [Orabug: 21275400] - be2net: use a wrapper to schedule and cancel error detection task (Sathya Perla) [Orabug: 21275400] - be2net: shorten AMAP_GET/SET_BITS() macro calls (Sathya Perla) [Orabug: 21275400] - be2net: MODULE_DEVICE_TABLE: fix some callsites (Andrew Morton) [Orabug: 21275400] - be2net: avoid unnecessary swapping of fields in eth_tx_wrb (Sathya Perla) [Orabug: 21275400] - be2net: process port misconfig async event (Vasundhara Volam) [Orabug: 21275400] - be2net: refactor be_set_rx_mode() and be_vid_config() for readability (Sathya Perla) [Orabug: 21275400] - be2net: remove duplicate code in be_cmd_rx_filter() (Sathya Perla) [Orabug: 21275400] - be2net: use offset based FW flashing for Skyhawk chip (Vasundhara Volam) [Orabug: 21275400] - be2net: avoid flashing SH-B0 UFI image on SH-P2 chip (Vasundhara Volam) [Orabug: 21275400] - be2net: refactor code that checks flash file compatibility (Vasundhara Volam) [Orabug: 21275400] - be2net: replace (1 lock to a mutex (David Vrabel) [Orabug: 21250018] - xen/grant-table: add a mechanism to safely unmap pages that are in use (Jennifer Herbert) [Orabug: 21250018] - xen-netback: use foreign page information from the pages themselves (Jennifer Herbert) [Orabug: 21250018] - xen: mark grant mapped pages as foreign (Jennifer Herbert) [Orabug: 21250018] - xen/grant-table: add helpers for allocating pages (David Vrabel) [Orabug: 21250018] - x86/xen: require ballooned pages for grant maps (Jennifer Herbert) [Orabug: 21250018] - xen: remove scratch frames for ballooned pages and m2p override (David Vrabel) [Orabug: 21250018] - xen/grant-table: pre-populate kernel unmap ops for xen_gnttab_unmap_refs() (David Vrabel) [Orabug: 21250018] - mm: add 'foreign' alias for the 'pinned' page flag (Jennifer Herbert) [Orabug: 21250018] - mm: provide a find_special_page vma operation (David Vrabel) [Orabug: 21250018] - NFS hangs in __ocfs2_cluster_lock due to race with ocfs2_unblock_lock (Tariq Saeed) [Orabug: 20933419] - swiotlb: don't assume PA 0 is invalid (Jan Beulich) [Orabug: 21249144] [3.8.13-87] - qla4xxx: Update driver version to v5.04.00.07.06.02-uek3 (Nilesh Javali) [Orabug: 21241091] - qla4xxx: check the return value of dma_alloc_coherent() (Maurizio Lombardi) [Orabug: 21241091] - scsi: qla4xxx: ql4_mbx.c: Cleaning up missing null-terminate in conjunction with strncpy (Rickard Strandqvist) [Orabug: 21241091] - scsi: qla4xxx: ql4_os.c: Cleaning up missing null-terminate in conjunction with strncpy (Rickard Strandqvist) [Orabug: 21241091] - qla4xxx: fix get_host_stats error propagation (Mike Christie) [Orabug: 21241091] - scsi_ibft: Fix finding Broadcom specific ibft sign (Vikas Chaudhary) [Orabug: 21241091] - dtrace: convert from sdt_instr_t to asm_instr_t (Kris Van Hees) [Orabug: 21267945] - dtrace: percpu: move from __get_cpu_var() to this_cpu_ptr() (Kris Van Hees) [Orabug: 21265599] - dtrace: do not vmalloc/vfree from probe context (Kris Van Hees) [Orabug: 21267934] - dtrace: restructuring for multi-arch support (Kris Van Hees) [Orabug: 21267922] - kallsyms: fix /proc/kallmodsyms to not be misled by const variables (Nick Alcock) [Orabug: 21257170] - storvsc: force discovery of LUNs that may have been removed. (K. Y. Srinivasan) [Orabug: 20768211] - storvsc: in response to a scan event, scan the host (K. Y. Srinivasan) [Orabug: 20768211] - builds: configs: Enable mgs driver for OL7 (Santosh Shilimkar) [Orabug: 20505584] - aacraid: driver version change (Mahesh Rajashekhara) [Orabug: 21208741] - aacraid: AIF raw device remove support (Mahesh Rajashekhara) [Orabug: 21208741] - aacraid: performance improvement changes (Mahesh Rajashekhara) [Orabug: 21208741] - aacraid: IOCTL fix (Mahesh Rajashekhara) [Orabug: 21208741] - aacraid: IOP RESET command handling changes (Mahesh Rajashekhara) [Orabug: 21208741] - aacraid: 240 simple volume support (Mahesh Rajashekhara) [Orabug: 21208741] - aacraid: vpd page code 0x83 support (Mahesh Rajashekhara) [Orabug: 21208741] - aacraid: MSI-x support (Mahesh Rajashekhara) [Orabug: 21208741] - aacraid: 4KB sector support (Mahesh Rajashekhara) [Orabug: 21208741] - aacraid: IOCTL pass-through command fix (Mahesh Rajashekhara) [Orabug: 21208741] - aacraid: AIF support for SES device add/remove (Mahesh Rajashekhara) [Orabug: 21208741] - scsi: use 64-bit LUNs (Hannes Reinecke) [Orabug: 21208741] - remove deprecated IRQF_DISABLED from SCSI (Michael Opdenacker) [Orabug: 21208741] - aacraid: kdump fix (Mahesh Rajashekhara) [Orabug: 21208741] - drivers: avoid parsing names as kthread_run() format strings (Kees Cook) [Orabug: 21208741] - aacraid: Fix for arrays are going offline in the system. System hangs (Mahesh Rajashekhara) [Orabug: 21208741] - aacraid: Dual firmware image support (Mahesh Rajashekhara) [Orabug: 21208741] - aacraid: suppress two GCC warnings (Paul Bolle) [Orabug: 21208741] - aacraid: 1024 max outstanding command support for Series 7 and above (Mahesh Rajashekhara) [Orabug: 21208741] [3.8.13-86] - kallsyms: fix /proc/kallmodsyms to not be misled by external symbols (Nick Alcock) [Orabug: 21245508] - wait: change waitfd() to use wait4(), not waitid(); reduce invasiveness (Nick Alcock) [Orabug: 21245391] - ixgbevf: upgrade to version 2.16.1 (Brian Maly) [Orabug: 21104474] - ipv6: don't call addrconf_dst_alloc again when enable lo (Gao feng) [Orabug: 21088702] - efi/xen: Pass missing argument to EFI runtime Xen hypercall (Daniel Kiper) [Orabug: 21247143] [3.8.13-85] - fanotify: fix notification of groups with inode & mount marks (Jan Kara) [Orabug: 21168905] - NVMe: Fix VPD B0 max sectors translation (Keith Busch) [Orabug: 21117187] - NVMe: Add translation for block limits (Keith Busch) [Orabug: 21117187] - nvme: Fix PRP list calculation for non-4k system page size (Murali Iyer) [Orabug: 21117187] - NVMe: Fix potential corruption on sync commands (Keith Busch) [Orabug: 21117187] - NVMe: Fix potential corruption during shutdown (Keith Busch) [Orabug: 21117187] - NVMe: Initialize device list head before starting (Keith Busch) [Orabug: 21117187] - NVMe: Asynchronous controller probe (Keith Busch) [Orabug: 21117187] - NVMe: Register management handle under nvme class (Keith Busch) [Orabug: 21117187] - NVMe: Update SCSI Inquiry VPD 83h translation (Keith Busch) [Orabug: 21117187] - NVMe: Update data structures for NVMe 1.2 (Matthew Wilcox) [Orabug: 21117187] - NVMe: Update namespace and controller identify structures to the 1.1a spec (Dimitri John Ledkov) [Orabug: 21117187] - NVMe: Update module version (Keith Busch) [Orabug: 21117187] - fnic: Override the limitation on number of scsi timeouts (Narsimhulu Musini) [Orabug: 21084835] - fnic: IOMMU Fault occurs when IO and abort IO is out of order (Anil Chintalapati (achintal)) [Orabug: 21084835] - Fnic: Fnic Driver crashed with NULL pointer reference (Hiral Shah) [Orabug: 21084835] - Fnic: For Standalone C series, 'sending VLAN request' message seen even if the link is down (Hiral Shah) [Orabug: 21084835] - Fnic: Improper resue of exchange Ids (Hiral Shah) [Orabug: 21084835] - Fnic: Memcopy only mimumum of data or trace buffer (Hiral Shah) [Orabug: 21084835] - Fnic: Not probing all the vNICS via fnic_probe on boot (Hiral Shah) [Orabug: 21084835] - fnic: assign FIP_ALL_FCF_MACS to fcoe_all_fcfs (Hiral Shah) [Orabug: 21084835] - uek-rpm: ol6: update build environment to 6.6 (Guangyu Sun) [3.8.13-84] - x86_64, vdso: Fix the vdso address randomization algorithm (Andy Lutomirski) [Orabug: 21226722] {CVE-2014-9585} [3.8.13-83] - snic: fix format string overflow (Brian Maly) [Orabug: 21091759] - scsi: add snic driver to makefile (Brian Maly) [Orabug: 21091759] - snic: enable snic in kernel configs (Brian Maly) [Orabug: 21091759] - snic: minor checkpatch fixes (Narsimhulu Musini) [Orabug: 21091759] - snic: Add Makefile, patch Kconfig, MAINTAINERS (Narsimhulu Musini) [Orabug: 21091759] - snic: Add event tracing to capture IO events. (Narsimhulu Musini) [Orabug: 21091759] - snic: Add sysfs entries to list stats and trace data (Narsimhulu Musini) [Orabug: 21091759] - snic: Add low level queuing interfaces (Narsimhulu Musini) [Orabug: 21091759] - snic: add SCSI handling, AEN, and fwreset handling (Narsimhulu Musini) [Orabug: 21091759] - snic: Add snic target discovery (Narsimhulu Musini) [Orabug: 21091759] - snic: Add meta request, handling of meta requests. (Narsimhulu Musini) [Orabug: 21091759] - snic: Add interrupt, resource firmware interfaces (Narsimhulu Musini) [Orabug: 21091759] - snic: snic module infrastructure (Narsimhulu Musini) [Orabug: 21091759] - xen/mmu: Move the setting of pvops.write_cr3 to later phase in bootup. (Konrad Rzeszutek Wilk) [Orabug: 21197204] - x86-64, xen, mmu: Provide an early version of write_cr3. (Konrad Rzeszutek Wilk) [Orabug: 21197204] - uek-rpm: build: Use SHA512 instead of SHA256 for module signing (Natalya Naumova) [Orabug: 20687425] - config: ol6: make CONFIG_SERIAL_8250_NR_UARTS 64 (Guangyu Sun) [Orabug: 21141039] - config: enable CONFIG_INTEL_TXT (Guangyu Sun) [Orabug: 21176777] - export host-only net/core and net/ipv4 parameters to a container as read-only (Thomas Tanaka) [Orabug: 21151210] - Revert 'i40e: Add FW check to disable DCB and wrap autoneg workaround with FW check' (Brian Maly) [Orabug: 21103806] - xen-netfront: print correct number of queues (David Vrabel) [Orabug: 21150627] - xen-netfront: release per-queue Tx and Rx resource when disconnecting (David Vrabel) [Orabug: 21150627] - xen-netfront: fix locking in connect error path (David Vrabel) [Orabug: 21150627] - xen-netfront: call netif_carrier_off() only once when disconnecting (David Vrabel) [Orabug: 21150627] - xen-netfront: don't nest queue locks in xennet_connect() (David Vrabel) [Orabug: 21150627] - xen-net{back, front}: Document multi-queue feature in netif.h (Andrew J. Bennieston) [Orabug: 21150627] - xen-netfront: recreate queues correctly when reconnecting (David Vrabel) [Orabug: 21150627] - xen-netfront: fix oops when disconnected from backend (David Vrabel) [Orabug: 21150627] - xen-netfront: initialise queue name in xennet_init_queue (Wei Liu) [Orabug: 21150627] - xen-netfront: Add support for multiple queues (Andrew J. Bennieston) [Orabug: 21150627] - xen-netfront: Factor queue-specific data into queue struct. (Andrew J. Bennieston) [Orabug: 21150627] - xen-netback: bookkeep number of active queues in our own module (Wei Liu) [Orabug: 21150627] - net: xen-netback: include linux/vmalloc.h again (Arnd Bergmann) [Orabug: 21150627] - xen-netback: Add support for multiple queues (Andrew J. Bennieston) [Orabug: 21150627] - xen-netback: Factor queue-specific data into queue struct (Wei Liu) [Orabug: 21150627] - xen-netback: Move grant_copy_op array back into struct xenvif. (Andrew J. Bennieston) [Orabug: 21150627] - ixgbe: Look up MAC address in Open Firmware or IDPROM (Martin K Petersen) [Orabug: 20983421] - ixgbe: update to ver 4.0.3 (Ethan Zhao) [Orabug: 20983421] [3.8.13-82] - config: enable some secure boot features for ol7 (Guangyu Sun) [Orabug: 18961720] - efi: Disable secure boot if shim is in insecure mode (Josh Boyer) [Orabug: 18961720] - hibernate: Disable in a signed modules environment (Josh Boyer) [Orabug: 18961720] - efi: Add EFI_SECURE_BOOT bit (Josh Boyer) [Orabug: 18961720] - Add option to automatically set securelevel when in Secure Boot mode (Matthew Garrett) [Orabug: 18961720] - asus-wmi: Restrict debugfs interface when securelevel is set (Matthew Garrett) [Orabug: 18961720] - x86: Restrict MSR access when securelevel is set (Matthew Garrett) [Orabug: 18961720] - uswsusp: Disable when securelevel is set (Matthew Garrett) [Orabug: 18961720] - kexec: Disable at runtime if securelevel has been set. (Matthew Garrett) [Orabug: 18961720] - acpi: Ignore acpi_rsdp kernel parameter when securelevel is set (Matthew Garrett) [Orabug: 18961720] - acpi: Limit access to custom_method if securelevel is set (Matthew Garrett) [Orabug: 18961720] - Restrict /dev/mem and /dev/kmem when securelevel is set. (Matthew Garrett) [Orabug: 18961720] - x86: Lock down IO port access when securelevel is enabled (Matthew Garrett) [Orabug: 18961720] - PCI: Lock down BAR access when securelevel is enabled (Matthew Garrett) [Orabug: 18961720] - Enforce module signatures when securelevel is greater than 0 (Matthew Garrett) [Orabug: 18961720] - Add BSD-style securelevel support (Matthew Garrett) [Orabug: 18961720] - MODSIGN: Support not importing certs from db (Josh Boyer) [Orabug: 18961720] - MODSIGN: Import certificates from UEFI Secure Boot (Josh Boyer) [Orabug: 18961720] - MODSIGN: Add module certificate blacklist keyring (Josh Boyer) [Orabug: 18961720] - Add an EFI signature blob parser and key loader. (Dave Howells) [Orabug: 18961720] - Add EFI signature data types (Dave Howells) [Orabug: 18961720] - efi: fix error handling in add_sysfs_runtime_map_entry() (Dan Carpenter) [Orabug: 18961720] - PEFILE: Relax the check on the length of the PKCS#7 cert (David Howells) [Orabug: 18961720] - kexec: purgatory: add clean-up for purgatory directory (Michael Welling) [Orabug: 18961720] - x86/purgatory: use approprate -m64/-32 build flag for arch/x86/purgatory (Vivek Goyal) [Orabug: 18961720] - kexec: remove CONFIG_KEXEC dependency on crypto (Vivek Goyal) [Orabug: 18961720] - kexec: create a new config option CONFIG_KEXEC_FILE for new syscall (Vivek Goyal) [Orabug: 18961720] - resource: fix the case of null pointer access (Vivek Goyal) [Orabug: 18961720] - kexec: verify the signature of signed PE bzImage (Vivek Goyal) [Orabug: 18961720] - kexec: support kexec/kdump on EFI systems (Vivek Goyal) [Orabug: 18961720] - kexec: support for kexec on panic using new system call (Vivek Goyal) [Orabug: 18961720] - kexec-bzImage64: support for loading bzImage using 64bit entry (Vivek Goyal) [Orabug: 18961720] - kexec: load and relocate purgatory at kernel load time (Vivek Goyal) [Orabug: 18961720] - purgatory: core purgatory functionality (Vivek Goyal) [Orabug: 18961720] - purgatory/sha256: provide implementation of sha256 in purgaotory context (Vivek Goyal) [Orabug: 18961720] - kexec: implementation of new syscall kexec_file_load (Vivek Goyal) [Orabug: 18961720] - kexec: new syscall kexec_file_load() declaration (Vivek Goyal) [Orabug: 18961720] - kexec: make kexec_segment user buffer pointer a union (Vivek Goyal) [Orabug: 18961720] - resource: provide new functions to walk through resources (Vivek Goyal) [Orabug: 18961720] - kexec: use common function for kimage_normal_alloc() and kimage_crash_alloc() (Vivek Goyal) [Orabug: 18961720] - kexec: move segment verification code in a separate function (Vivek Goyal) [Orabug: 18961720] - kexec: rename unusebale_pages to unusable_pages (Vivek Goyal) [Orabug: 18961720] - kernel: build bin2c based on config option CONFIG_BUILD_BIN2C (Vivek Goyal) [Orabug: 18961720] - bin2c: move bin2c in scripts/basic (Vivek Goyal) [Orabug: 18961720] - kexec: remove unnecessary return (Xishi Qiu) [Orabug: 18961720] - keys: remove duplicated loads of ksplice certificate (Guangyu Sun) [Orabug: 21034277] - X.509: Support parse long form of length octets in Authority Key Identifier (Chun-Yi Lee) [Orabug: 18961720] - KEYS: Pre-clear struct key on allocation (David Howells) [Orabug: 18961720] - KEYS: Fix searching of nested keyrings (David Howells) [Orabug: 18961720] - KEYS: Fix multiple key add into associative array (David Howells) [Orabug: 18961720] - KEYS: Fix the keyring hash function (David Howells) [Orabug: 18961720] - PKCS#7: Fix the parser cleanup to drain parsed out X.509 certs (David Howells) [Orabug: 18961720] - PKCS#7: Provide a single place to do signed info block freeing (David Howells) [Orabug: 18961720] - PKCS#7: Add a missing static (David Howells) [Orabug: 18961720] - X.509: Need to export x509_request_asymmetric_key() (David Howells) [Orabug: 18961720] - PKCS#7: X.509 certificate issuer and subject are mandatory fields in the ASN.1 (David Howells) [Orabug: 18961720] - PKCS#7: Use x509_request_asymmetric_key() (David Howells) [Orabug: 18961720] - X.509: x509_request_asymmetric_keys() doesn't need string length arguments (David Howells) [Orabug: 18961720] - PKCS#7: fix sparse non static symbol warning (Wei Yongjun) [Orabug: 18961720] - PKCS#7: Missing inclusion of linux/err.h (David Howells) [Orabug: 18961720] - ima: define '.ima' as a builtin 'trusted' keyring (Mimi Zohar) [Orabug: 18961720] - KEYS: validate certificate trust only with builtin keys (Dmitry Kasatkin) [Orabug: 18961720] - KEYS: validate certificate trust only with selected key (Dmitry Kasatkin) [Orabug: 18961720] - KEYS: verify a certificate is signed by a 'trusted' key (Mimi Zohar) [Orabug: 18961720] - KEYS: make partial key id matching as a dedicated function (Dmitry Kasatkin) [Orabug: 18961720] - KEYS: Reinstate EPERM for a key type name beginning with a '.' (David Howells) [Orabug: 18961720] - KEYS: special dot prefixed keyring name bug fix (Mimi Zohar) [Orabug: 18961720] - pefile: Validate PKCS#7 trust chain (David Howells) [Orabug: 18961720] - pefile: Digest the PE binary and compare to the PKCS#7 data (David Howells) [Orabug: 18961720] - pefile: Handle pesign using the wrong OID (Vivek Goyal) [Orabug: 18961720] - pefile: Parse the 'Microsoft individual code signing' data blob (David Howells) [Orabug: 18961720] - pefile: Parse the presumed PKCS#7 content of the certificate blob (David Howells) [Orabug: 18961720] - pefile: Strip the wrapper off of the cert data block (David Howells) [Orabug: 18961720] - pefile: Parse a PE binary to find a key and a signature contained therein (David Howells) [Orabug: 18961720] - Provide PE binary definitions (David Howells) [Orabug: 18961720] - KEYS: X.509: Fix a spelling mistake (David Howells) [Orabug: 18961720] - PKCS#7: Provide a key type for testing PKCS#7 (David Howells) [Orabug: 18961720] - PKCS#7: Find intersection between PKCS#7 message and known, trusted keys (David Howells) [Orabug: 18961720] - PKCS#7: Verify internal certificate chain (David Howells) [Orabug: 18961720] - PKCS#7: Find the right key in the PKCS#7 key list and verify the signature (David Howells) [Orabug: 18961720] - PKCS#7: Digest the data in a signed-data message (David Howells) [Orabug: 18961720] - PKCS#7: Implement a parser [RFC 2315] (David Howells) [Orabug: 18961720] - X.509: Export certificate parse and free functions (David Howells) [Orabug: 18961720] - X.509: Add bits needed for PKCS#7 (David Howells) [Orabug: 18961720] - x86/efi: Support initrd loaded above 4G (Yinghai Lu) [Orabug: 18961720] - x86, boot: Do not include boot.h in string.c (Vivek Goyal) [Orabug: 18961720] - x86, boot: Move memcmp() into string.h and string.c (Vivek Goyal) [Orabug: 18961720] - x86, boot: Create a separate string.h file to provide standard string functions (Vivek Goyal) [Orabug: 18961720] - kexec: add sysctl to disable kexec_load (Kees Cook) [Orabug: 18961720] - x86: Add xloadflags bit for EFI runtime support on kexec (Dave Young) [Orabug: 18961720] - x86/efi: Pass necessary EFI data for kexec via setup_data (Dave Young) [Orabug: 18961720] - efi: Export EFI runtime memory mapping to sysfs (Dave Young) [Orabug: 18961720] - efi: Export more EFI table variables to sysfs (Dave Young) [Orabug: 18961720] - x86/efi: Cleanup efi_enter_virtual_mode() function (Dave Young) [Orabug: 18961720] - x86/efi: Fix off-by-one bug in EFI Boot Services reservation (Dave Young) [Orabug: 18961720] - x86/efi: Add a wrapper function efi_map_region_fixed() (Dave Young) [Orabug: 18961720] - keys: change asymmetric keys to use common hash definitions (Dmitry Kasatkin) [Orabug: 18961720] - crypto: provide single place for hash algo information (Dmitry Kasatkin) [Orabug: 18961720] - KEYS: fix error return code in big_key_instantiate() (Wei Yongjun) [Orabug: 18961720] - KEYS: Fix keyring quota misaccounting on key replacement and unlink (David Howells) [Orabug: 18961720] - KEYS: Fix a race between negating a key and reading the error set (David Howells) [Orabug: 18961720] - KEYS: Make BIG_KEYS boolean (Josh Boyer) [Orabug: 18961720] - X.509: remove possible code fragility: enumeration values not handled (Antonio Alecrim Jr) [Orabug: 18961720] - X.509: add module description and license (Konstantin Khlebnikov) [Orabug: 18961720] - MPILIB: add module description and license (Konstantin Khlebnikov) [Orabug: 18961720]"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2015-3064");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2015-3064.html");
script_cve_id("CVE-2014-8989");
script_tag(name:"cvss_base", value:"4.6");
script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
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
if(release == "OracleLinux7")
{
  if ((res = isrpmvuln(pkg:"dtrace-modules", rpm:"dtrace-modules~3.8.13~98.el7uek~0.4.5~3.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"dtrace-modules-provider-headers", rpm:"dtrace-modules-provider-headers~0.4.5~3.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"dtrace-modules-shared-headers", rpm:"dtrace-modules-shared-headers~0.4.5~3.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek", rpm:"kernel-uek~3.8.13~98.el7uek", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-debug", rpm:"kernel-uek-debug~3.8.13~98.el7uek", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-debug-devel", rpm:"kernel-uek-debug-devel~3.8.13~98.el7uek", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-devel", rpm:"kernel-uek-devel~3.8.13~98.el7uek", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-doc", rpm:"kernel-uek-doc~3.8.13~98.el7uek", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-firmware", rpm:"kernel-uek-firmware~3.8.13~98.el7uek", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"dtrace-modules", rpm:"dtrace-modules~3.8.13~98.el6uek~0.4.5~2.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"dtrace-modules-provider-headers", rpm:"dtrace-modules-provider-headers~0.4.5~2.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"dtrace-modules-shared-headers", rpm:"dtrace-modules-shared-headers~0.4.5~2.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek", rpm:"kernel-uek~3.8.13~98.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-debug", rpm:"kernel-uek-debug~3.8.13~98.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-debug-devel", rpm:"kernel-uek-debug-devel~3.8.13~98.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-devel", rpm:"kernel-uek-devel~3.8.13~98.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-doc", rpm:"kernel-uek-doc~3.8.13~98.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-firmware", rpm:"kernel-uek-firmware~3.8.13~98.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

