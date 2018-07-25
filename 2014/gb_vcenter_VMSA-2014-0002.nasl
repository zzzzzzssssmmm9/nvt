###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vcenter_VMSA-2014-0002.nasl 9354 2018-04-06 07:15:32Z cfischer $
#
# VMware Security Updates for vCenter Server (VMSA-2013-0012)
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH
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

tag_summary = "VMware vSphere updates to third party libraries";

tag_solution = "Apply the missing patch(es).";
tag_affected = "VMware vCenter Server 5.5 prior 5.5 Update 1 ";
tag_vuldetect = "Check the build number.";
tag_insight = 'a. DDoS vulnerability in NTP third party libraries

The NTP daemon has a DDoS vulnerability in the handling of thE
"monlist" command. An attacker may send a forged request to a
vulnerable NTP server resulting in an amplified response to the
intended target of the DDoS attack. 

b. Update to ESXi glibc package

The ESXi glibc package is updated to version glibc-2.5-118.el5_10.2 to
resolve a security issue.

c. vCenter and Update Manager, Oracle JRE 1.7 Update 45

Oracle JRE is updated to version JRE 1.7 Update 45, which addresses
multiple security issues that existed in earlier releases of Oracle
JRE.';

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.103917");
 script_cve_id("CVE-2013-5211","CVE-2013-4332");
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
 script_version ("$Revision: 9354 $");
 script_name("VMSA-2014-0002 VMware vSphere updates to third party libraries");


 script_xref(name:"URL", value:"http://www.vmware.com/security/advisories/VMSA-2014-0002.html");

 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:15:32 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2014-03-12 14:24:01 +0100 (Wed, 12 Mar 2014)");
 script_category(ACT_GATHER_INFO);
 script_tag(name:"qod_type", value:"remote_banner");
 script_family("General");
 script_copyright("This script is Copyright (C) 2014 Greenbone Networks GmbH");
 script_dependencies("gb_vmware_vcenter_detect.nasl");
 script_mandatory_keys("VMware_vCenter/version","VMware_vCenter/build");

 script_tag(name : "vuldetect" , value : tag_vuldetect);
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name : "affected" , value : tag_affected);

 exit(0);

}

include("vmware_esx.inc");

if ( ! vcenter_version = get_kb_item("VMware_vCenter/version"))exit(0);
if ( ! vcenter_build = get_kb_item("VMware_vCenter/build"))exit(0);

fixed_builds = make_array( "5.5.0","1623099" );

if ( ! fixed_builds[ vcenter_version] ) exit( 0 );

if ( int( vcenter_build ) < int( fixed_builds[ vcenter_version ] ) )
{
  security_message( port:0, data: esxi_remote_report( ver:vcenter_version, build: vcenter_build, fixed_build: fixed_builds[vcenter_version], typ:'vCenter' ) );
  exit(0);
}  

exit(99);

