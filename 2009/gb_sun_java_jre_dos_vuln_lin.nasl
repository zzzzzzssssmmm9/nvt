###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_sun_java_jre_dos_vuln_lin.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Sun Java JRE Multiple Vulnerabilities (Linux)
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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
###############################################################################

tag_impact = "Successful exploitation allows remote attacker to cause XSS, arbitrary code
  execution, various buffer overflows, bypass security restrictions and can
  cause denial of service attacks inside the context of the affected system.
  Impact Level: System";
tag_affected = "Sun Java JRE 6 Update 12 and prior.
  Sun Java JRE 5.0 Update 17 and prior.
  Sun Java JRE 1.4.2_19 and prior.
  Sun Java JRE 1.3.1_24 and prior.";
tag_insight = "For more information about vulnerabilities on Sun Java go through reference.";
tag_solution = "Upgrade to JDK/JRE version 6 Update 13
  http://java.sun.com/javase/downloads/index.jsp
  OR
  Upgrade to JDK/JRE version 5 Update 18
  http://java.sun.com/javase/downloads/index_jdk5.jsp
  OR
  Upgrade to SDK/JRE version 1.4.2_20
  http://java.sun.com/j2se/1.4.2/download.html
  OR
  Upgrade to SDK/JRE version 1.3.1_25
  http://java.sun.com/j2se/1.3/download.html";
tag_summary = "This host is installed with Sun Java JRE and is prone to
  Multiple Vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800386");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-04-23 08:16:04 +0200 (Thu, 23 Apr 2009)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-1093", "CVE-2009-1094", "CVE-2009-1095", "CVE-2009-1096",
                "CVE-2009-1097", "CVE-2009-1098", "CVE-2009-1099", "CVE-2009-1100",
                "CVE-2009-1101", "CVE-2009-1102", "CVE-2009-1103", "CVE-2009-1104",
                "CVE-2009-1105", "CVE-2009-1106", "CVE-2009-1107");
  script_bugtraq_id(34240);
  script_name("Sun Java JRE Multiple Vulnerabilities (Linux)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/34489");
  script_xref(name : "URL" , value : "http://rhn.redhat.com/errata/RHSA-2009-0394.html");
  script_xref(name : "URL" , value : "http://sunsolve.sun.com/search/document.do?assetkey=1-66-254569-1");
  script_xref(name : "URL" , value : "http://lists.opensuse.org/opensuse-security-announce/2009-04/msg00001.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_java_prdts_detect_lin.nasl");
  script_require_keys("Sun/Java/JRE/Linux/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

jreVer = get_kb_item("Sun/Java/JRE/Linux/Ver");
if(!jreVer){
  exit(0);
}

if(jreVer)
{
  # Check for 1.3 < 1.3.1_25, 1.4 < 1.4.2_20, 1.5 < 1.5.0_18 (5 Update 18),
  # and 1.6 < 1.6.0_13 (6 Update 13)
  if(version_in_range(version:jreVer, test_version:"1.3", test_version2:"1.3.1.24") ||
     version_in_range(version:jreVer, test_version:"1.4", test_version2:"1.4.2.19") ||
     version_in_range(version:jreVer, test_version:"1.5", test_version2:"1.5.0.17") ||
     version_in_range(version:jreVer, test_version:"1.6", test_version2:"1.6.0.12")) {
    security_message(0);
  }
}
