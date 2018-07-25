###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_air_mult_vuln01_aug12_win.nasl 9353 2018-04-06 07:14:20Z cfischer $
#
# Adobe Air Multiple Vulnerabilities -01 August 12 (Windows)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:adobe:adobe_air";

tag_impact = "Successful exploitation will allow remote attackers to execute arbitrary
  code on the target system or cause a denial of service (memory corruption)
  via unspecified vectors.
  Impact Level: System/Application";

tag_summary = "This host is installed with Adobe Air and is prone to multiple
  vulnerabilities.";
tag_solution = "Update to Adobe Air version 3.4.0.2540 or later
  For updates refer to http://get.adobe.com/air";
tag_insight = "The flaws are due to memory corruption, integer overflow errors that
  could lead to code execution.";
tag_affected = "Adobe AIR version 3.3.0.3670 and earlier on Windows";

if(description)
{
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_oid("1.3.6.1.4.1.25623.1.0.803490");
  script_version("$Revision: 9353 $");
  script_cve_id("CVE-2012-4163", "CVE-2012-4164", "CVE-2012-4165", "CVE-2012-4166",
                "CVE-2012-4167", "CVE-2012-4168", "CVE-2012-4171", "CVE-2012-5054");
  script_bugtraq_id(55136, 55365);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-08-24 11:31:28 +0530 (Fri, 24 Aug 2012)");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  script_name("Adobe Air Multiple Vulnerabilities -01 August 12 (Windows)");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/50354");
  script_xref(name : "URL" , value : "http://www.adobe.com/support/security/bulletins/apsb12-19.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_win.nasl");
  script_mandatory_keys("Adobe/Air/Win/Installed");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
vers = infos['version'];
path = infos['location'];

# Grep for version 3.3.0.3670 and prior
if( version_is_less_equal( version:vers, test_version:"3.3.0.3670" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"3.4.0.2540", install_path:path );
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );