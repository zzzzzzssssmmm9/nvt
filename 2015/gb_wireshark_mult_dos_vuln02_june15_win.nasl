###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_mult_dos_vuln02_june15_win.nasl 2015-06-01 17:26:23 +0530 Jun$
#
# Wireshark Multiple Denial-of-Service Vulnerabilities-02 June15 (Windows)
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
  script_oid("1.3.6.1.4.1.25623.1.0.805393");
  script_version("$Revision: 6254 $");
  script_cve_id("CVE-2015-3814", "CVE-2015-3812", "CVE-2015-3811");
  script_bugtraq_id(74637, 74635, 74631);
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-05-31 11:04:18 +0200 (Wed, 31 May 2017) $");
  script_tag(name:"creation_date", value:"2015-06-01 17:26:23 +0530 (Mon, 01 Jun 2015)");
  script_name("Wireshark Multiple Denial-of-Service Vulnerabilities-02 June15 (Windows)");

  script_tag(name: "summary" , value:"This host is installed with Wireshark
  and is prone to multiple denial of service vulnerabilities.");

  script_tag(name: "vuldetect" , value: "Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value: "Multiple flaws are due to,
  - The X11 dissector that is triggered when handling a specially crafted
  packet, which can result in a memory leak.
  - 'epan/dissectors/packet-wcp.c' in the WCP dissector improperly refers to
  previously processed bytes.
  - The IEEE 802.11 dissector that is triggered when handling a malformed
  packet, which can result in an infinite loop.");

  script_tag(name: "impact" , value: "Successful exploitation will allow remote
  attackers to conduct denial of service attack.

  Impact Level: Application");

  script_tag(name: "affected" , value: "Wireshark version 1.10.x before 1.10.14
  and 1.12.x before 1.12.5 on Windows");

  script_tag(name: "solution" , value: "Upgrade to version 1.10.14 or 1.12.5 or later,
  For updates refer to https://www.wireshark.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2015-18.html");
  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_dependencies("gb_wireshark_detect_win.nasl");
  script_mandatory_keys("Wireshark/Win/Ver");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

## Variable Initialization
wirversion = "";

## Get the version
if(!wirversion = get_app_version(cpe:CPE)){
  exit(0);
}

## Check the vulnerable version is 1.10.x before 1.12.14
if(version_in_range(version:wirversion, test_version:"1.10.0", test_version2:"1.10.13"))
{
  fix = "1.10.14";
  VULN = TRUE;
}


## Check the vulnerable version is 1.12.x before 1.12.5
if(version_in_range(version:wirversion, test_version:"1.12.0", test_version2:"1.12.4"))
{
  fix = "1.12.5";
  VULN = TRUE;
}

if(VULN)
{
  report = 'Installed Version: ' + wirversion + '\n' +
           'Fixed Version:     ' + fix + '\n';
  security_message(data:report);
  exit(0);
}


