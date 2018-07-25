###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_teampass_sql_inj_vuln.nasl 7919 2017-11-28 07:45:29Z asteins $
#
# TeamPass SQL Injection Vulnerability
#
# Authors:
# Adrian Steins <adrian.steins@greenbone.net>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH
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

CPE = 'cpe:/a:teampass:teampass';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.112143");
  script_version("$Revision: 7919 $");
  script_cve_id("CVE-2017-9436");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-11-28 08:45:29 +0100 (Tue, 28 Nov 2017) $");
  script_tag(name:"creation_date", value:"2017-11-28 09:01:00 +0100 (Tue, 28 Nov 2017)");
  script_name("TeamPass SQL Injection Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_teampass_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("teampass/installed");

  script_xref(name:"URL", value:"https://github.com/nilsteampassnet/TeamPass/blob/master/changelog.md");

  script_tag(name:"summary", value:"This host is installed with TeamPass and
  is prone to an sql injection vulnerability in users.queries.php.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of the detect NVT and check if the version is vulnerable or not.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker to read sensitive data and/or modify database data.");

  script_tag(name:"affected", value:"TeamPass before version 2.1.27.4.");

  script_tag(name:"solution", value:"Upgrade to TeamPass 2.1.27.4 or later,
  For updates refer to http://teampass.net/");

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less( version:vers, test_version:"2.1.27.4" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"2.1.27.4" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );