###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_elasticsearch_kibana_mult_vuln_oct17.nasl 8595 2018-01-31 08:04:59Z cfischer $
#
# Elasticsearch Kibana <= 5.6.0 Cross Site Scripting (XSS) Vulnerability
#
# Authors:
# Jan Philipp Schulte <jan.schulte@greenbone.net>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, https://www.greenbone.net
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

CPE = "cpe:/a:elasticsearch:kibana";

if( description )
{
  script_oid("1.3.6.1.4.1.25623.1.0.113010");
  script_version("$Revision: 8595 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-31 09:04:59 +0100 (Wed, 31 Jan 2018) $");
  script_tag(name:"creation_date", value:"2017-10-09 13:04:33 +0200 (Mon, 09 Oct 2017)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  
  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_cve_id("CVE-2017-11479");

  script_name("Elasticsearch Kibana <= 5.6.0 Cross Site Scripting (XSS) Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_elasticsearch_kibana_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("Elasticsearch/Kibana/Installed");

  script_tag(name:"summary", value:"The Timelion feature in Kibana versions versions 5.0.0 to 5.6.1 is vulnerable to an XSS attack.");
  script_tag(name:"vuldetect", value:"Scripts checks if a vulnerable version is present on the host.");
  script_tag(name:"impact", value:"Successful exploitation would allow the attacker to  forge GET-parameters and send a
  malicious link to a user that then performs actions against the host.");
  script_tag(name:"affected", value:"Kibana versions 5.0.0 to 5.6.0");
  script_tag(name:"solution", value:"Upgrade Kibana to version 5.6.1");

  script_xref(name:"URL", value:"https://discuss.elastic.co/t/x-pack-alerting-and-kibana-5-6-1-security-update/101884");

  exit( 0 );
}

include( "host_details.inc" );
include( "version_func.inc" );

if( !port = get_app_port( cpe: CPE ) ) {
  exit( 0 );
}

if ( !version = get_app_version( cpe: CPE, port: port ) ) {
  exit( 0 );
}

if( version_in_range( version: version, test_version: "5.0.0", test_version2: "5.6.0" ) ) {
  report = report_fixed_ver(  installed_version: version, fixed_version: "5.6.1" );
  security_message( port: port, data: report );
  exit( 0 );
}

exit( 99 );
  
