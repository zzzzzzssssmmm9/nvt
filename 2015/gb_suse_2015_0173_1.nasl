###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2015_0173_1.nasl 8046 2017-12-08 08:48:56Z santu $
#
# SuSE Update for Mozilla SUSE-SU-2015:0173-1 (Mozilla)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851048");
  script_version("$Revision: 8046 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-08 09:48:56 +0100 (Fri, 08 Dec 2017) $");
  script_tag(name:"creation_date", value:"2015-10-16 18:54:35 +0200 (Fri, 16 Oct 2015)");
  script_cve_id("CVE-2014-1569", "CVE-2014-8634", "CVE-2014-8636", "CVE-2014-8637", "CVE-2014-8638", "CVE-2014-8639", "CVE-2014-8640", "CVE-2014-8641");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for Mozilla SUSE-SU-2015:0173-1 (Mozilla)");
  script_tag(name: "summary", value: "Check the version of Mozilla");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  Mozilla Firefox has been updated to the 31.4.0ESR release, fixing bugs and
  security issues.

  Mozilla NSS has been updated to 3.17.3, fixing a security issue and
  updating the root certificates list.

  For more information, please refer to
 https://www.mozilla.org/en-US/security/advisories/
  Security Issues:

  * CVE-2014-1569
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-1569 
  * CVE-2014-8634
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-8634 
  * CVE-2014-8639
  http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-8639 
  * CVE-2014-8641
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-8641 
  * CVE-2014-8638
  http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-8638 
  * CVE-2014-8636
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-8636 
  * CVE-2014-8637
 http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-8637 
  * CVE-2014-8640
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-8640");
  script_tag(name: "affected", value: "Mozilla on SUSE Linux Enterprise Server 11 SP2 LTSS, SUSE Linux Enterprise Server 11 SP1 LTSS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "SUSE-SU", value: "2015:0173_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "SLES11.0SP2")
{

  if ((res = isrpmvuln(pkg:"MozillaFirefox", rpm:"MozillaFirefox~31.4.0esr~0.3.1", rls:"SLES11.0SP2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-translations", rpm:"MozillaFirefox-translations~31.4.0esr~0.3.1", rls:"SLES11.0SP2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libfreebl3", rpm:"libfreebl3~3.17.3~0.3.1", rls:"SLES11.0SP2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mozilla-nss", rpm:"mozilla-nss~3.17.3~0.3.1", rls:"SLES11.0SP2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mozilla-nss-devel", rpm:"mozilla-nss-devel~3.17.3~0.3.1", rls:"SLES11.0SP2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mozilla-nss-tools", rpm:"mozilla-nss-tools~3.17.3~0.3.1", rls:"SLES11.0SP2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libfreebl3-32bit", rpm:"libfreebl3-32bit~3.17.3~0.3.1", rls:"SLES11.0SP2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mozilla-nss-32bit", rpm:"mozilla-nss-32bit~3.17.3~0.3.1", rls:"SLES11.0SP2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "SLES11.0SP1")
{

  if ((res = isrpmvuln(pkg:"MozillaFirefox", rpm:"MozillaFirefox~31.4.0esr~0.3.1", rls:"SLES11.0SP1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-translations", rpm:"MozillaFirefox-translations~31.4.0esr~0.3.1", rls:"SLES11.0SP1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libfreebl3", rpm:"libfreebl3~3.17.3~0.3.1", rls:"SLES11.0SP1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mozilla-nss", rpm:"mozilla-nss~3.17.3~0.3.1", rls:"SLES11.0SP1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mozilla-nss-tools", rpm:"mozilla-nss-tools~3.17.3~0.3.1", rls:"SLES11.0SP1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libfreebl3-32bit", rpm:"libfreebl3-32bit~3.17.3~0.3.1", rls:"SLES11.0SP1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mozilla-nss-32bit", rpm:"mozilla-nss-32bit~3.17.3~0.3.1", rls:"SLES11.0SP1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}