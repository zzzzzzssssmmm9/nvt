###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_drupal_mult_vuln02_may16_win.nasl 7545 2017-10-24 11:45:30Z cfischer $
#
# Drupal Multiple Vulnerabilities02- May16 (Windows)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
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

CPE = 'cpe:/a:drupal:drupal';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808044");
  script_version("$Revision: 7545 $");
  script_cve_id("CVE-2016-3168", "CVE-2016-3163", "CVE-2016-3169");
  script_tag(name:"cvss_base", value:"8.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 13:45:30 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2016-05-18 16:01:10 +0530 (Wed, 18 May 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Drupal Multiple Vulnerabilities02- May16 (Windows)");
  
  script_tag(name:"summary", value:"This host is running Drupal and is prone
  to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");
 
  script_tag(name:"insight", value:"Multiple flaws exixts due to,
  - An improper validation of JSON-encoded content in system module.
  - The XML-RPC system allows a large number of calls to the same method.
  - An error in 'user_save' function in User module.");
  
  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to cause brute force attacks, to download and execute JSON-encoded
  contet and also to gain elevated priveleges.

  Impact Level: Application");
  
  script_tag(name:"affected", value:"Drupal 6.x before 6.38 and 7.x before 7.43
  on Windows.");

  script_tag(name:"solution", value:"Upgrade to version 6.38 or 7.43 or later.
  For updates refer to https://www.drupal.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://www.drupal.org/SA-CORE-2016-001");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("drupal_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("drupal/installed","Host/runs_windows");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
drupalPort= 0;
drupalVer = "";

## Get HTTP Port
if(!drupalPort= get_app_port(cpe:CPE)){
  exit(0);
}

## Get Version
if(!drupalVer = get_app_version(cpe:CPE, port:drupalPort, version_regex:"^[0-9]\.[0-9]+")){
  exit(0);
}

if(drupalVer =~ "^(6|7)")
{
  ## Checking for Vulnerable version
  if(version_in_range(version:drupalVer, test_version:"6.0", test_version2:"6.37"))
  {
    fix = "6.38";
    VULN = TRUE;
  }

  else if(version_in_range(version:drupalVer, test_version:"7.0", test_version2:"7.42"))
  {
    fix = "7.43";
    VULN = TRUE;
  }

  if(VULN)
  {
    report = report_fixed_ver(installed_version:drupalVer, fixed_version:fix);
    security_message(data:report, port:drupalPort);
    exit(0);
  }
}
