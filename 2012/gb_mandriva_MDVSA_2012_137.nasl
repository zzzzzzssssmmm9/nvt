###############################################################################
# OpenVAS Vulnerability Test
#
# Mandriva Update for acpid MDVSA-2012:137 (acpid)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "Multiple vulnerabilities has been discovered and corrected in acpid:

  Oliver-Tobias Ripka discovered that an ACPI script incorrectly handled
  power button events. A local attacker could use this to execute
  arbitrary code, and possibly escalate privileges (CVE-2011-2777).

  Helmut Grohne and Michael Biebl discovered that ACPI scripts were
  executed with a permissive file mode creation mask (umask). A local
  attacker could read files and modify directories created by ACPI
  scripts that did not set a strict umask (CVE-2011-4578).

  The updated packages have been patched to correct these issues.";

tag_affected = "acpid on Mandriva Linux 2011.0";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://www.mandriva.com/en/support/security/advisories/?name=MDVSA-2012:137");
  script_oid("1.3.6.1.4.1.25623.1.0.831724");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-08-21 11:46:05 +0530 (Tue, 21 Aug 2012)");
  script_cve_id("CVE-2011-2777", "CVE-2011-4578");
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name: "MDVSA", value: "2012:137");
  script_name("Mandriva Update for acpid MDVSA-2012:137 (acpid)");

  script_tag(name: "summary" , value: "Check for the Version of acpid");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Mandrake Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/mandriva_mandrake_linux", "ssh/login/release");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
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

if(release == "MNDK_2011.0")
{

  if ((res = isrpmvuln(pkg:"acpid", rpm:"acpid~2.0.10~1.1", rls:"MNDK_2011.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
