###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_ios_cisco-sa-20151005-ios-radius.nasl 5732 2017-03-27 09:00:59Z teissa $
#
# Cisco IOS Software RADIUS Client Denial of Service Vulnerability
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

CPE = "cpe:/o:cisco:ios";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.105635");
 script_cve_id("CVE-2015-6263");
 script_tag(name:"cvss_base", value:"6.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:N/A:C");
 script_version ("$Revision: 5732 $");

 script_name("Cisco IOS Software RADIUS Client Denial of Service Vulnerability");

 script_xref(name:"URL", value:"http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20151005-ios-radius");
 

 script_tag(name: "vuldetect" , value:"Check the version.");

 script_tag(name: "solution" , value:"See the referenced vendor advisory for a solution.");
 script_tag(name: "summary" , value:"A vulnerability in the RADIUS client feature of Cisco IOS Software could allow an authenticated, remote attacker to cause a reload of the affected device.

The vulnerability is due to improper parsing of malformed RADIUS packets returned by a RADIUS server. An attacker could exploit this vulnerability by configuring a RADIUS server with a shared RADIUS secret and returning malformed answers back to a RADIUS client on an affected Cisco device. An exploit could allow the attacker to cause a reload of the affected device.

Cisco has released software updates that address this vulnerability. Workarounds that mitigate this vulnerability are not available. This advisory is available at the following link:

http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20151005-ios-radius");

 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");

 script_tag(name:"last_modification", value:"$Date: 2017-03-27 11:00:59 +0200 (Mon, 27 Mar 2017) $");
 script_tag(name:"creation_date", value:"2016-05-03 18:59:17 +0200 (Tue, 03 May 2016)");
 script_category(ACT_GATHER_INFO);
 script_family("CISCO");
 script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
 script_dependencies("gb_ssh_cisco_ios_get_version.nasl");
 script_mandatory_keys("cisco_ios/version");
 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! version = get_app_version( cpe:CPE ) ) exit( 0 );

affected = make_list( 
		'15.4(3)M2.2' );

foreach af ( affected )
{
  if( version == af )
  {
    report = report_fixed_ver(  installed_version:version, fixed_version: "See advisory" );
    security_message( port:0, data:report );
    exit( 0 );
  }
}

exit( 99 );

