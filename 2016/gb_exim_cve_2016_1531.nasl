###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_exim_cve_2016_1531.nasl 11493 2018-09-20 09:02:35Z asteins $
#
# Exim Local Root / Privilege Escalation Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

CPE = 'cpe:/a:exim:exim';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105568");
  script_cve_id("CVE-2016-1531");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_version("$Revision: 11493 $");

  script_name("Exim Local Root / Privilege Escalation Vulnerability");

  script_xref(name:"URL", value:"http://www.exim.org/static/doc/CVE-2016-1531.txt");

  script_tag(name:"insight", value:"When Exim installation has been compiled with Perl support and contains a  perl_startup configuration variable it can be exploited by malicious local attackers to gain root privileges.");

  script_tag(name:"vuldetect", value:"Check the version from SMTP banner");
  script_tag(name:"solution", value:"Update to Exim 4.86.2 or newer.");
  script_tag(name:"summary", value:"Exim < 4.86.2 Local Root Privilege Escalation");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-09-20 11:02:35 +0200 (Thu, 20 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-03-15 13:17:46 +0100 (Tue, 15 Mar 2016)");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_family("SMTP problems");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_exim_detect.nasl");
  script_require_ports("Services/smtp", 25);
  script_mandatory_keys("exim/installed");

 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! version = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less( version:version, test_version:"4.86.2" ) )
{
  report = report_fixed_ver(  installed_version:version, fixed_version:"4.86.2" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );


