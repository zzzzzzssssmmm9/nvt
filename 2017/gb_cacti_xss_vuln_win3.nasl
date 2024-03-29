###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cacti_xss_vuln_win3.nasl 11836 2018-10-11 08:56:08Z mmartin $
#
# Cacti XSS Vulnerability (Windows)
#
# Authors:
# Jan Philipp Schulte <jan.schulte@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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

CPE = "cpe:/a:cacti:cacti";

if( description )
{
  script_oid("1.3.6.1.4.1.25623.1.0.113044");
  script_version("$Revision: 11836 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-11 10:56:08 +0200 (Thu, 11 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-11-02 10:07:48 +0200 (Thu, 02 Nov 2017)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");

  script_cve_id("CVE-2017-15194");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Cacti XSS Vulnerability (Windows)");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("cacti_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("cacti/installed", "Host/runs_windows");

  script_tag(name:"summary", value:"Cross-site scripting (XSS) vulnerabilities in include/global_session.php in Cacti
allow remote attackers to inject arbitrary web scripts or HTML.");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"affected", value:"Cacti version 1.1.25 and prior.");

  script_tag(name:"solution", value:"Upgrade to version 1.1.26 or later.");

  script_xref(name:"URL", value:"https://github.com/Cacti/cacti/issues/1010");

  exit(0);
}

include( "host_details.inc" );
include( "version_func.inc" );

if( !port = get_app_port( cpe: CPE ) ) exit( 0 );

if( !version = get_app_version( cpe: CPE, port: port ) ) exit( 0 );

if( version_is_less( version: version, test_version: "1.1.26" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "1.1.26" );
  security_message( port: port, data: report );
  exit( 0 );
}

exit( 99 );
