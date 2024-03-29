###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_oracle_sid_brute.nasl 10607 2018-07-25 09:09:12Z cfischer $
#
# Wrapper for Nmap Oracle SID Brute NSE script.
#
# Authors:
# NSE-Script: Patrik Karlsson
# NASL-Wrapper: Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# NASL-Wrapper: Copyright (c) 2010 Greenbone Networks GmbH (http://www.greenbone.net)
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
  script_oid("1.3.6.1.4.1.25623.1.0.801815");
  script_version("$Revision: 10607 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-25 11:09:12 +0200 (Wed, 25 Jul 2018) $");
  script_tag(name:"creation_date", value:"2011-01-21 13:17:02 +0100 (Fri, 21 Jan 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Nmap NSE: Oracle SID Brute");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("nmap_nse.nasl", "oracle_tnslsnr_version.nasl");
  script_require_ports("Services/oracle_tnslsnr", 1521);
  script_mandatory_keys("Tools/Present/nmap", "Tools/Launch/nmap_nse");

  script_add_preference(name:"oraclesids :", value:"", type:"entry");

  script_tag(name:"summary", value:"This script attempts to guess Oracle instance/SID names against the
  TNS-listener.

  This is a wrapper on the Nmap Security Scanner's (http://nmap.org) oracle-sid-brute.nse.");

  exit(0);
}

if((! get_kb_item("Tools/Present/nmap5.21") &&
   ! get_kb_item("Tools/Present/nmap5.51")) ||
   ! get_kb_item("Tools/Launch/nmap_nse")) {
 exit(0);
}

port = get_kb_item("Services/oracle_tnslsnr");
if(!port) port = 1521;
if(!get_port_state(port)) exit(0);

argv = make_list("nmap", "--script=oracle-sid-brute.nse", "-p", port, get_host_ip());

if( pref = script_get_preference("oraclesids :")){
  argv = make_list(argv, "--script-args=oraclesids=" + pref);
}

res = pread(cmd: "nmap", argv: argv);

if(res)
{
  foreach line (split(res))
  {
    if(port = eregmatch(pattern:"^([0-9]+)/tcp",string:line))
    {
      oraclePort = port[1];
      result = NULL;
      continue;
    }

    if(ereg(pattern:"^\|",string:line))
    {
      result += substr(chomp(line),2);
      if("oracle-sid-brute" >< result)
      {
        msg = string('Result found by Nmap Security Scanner (oracle-sid-brute.nse) ',
                     'http://nmap.org:\n\n', result);
        security_message(data:msg, port:oraclePort);
      }
    }

    error = eregmatch(string:line, pattern:"^nmap: (.*)$");
    if (error) {
      msg = string('Nmap command failed with following error message:\n', line);
      log_message(data:msg);
    }
  }
}
else
{
  msg = string('Nmap command failed entirely:\n');
  log_message(data:msg);
}
