# OpenVAS Vulnerability Test
# Description: Amazon Linux security check
# $Id: alas-2016-740.nasl 6574 2017-07-06 13:41:26Z cfischer $
# 
# Authors:
# Autogenerated by alas-generator developed by Eero Volotinen <eero.volotinen@iki.fi>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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
script_oid("1.3.6.1.4.1.25623.1.0.120729");
script_version("$Revision: 6574 $");
script_tag(name:"creation_date", value:"2016-10-26 15:38:23 +0300 (Wed, 26 Oct 2016)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:41:26 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: alas-2016-740");
script_tag(name: "insight", value: "A use after free vulnerability was found in tcp_xmit_retransmit_queue and other tcp_* functions."); 
script_tag(name : "solution", value : "Run yum update kernel to update your system. You will need to reboot your system in order for the new kernel to be running.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2016-740.html");
script_cve_id("CVE-2016-6828");
script_tag(name:"cvss_base", value:"4.9");
script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:N/A:C");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/amazon_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_tag(name:"summary", value:"Amazon Linux Local Security Checks");
script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
script_family("Amazon Linux Local Security Checks");
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

if(release == "AMAZON")
{
  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~4.4.19~29.55.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~4.4.19~29.55.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-debuginfo-common-i686", rpm:"kernel-debuginfo-common-i686~4.4.19~29.55.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-tools", rpm:"kernel-tools~4.4.19~29.55.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-tools-debuginfo", rpm:"kernel-tools-debuginfo~4.4.19~29.55.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-debuginfo", rpm:"kernel-debuginfo~4.4.19~29.55.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-tools-devel", rpm:"kernel-tools-devel~4.4.19~29.55.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~4.4.19~29.55.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"perf-debuginfo", rpm:"perf-debuginfo~4.4.19~29.55.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"perf", rpm:"perf~4.4.19~29.55.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~4.4.19~29.55.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-debuginfo-common-x86_64", rpm:"kernel-debuginfo-common-x86_64~4.4.19~29.55.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); #Not vulnerable
    exit(0);
}
