# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2016-3510.nasl 6552 2017-07-06 11:49:41Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.122851");
script_version("$Revision: 6552 $");
script_tag(name:"creation_date", value:"2016-01-21 07:29:49 +0200 (Thu, 21 Jan 2016)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:49:41 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2016-3510");
script_tag(name: "insight", value: "ELSA-2016-3510 -  kernel-uek security update - kernel-uek[4.1.12-32.1.2]- KEYS: Fix keyring ref leak in join_session_keyring() (Yevgeny Pats) [Orabug: 22563965] {CVE-2016-0728}[4.1.12-32.1.1]- ocfs2: return non-zero st_blocks for inline data (John Haxby) [Orabug: 22218243] - xen/events/fifo: Consume unprocessed events when a CPU dies (Ross Lagerwall) [Orabug: 22498877] - Revert 'xen/fb: allow xenfb initialization for hvm guests' (Konrad Rzeszutek Wilk) - xen/pciback: Dont allow MSI-X ops if PCI_COMMAND_MEMORY is not set. (Konrad Rzeszutek Wilk) - xen/pciback: For XEN_PCI_OP_disable_msi[ or x] only disable if device has MSI(X) enabled. (Konrad Rzeszutek Wilk) - xen/pciback: Do not install an IRQ handler for MSI interrupts. (Konrad Rzeszutek Wilk) - xen/pciback: Return error on XEN_PCI_OP_enable_msix when device has MSI or MSI-X enabled (Konrad Rzeszutek Wilk) - xen/pciback: Return error on XEN_PCI_OP_enable_msi when device has MSI or MSI-X enabled (Konrad Rzeszutek Wilk) - xen/pciback: Save xen_pci_op commands before processing it (Konrad Rzeszutek Wilk) - xen-scsiback: safely copy requests (David Vrabel) - xen-blkback: read from indirect descriptors only once (Roger Pau Monne) - xen-blkback: only read request operation from shared ring once (Roger Pau Monne) - xen-netback: use RING_COPY_REQUEST() throughout (David Vrabel) - xen-netback: dont use last request to determine minimum Tx credit (David Vrabel) - xen: Add RING_COPY_REQUEST() (David Vrabel)"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2016-3510");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2016-3510.html");
script_cve_id("CVE-2016-0728");
script_tag(name:"cvss_base", value:"7.2");
script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
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
  if ((res = isrpmvuln(pkg:"dtrace-modules", rpm:"dtrace-modules~4.1.12~32.1.2.el7uek~0.5.1~1.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek", rpm:"kernel-uek~4.1.12~32.1.2.el7uek", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-debug", rpm:"kernel-uek-debug~4.1.12~32.1.2.el7uek", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-debug-devel", rpm:"kernel-uek-debug-devel~4.1.12~32.1.2.el7uek", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-devel", rpm:"kernel-uek-devel~4.1.12~32.1.2.el7uek", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-doc", rpm:"kernel-uek-doc~4.1.12~32.1.2.el7uek", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-firmware", rpm:"kernel-uek-firmware~4.1.12~32.1.2.el7uek", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"dtrace-modules", rpm:"dtrace-modules~4.1.12~32.1.2.el6uek~0.5.1~1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek", rpm:"kernel-uek~4.1.12~32.1.2.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-debug", rpm:"kernel-uek-debug~4.1.12~32.1.2.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-debug-devel", rpm:"kernel-uek-debug-devel~4.1.12~32.1.2.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-devel", rpm:"kernel-uek-devel~4.1.12~32.1.2.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-doc", rpm:"kernel-uek-doc~4.1.12~32.1.2.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-firmware", rpm:"kernel-uek-firmware~4.1.12~32.1.2.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

