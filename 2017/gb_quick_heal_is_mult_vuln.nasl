###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_quick_heal_is_mult_vuln.nasl 8169 2017-12-19 08:42:31Z cfischer $
#
# Quick Heal Internet Security Multiple Vulnerabilities
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:quick_heal:internet_security";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811552");
  script_version("$Revision: 8169 $");
  script_cve_id("CVE-2017-8773", "CVE-2017-8774", "CVE-2017-8775", "CVE-2017-8776");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-12-19 09:42:31 +0100 (Tue, 19 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-08-02 12:24:09 +0530 (Wed, 02 Aug 2017)");
  script_name("Quick Heal Internet Security Multiple Vulnerabilities");

  script_tag(name: "summary" , value:"This host is installed with Quick Heal
  Internet Security and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exists due to,

  - The PE files in the default installation do not use ASLR/DEP protection 
    mechanisms that provide sufficient defense against directed attacks against 
    the product.

  - A Memory Corruption error while parsing a malformed Mach-O file.

  - An Out of Bounds Write on a Heap Buffer due to improper validation of 
    dwCompressionSize of Microsoft WIM Header WIMHEADER_V1_PACKED.

  - A Memory Corruption error while parsing a malformed Mach-O file.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to gain Remote Code Execution as well as Privilege Escalation.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Quick Heal Internet Security 10.1.0.316
  and prior.");

  script_tag(name: "solution" , value:"The vendor has released multiple security patches to fix the vulnerabilities.
  For instructions and more information please refer to http://www.quickheal.com/quick-heal-antivirus-updates-download");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name : "URL" , value : "http://payatu.com/quick-heal-antivirus-protection-mechanism-failure-vulnerability");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_quick_heal_is_detect.nasl");
  script_mandatory_keys("QuickHeal/InternetSecurity/Installed");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
quickVer = infos['version'];
path = infos['location'];

## Check for InternetSecurity Versions less than or equal to 10.1.0.316
if(version_is_less_equal(version:quickVer, test_version:"10.1.0.316"))
{
  report = report_fixed_ver(installed_version:quickVer, fixed_version:"See references", install_path:path);
  security_message(data:report);
  exit(0);
}