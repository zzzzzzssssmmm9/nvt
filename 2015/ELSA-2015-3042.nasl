# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2015-3042.nasl 6560 2017-07-06 11:58:38Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123103");
script_version("$Revision: 6560 $");
script_tag(name:"creation_date", value:"2015-10-06 09:47:56 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:58:38 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2015-3042");
script_tag(name: "insight", value: "ELSA-2015-3042 - Unbreakable Enterprise kernel security update - [2.6.39-400.250.5]- x86_64, vdso: Fix the vdso address randomization algorithm (Andy Lutomirski) [Orabug: 21226730] {CVE-2014-9585}- isofs: Fix infinite looping over CE entries (Jan Kara) [Orabug: 21225976] {CVE-2014-9420}- x86_64, switch_to(): Load TLS descriptors before switching DS and ES (Andy Lutomirski) [Orabug: 21225938] {CVE-2014-9419}[2.6.39-400.250.4]- IB/ipoib: Disable TSO in connected mode (Yuval Shaia) [Orabug: 20637991][2.6.39-400.250.3]- af_unix: dont send SCM_CREDENTIALS by default (Eric Dumazet) [Orabug: 20604916] - scm: Capture the full credentials of the scm sender (Tim Chen) [Orabug: 20604916] - af_unix: limit recursion level (Eric Dumazet) [Orabug: 20604916] - af_unix: Allow credentials to work across user and pid namespaces. (Eric W. Biederman) [Orabug: 20604916] - scm: Capture the full credentials of the scm sender. (Eric W. Biederman) [Orabug: 20604916] - BUG_ON(lockres->l_level != DLM_LOCK_EX && !checkpointed) tripped in ocfs2_ci_checkpointed (Tariq Saeed) [Orabug: 20189959] - sched: Prevent divide by zero when cpu power calculation is 0 (Todd Vierling) [Orabug: 17936435]"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2015-3042");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2015-3042.html");
script_cve_id("CVE-2014-9419","CVE-2014-9420","CVE-2014-9585");
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
  if ((res = isrpmvuln(pkg:"kernel-uek", rpm:"kernel-uek~2.6.39~400.250.5.el5uek", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-debug", rpm:"kernel-uek-debug~2.6.39~400.250.5.el5uek", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-debug-devel", rpm:"kernel-uek-debug-devel~2.6.39~400.250.5.el5uek", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-devel", rpm:"kernel-uek-devel~2.6.39~400.250.5.el5uek", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-doc", rpm:"kernel-uek-doc~2.6.39~400.250.5.el5uek", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-firmware", rpm:"kernel-uek-firmware~2.6.39~400.250.5.el5uek", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"kernel-uek", rpm:"kernel-uek~2.6.39~400.250.5.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-debug", rpm:"kernel-uek-debug~2.6.39~400.250.5.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-debug-devel", rpm:"kernel-uek-debug-devel~2.6.39~400.250.5.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-devel", rpm:"kernel-uek-devel~2.6.39~400.250.5.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-doc", rpm:"kernel-uek-doc~2.6.39~400.250.5.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-firmware", rpm:"kernel-uek-firmware~2.6.39~400.250.5.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

