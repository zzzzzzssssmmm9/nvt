###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for nss-util CESA-2016:0370 centos7 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.882415");
  script_version("$Revision: 6658 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:51:48 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-03-10 06:15:59 +0100 (Thu, 10 Mar 2016)");
  script_cve_id("CVE-2016-1950");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for nss-util CESA-2016:0370 centos7 ");
  script_tag(name: "summary", value: "Check the version of nss-util");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Network Security Services (NSS) is a set of 
libraries designed to support the cross-platform development of security-enabled 
client and server applications. The nss-util package provides a set of utilities 
for NSS and the Softoken module.

A heap-based buffer overflow flaw was found in the way NSS parsed certain
ASN.1 structures. An attacker could use this flaw to create a specially
crafted certificate which, when parsed by NSS, could cause it to crash, or
execute arbitrary code, using the permissions of the user running an
application compiled against the NSS library. (CVE-2016-1950)

Red Hat would like to thank the Mozilla project for reporting this issue.
Upstream acknowledges Francis Gabriel as the original reporter.

All nss-util users are advised to upgrade to these updated packages, which
contain a backported patch to correct this issue. For the update to take
effect, all applications linked to the nss and nss-util library must be
restarted, or the system rebooted.
");
  script_tag(name: "affected", value: "nss-util on CentOS 7");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2016:0370");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2016-March/021718.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS7")
{

  if ((res = isrpmvuln(pkg:"nss-util", rpm:"nss-util~3.19.1~9.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-util-devel", rpm:"nss-util-devel~3.19.1~9.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
