###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_gsa_dos_vuln_0216.nasl 6871 2017-08-08 12:27:18Z emoss $
#
# Greenbone Security Assistant 6.0 < 6.0.9 Denial-of-Service Vulnerability
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
# of the License, or (at your option) any later version.
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

CPE = "cpe:/a:greenbone:greenbone_security_assistant";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.108195");
  script_version("$Revision: 6871 $");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-08-08 14:27:18 +0200 (Tue, 08 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-07-26 13:00:00 +0200 (Wed, 26 Jul 2017)");
  script_name("Greenbone Security Assistant 6.0 < 6.0.9 Denial-of-Service Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_gsa_detect.nasl");
  script_require_ports("Services/www", 80, 443, 9392);
  script_mandatory_keys("gsa/installed");

  script_xref(name:"URL", value:"http://openvas.org/OVSA20160202.html");

  script_tag(name:"summary", value:"It has been identified that Greenbone Security Assistant (GSA)
  is vulnerable to a denial-of-service attack.");

  script_tag(name:"insight", value:"The flaw exists due to a improper handling of UTF-8 in GET and POST requests.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of the detect NVT and check if the
  version is vulnerable or not.");

  script_tag(name:"impact", value:"Given the attacker has access to a GSA web interface, a respective HTTP request can crash gsad. 

  Impact Level: Application");

  script_tag(name:"affected", value:"Greenbone Security Assistant version 6.0.x before 6.0.9.");

  script_tag(name:"solution", value:"Update Greenbone Security Assistant to version 6.0.9 or later."); 

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_in_range( version:vers, test_version:"6.0.0", test_version2:"6.0.8" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"6.0.9" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
