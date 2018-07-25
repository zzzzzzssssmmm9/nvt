###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_mult_vuln_mar11_win01.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# Wireshark Multiple Vulnerabilities March-11 (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

tag_impact = "Successful exploitation could allow remote attackers to cause a denial of
  service.
  Impact Level: Application";
tag_affected = "Wireshark 1.0.x
  Wireshark version 1.2.0 through 1.2.14
  Wireshark version 1.4.0 through 1.4.3";
tag_insight = "The flaws are due to
  - Multiple stack consumption vulnerabilities in the
    'dissect_ms_compressed_string' and 'dissect_mscldap_string functions'
  - Error in 'epan/dissectors/packet-ldap.c' which allows attackers to cause
    a denial of service via a long LDAP filter string or an LDAP filter string
    containing many elements.";
tag_solution = "Upgrade to the Wireshark version 1.4.4 or 1.2.15
  For updates refer to http://www.wireshark.org/download.html";
tag_summary = "The host is installed with Wireshark and is prone to multiple
  vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801757");
  script_version("$Revision: 9351 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-03-09 16:08:21 +0100 (Wed, 09 Mar 2011)");
  script_cve_id("CVE-2011-1140", "CVE-2011-1141");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_name("Wireshark Multiple Vulnerabilities March-11 (Windows)");
  script_xref(name : "URL" , value : "http://www.wireshark.org/security/wnpa-sec-2011-03.html");
  script_xref(name : "URL" , value : "http://www.wireshark.org/security/wnpa-sec-2011-04.html");
  script_xref(name : "URL" , value : "http://www.wireshark.org/docs/relnotes/wireshark-1.4.4.html");
  script_xref(name : "URL" , value : "http://www.wireshark.org/docs/relnotes/wireshark-1.2.15.html");

  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_family("General");
  script_dependencies("gb_wireshark_detect_win.nasl");
  script_require_keys("Wireshark/Win/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("version_func.inc");

## Get the version from KB
wiresharkVer = get_kb_item("Wireshark/Win/Ver");
if(!wiresharkVer){
  exit(0);
}

## Check for Wireshark Version
if(version_in_range(version:wiresharkVer, test_version:"1.0", test_version2:"1.0.16")||
   version_in_range(version:wiresharkVer, test_version:"1.2.0", test_version2:"1.2.14")||
   version_in_range(version:wiresharkVer, test_version:"1.4.0", test_version2:"1.4.3")){
  security_message(0);
}
