###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_code_exec_vuln_jun13_win.nasl 9353 2018-04-06 07:14:20Z cfischer $
#
# Adobe Flash Player Remote Code Execution Vulnerability -June13 (Windows)
#
# Authors:
# Arun Kallavi <karun@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:adobe:flash_player";

tag_impact = "Successful exploitation will allow remote attackers to execute arbitrary
  code on the target system or cause a denial of service (memory corruption)
  via unspecified vectors.
  Impact Level: System/Application";

tag_affected = "Adobe Flash Player version 10.3.183.86 and earlier and 11.x to 11.7.700.202
  on Windows";
tag_insight = "Unspecified flaw due to improper sanitization of user-supplied input.";
tag_solution = "Update to Adobe Flash Player 10.3.183.90 or 11.7.700.224 or later
  For updates refer to  http://get.adobe.com/flashplayer";
tag_summary = "This host is installed with Adobe Flash Player and is prone to
  remote code execution vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803661");
  script_version("$Revision: 9353 $");
  script_cve_id("CVE-2013-3343");
  script_bugtraq_id(60478);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-06-18 13:23:17 +0530 (Tue, 18 Jun 2013)");
  script_name("Adobe Flash Player Remote Code Execution Vulnerability -June13 (Windows)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/53751");
  script_xref(name : "URL" , value : "http://www.adobe.com/support/security/bulletins/apsb13-16.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_win.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Win/Installed");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
vers = infos['version'];
path = infos['location'];

## Grep for vulnerable version
if( version_is_less_equal( version:vers, test_version:"10.3.183.86" ) ||
    version_in_range( version:vers, test_version:"11.0", test_version2:"11.7.700.202" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"10.3.183.90 or 11.7.700.224", install_path:path );
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );