###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_typo3_mult_vuln_dec_10.nasl 2014-01-09 15:55:26Z jan$
#
# TYPO3 Multiple Vulnerabilities Dec10
#
# Authors:
# Shashi Kiran N <nskiran@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH
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

SCRIPT_OID = "1.3.6.1.4.1.25623.1.0.804220";
CPE = "cpe:/a:typo3:typo3";

if(description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 6769 $");
  script_cve_id("CVE-2010-5097", "CVE-2010-5098", "CVE-2010-5099", "CVE-2010-5100",
                "CVE-2010-5101", "CVE-2010-5102", "CVE-2010-5103", "CVE-2010-5104");
  script_bugtraq_id(45470);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
 script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"last_modification", value:"$Date: 2017-07-20 11:56:33 +0200 (Thu, 20 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-01-09 15:55:26 +0530 (Thu, 09 Jan 2014)");
  script_name("TYPO3 Multiple Vulnerabilities Dec10");

tag_summary =
"This host is installed with TYPO3 and is prone to multiple vulnerabilities.";

tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

tag_insight =
'Multiple error exists in the application,
- An error exist in fileDenyPattern functionality, which does not properly
filter file types.
- An error exist enlarge functionality,FORM content object, list module and
class.em_unzip.php script, which fails to validate certain user provided
input properly.
- An error exist in escapeStrForLike method, which does not properly escape
input when the MySQL database is set to sql_mode NO_BACKSLASH_ESCAPES.';

tag_impact =
"Successful exploitation will allow remote attackers to get sensitive
information or execute SQL commands.

Impact Level: Application";

tag_affected =
"TYPO3 version 4.2.x before 4.2.16, 4.3.x before 4.3.9, and 4.4.x before 4.4.5";

tag_solution =
"Upgrade to TYPO3 version 4.2.16, 4.3.9, 4.4.5 or later,
For updates refer to, http://typo3.org/";


  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "affected" , value : tag_affected);

  script_xref(name : "URL" , value : "http://secunia.com/advisories/35770");
  script_xref(name : "URL" , value : "http://typo3.org/teams/security/security-bulletins/typo3-core/typo3-sa-2010-022/");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_dependencies("gb_typo3_detect.nasl");
  script_mandatory_keys("TYPO3/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("version_func.inc");
include("host_details.inc");
include("global_settings.inc");

## Variable initialisation
typoPort = "";
typoVer = "";

## Get Application HTTP Port
if(!typoPort = get_app_port(cpe:CPE, nvt:SCRIPT_OID)){
  exit(0);
}

if(typoVer = get_app_version(cpe:CPE, nvt:SCRIPT_OID, port:typoPort))
{
  if( typoVer !~ "[0-9]+\.[0-9]+\.[0-9]+" ) exit( 0 ); # Version is not exact enough
  ## Check for version
  if(version_in_range(version:typoVer, test_version:"4.2.0", test_version2:"4.2.15") ||
     version_in_range(version:typoVer, test_version:"4.3.0", test_version2:"4.3.8") ||
     version_in_range(version:typoVer, test_version:"4.4.0", test_version2:"4.4.4"))
  {
    security_message(typoPort);
    exit(0);
  }
}
