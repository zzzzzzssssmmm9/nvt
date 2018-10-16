###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_phpmyadmin_mult_vuln01_dec16_lin.nasl 11501 2018-09-20 12:19:13Z mmartin $
#
# phpMyAdmin SQL Injection and Multiple XSS Vulnerabilities Dec16 (Linux)
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.108125");
  script_version("$Revision: 11501 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-20 14:19:13 +0200 (Thu, 20 Sep 2018) $");
  script_tag(name:"creation_date", value:"2017-04-10 12:18:02 +0200 (Mon, 10 Apr 2017)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2016-6617", "CVE-2016-6608");
  script_name("phpMyAdmin SQL Injection and Multiple XSS Vulnerabilities Dec16 (Linux)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_phpmyadmin_detect_900129.nasl", "os_detection.nasl");
  script_mandatory_keys("phpMyAdmin/installed", "Host/runs_unixoide");

  script_tag(name:"summary", value:"phpMyAdmin is prone to a SQL injection and multiple cross-site scripting vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"insight", value:"Multiple XSS vulnerabilities were found in the following areas:

  - database privilege check

  - Remove partitioning functionality

  An additional vulnerability was found in the export functionality:

  - a specially crafted database and/or table name can be used to trigger an SQL injection attack.");

  script_tag(name:"affected", value:"phpMyAdmin versions 4.6.x prior to 4.6.4.");

  script_tag(name:"solution", value:"Update to version 4.6.4 or later.");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( vers =~ "^4\.6\." ) {
  if( version_is_less( version:vers, test_version:"4.6.4" ) ) {
    report = report_fixed_ver( installed_version:vers, fixed_version:"4.6.4" );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );
