###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_cobra_idl_dissector_dos_vuln_win.nasl 5850 2017-04-04 09:01:03Z teissa $
#
# Wireshark CORBA IDL Dissector Denial of Service Vulnerability (Windows)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:wireshark:wireshark:x64";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808284");
  script_version("$Revision: 5850 $");
  script_cve_id("CVE-2016-6503");
  script_bugtraq_id(92162);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-04-04 11:01:03 +0200 (Tue, 04 Apr 2017) $");
  script_tag(name:"creation_date", value:"2016-08-09 10:31:32 +0530 (Tue, 09 Aug 2016)");
  script_name("Wireshark CORBA IDL Dissector Denial of Service Vulnerability (Windows)");
  
  script_tag(name:"summary", value:"This host is installed with Wireshark
  and is prone to denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to CORBA IDL dissectors in 
  Wireshark do not properly interact with Visual C++ compiler options.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to conduct denial of service attack.

  Impact Level: Application");

  script_tag(name:"affected", value:"Wireshark version 2.0.x before 2.0.5
  on 64-bit Windows.");

  script_tag(name:"solution", value:"Upgrade to Wireshark version 2.0.5 or
  later.
  For updates refer to https://www.wireshark.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"http://openwall.com/lists/oss-security/2016/07/28/3");
  script_xref(name:"URL", value:"https://www.wireshark.org/security/wnpa-sec-2016-39.html");

  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_wireshark_detect_win.nasl");
  script_mandatory_keys("Wireshark64/Win/Ver");
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

## Check the vulnerable version 
if(version_in_range(version:wirversion, test_version:"2.0.0", test_version2:"2.0.4"))
{
  report = report_fixed_ver(installed_version:wirversion, fixed_version:"2.0.5");
  security_message(data:report);
  exit(0);
}
