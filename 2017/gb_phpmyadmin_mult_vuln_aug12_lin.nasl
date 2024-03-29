###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_phpmyadmin_mult_vuln_aug12_lin.nasl 7543 2017-10-24 11:02:02Z cfischer $
#
# phpMyAdmin Multiple XSS Vulnerabilities Aug11 (Linux)
#
# Authors:
# Christian Fischer <christian.fischer@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:phpmyadmin:phpmyadmin";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.108212");
  script_version("$Revision: 7543 $");
  script_tag(name:"last_modification", value: "$Date: 2017-10-24 13:02:02 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-08-16 12:18:02 +0200 (Wed, 16 Aug 2017)");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");
  script_cve_id("CVE-2012-4345", "CVE-2012-4579");
  script_name("phpMyAdmin Multiple XSS Vulnerabilities Aug12 (Linux)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_phpmyadmin_detect_900129.nasl", "os_detection.nasl");
  script_mandatory_keys("phpMyAdmin/installed", "Host/runs_unixoide");

  script_xref(name:"URL", value:"https://www.phpmyadmin.net/security/PMASA-2012-4/");

  script_tag(name:"summary", value:"phpMyAdmin is prone to multiple cross-site scripting vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"affected", value:"phpMyAdmin versions 3.5.x before 3.5.2.2");

  script_tag(name:"solution", value:"Update to version 3.5.2.2 or later.");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( vers =~ "^3\.5\." ) {
  if( version_is_less( version:vers, test_version:"3.5.2.2" ) ) {
    report = report_fixed_ver( installed_version:vers, fixed_version:"3.5.2.2" );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );
