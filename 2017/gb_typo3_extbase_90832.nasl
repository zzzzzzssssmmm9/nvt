###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_typo3_extbase_90832.nasl 5351 2017-02-20 08:03:12Z mwiegand $
#
# TYPO3 Extbase Remote Code Execution Vulnerability
#
# Authors:
# Christian Fischer <christian.fischer@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
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

CPE = "cpe:/a:typo3:typo3";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.108058");
  script_version("$Revision: 5351 $");
  script_cve_id("CVE-2016-5091");
  script_bugtraq_id(90832);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-02-20 09:03:12 +0100 (Mon, 20 Feb 2017) $");
  script_tag(name:"creation_date", value:"2017-01-25 13:00:00 +0100 (Wed, 25 Jan 2017)");
  script_name("TYPO3 Extbase Remote Code Execution Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_typo3_detect.nasl");
  script_mandatory_keys("TYPO3/installed");
  script_require_ports("Services/www", 80);

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/90832");
  script_xref(name:"URL", value:"https://typo3.org/teams/security/security-bulletins/typo3-core/typo3-core-sa-2016-013/");

  script_tag(name:"impact", value:"A remote attacker can leverage this issue to execute arbitrary code within the context
  of the application. Successful exploits will compromise the application and possibly the underlying system.

  Impact Level: System/Application");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of the detect NVT and check if the version
  is vulnerable or not.");

  script_tag(name:"insight", value:"Extbase request handling fails to implement a proper access check for requested
  controller/ action combinations, which makes it possible for an attacker to execute arbitrary Extbase actions by
  crafting a special request. To successfully exploit this vulnerability, an attacker must have access to at least
  one Extbase plugin or module action in a TYPO3 installation.");

  script_tag(name:"solution", value:"Upgrade to TYPO3 version 6.2.24, 7.6.8 or 8.1.1 or later,
  For updates refer to, http://typo3.org/");

  script_tag(name:"summary", value:"This host is installed with TYPO3 and is prone to a remote code-execution vulnerability.");

  script_tag(name:"affected", value:"TYPO3 versions from 4.3.0 to 6.2.23, 7.x before 7.6.8, and 8.1.0");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port, version_regex:"[0-9]+\.[0-9]+\.[0-9]+" ) ) exit( 0 );

if( version_in_range( version:vers, test_version:"4.3.0", test_version2:"6.2.23" ) ) {
  vuln = TRUE;
  fix = "6.2.24";
}

if( vers =~ "^7") {
  if( version_is_less( version:vers, test_version:"7.6.8" ) ) {
    vuln = TRUE;
    fix = "7.6.8";
  }
}

if( version_is_equal( version:vers, test_version:"8.1.0" ) ) {
  vuln = TRUE;
  fix = "8.1.1";
}

if( vuln ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:fix );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );