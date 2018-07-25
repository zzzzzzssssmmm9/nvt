###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for scsi-target-utils CESA-2010:0518 centos5 i386
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");
tag_insight = "The scsi-target-utils package contains the daemon and tools to set up and
  monitor SCSI targets. Currently, iSCSI software and iSER targets are
  supported.

  Multiple buffer overflow flaws were found in scsi-target-utils' tgtd
  daemon. A remote attacker could trigger these flaws by sending a
  carefully-crafted Internet Storage Name Service (iSNS) request, causing the
  tgtd daemon to crash. (CVE-2010-2221)
  
  Red Hat would like to thank the Vulnerability Research Team at TELUS
  Security Labs and Fujita Tomonori for responsibly reporting these flaws.
  
  All scsi-target-utils users should upgrade to this updated package, which
  contains a backported patch to correct these issues. All running
  scsi-target-utils services must be restarted for the update to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "scsi-target-utils on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2010-July/016763.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880655");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name: "CESA", value: "2010:0518");
  script_cve_id("CVE-2010-2221");
  script_name("CentOS Update for scsi-target-utils CESA-2010:0518 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of scsi-target-utils");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");


res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"scsi-target-utils", rpm:"scsi-target-utils~0.0~6.20091205snap.el5_5.3", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
