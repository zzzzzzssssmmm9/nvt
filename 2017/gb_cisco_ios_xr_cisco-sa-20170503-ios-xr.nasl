###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_ios_xr_cisco-sa-20170503-ios-xr.nasl 6097 2017-05-10 15:33:53Z ckuerste $
#
# Cisco IOS XR Software Denial of Service Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/o:cisco:ios_xr";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.106800");
 script_cve_id("CVE-2017-3876");
 script_tag(name: "cvss_base", value: "7.8");
 script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:N/I:N/A:C");
 script_version ("$Revision: 6097 $");

 script_name("Cisco IOS XR Software Denial of Service Vulnerability");

 script_xref(name: "URL", value: "https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170503-ios-xr");

 script_tag(name: "vuldetect" , value: "Check the version.");

 script_tag(name: "solution" , value: "See the referenced vendor advisory for a solution.");

 script_tag(name: "summary" , value: "A vulnerability in the Event Management Service daemon (emsd) of Cisco IOS
XR routers could allow an unauthenticated, remote attacker to cause a denial of service (DoS) condition on the
affected device.");

 script_tag(name: "insight", value: "The vulnerability is due to improper handling of gRPC requests. An attacker
could exploit this vulnerability by repeatedly sending unauthenticated gRPC requests to the affected device.");

 script_tag(name: "impact", value: "A successful exploit could allow the attacker to crash the device in such a
manner that manual intervention is required to recover.");

 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");

 script_tag(name:"last_modification", value:"$Date: 2017-05-10 17:33:53 +0200 (Wed, 10 May 2017) $");
 script_tag(name:"creation_date", value:"2017-05-10 20:50:36 +0700 (Wed, 10 May 2017)");
 script_category(ACT_GATHER_INFO);
 script_family("CISCO");
 script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
 script_dependencies("gb_cisco_ios_xr_version.nasl");
 script_mandatory_keys("cisco/ios_xr/version");

 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! version = get_app_version( cpe:CPE ) ) exit( 0 );

affected = make_list( 
		'6.1.0',
		'6.1.1' );

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

