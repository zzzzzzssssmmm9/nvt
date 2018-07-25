###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_ios_cisco-sa-20161005-ios-ikev.nasl 5568 2017-03-14 10:00:33Z teissa $
#
# Cisco IOS IKEv2 Denial of Service Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
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
 script_oid("1.3.6.1.4.1.25623.1.0.106336");
 script_cve_id("CVE-2016-6423");
 script_tag(name:"cvss_base", value:"6.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:N/A:C");
 script_version ("$Revision: 5568 $");

 script_name("Cisco IOS IKEv2 Denial of Service Vulnerability");

 script_xref(name:"URL", value:"http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20161005-ios-ikev");

 script_tag(name: "vuldetect" , value:"Check the version.");

 script_tag(name: "solution" , value:"See the referenced vendor advisory for a solution.");

 script_tag(name: "summary" , value:"A vulnerability in the Internet Key Exchange version 2 (IKEv2) code of
Cisco IOS could allow an unauthenticated, remote attacker to cause a reload of the affected device.");

 script_tag(name: "insight", value: "The vulnerability is due to improper handling of crafted IKEv2 packets. The
vulnerability applies only to IKEv2 devices acting as clients or IKEv2 initiators. An attacker could exploit this
vulnerability by sending crafted packets to the affected devices. An attacker, however, would need to be able to
force the affected device to connect to a rogue IKEv2 server under its control.");

 script_tag(name: "impact", value: "An exploit could allow the attacker to cause a reload of the affected
system.");

 script_tag(name:"qod_type", value:"package");

 script_tag(name:"solution_type", value:"VendorFix");

 script_tag(name:"last_modification", value:"$Date: 2017-03-14 11:00:33 +0100 (Tue, 14 Mar 2017) $");
 script_tag(name:"creation_date", value:"2016-10-06 11:24:50 +0700 (Thu, 06 Oct 2016)");
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

if( version == '15.5(3)M' )
{
  report = report_fixed_ver(  installed_version:version, fixed_version: "See advisory" );
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );

