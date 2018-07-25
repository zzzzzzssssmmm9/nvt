###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_mult_dos_vuln01_jan15_macosx.nasl 6391 2017-06-21 09:59:48Z teissa $
#
# Wireshark Multiple Denial-of-Service Vulnerabilities -01 Jan15 (Mac OS X)
#
# Authors:
# Deependra Bapna <bdeependra@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:wireshark:wireshark";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805323");
  script_version("$Revision: 6391 $");
  script_cve_id("CVE-2015-0564", "CVE-2015-0563", "CVE-2015-0562", "CVE-2015-0561",
                "CVE-2015-0560", "CVE-2015-0559");
  script_bugtraq_id(71922, 71916, 71921, 71917, 71919, 71918);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-06-21 11:59:48 +0200 (Wed, 21 Jun 2017) $");
  script_tag(name:"creation_date", value:"2015-01-14 08:43:33 +0530 (Wed, 14 Jan 2015)");
  script_name("Wireshark Multiple Denial-of-Service Vulnerabilities -01 Jan15 (Mac OS X)");

  script_tag(name: "summary" , value:"This host is installed with Wireshark
  and is prone to multiple denial-of-service vulnerabilities.");

  script_tag(name: "vuldetect" , value: "Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value: "Multiple flaws are due to,
  - An error within the SMTP dissector.
  - An error within the DEC DNA Routing Protocol dissector.
  - An error within the LPP dissector.
  - Two errors within the WCCP dissector.
  - An error when decypting TLS/SSL sessions.");

  script_tag(name: "impact" , value: "Successful exploitation will allow
  attackers to conduct multiple denial-of-service attacks.

  Impact Level: Application");

  script_tag(name: "affected" , value: "Wireshark 1.10.x before 1.10.12 and
  1.12.x before 1.12.3 on Mac OS X");

  script_tag(name: "solution" , value: "Upgrade to Wireshark version 1.10.12,
  1.12.3 or later, For updates refer to https://www.wireshark.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/62020");
  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2015-01.html");
  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2015-02.html");
  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2015-03.html");
  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2015-04.html");
  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2015-04.html");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"executable_version");
  script_family("Denial of Service");
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_dependencies("gb_wireshark_detect_macosx.nasl");
  script_mandatory_keys("Wireshark/MacOSX/Version");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

## Variable Initialization
wirVer = "";

## Get the version
if(!wirVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Check the vulnerable version is 1.10.x before 1.10.12 and 1.12.x before 1.12.3
if(version_in_range(version:wirVer, test_version:"1.10.0", test_version2:"1.10.11") ||
   version_in_range(version:wirVer, test_version:"1.12.0", test_version2:"1.12.2"))
{
  security_message(0);
  exit(0);
}
