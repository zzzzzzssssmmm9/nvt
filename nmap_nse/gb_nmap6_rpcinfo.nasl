###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap6_rpcinfo.nasl 10579 2018-07-23 13:27:53Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Patrik Karlsson
# NASL-Wrapper: autogenerated
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.803504");
  script_version("$Revision: 10579 $");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-07-23 15:27:53 +0200 (Mon, 23 Jul 2018) $");
  script_tag(name:"creation_date", value:"2013-02-28 18:59:53 +0530 (Thu, 28 Feb 2013)");
  script_name("Nmap NSE 6.01: rpcinfo");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("nmap_nse.nasl");
  script_mandatory_keys("Tools/Present/nmap6.01", "Tools/Launch/nmap_nse");

  script_add_preference(name:"nfs.version", value:"", type:"entry");
  script_add_preference(name:"mount.version", value:"", type:"entry");
  script_add_preference(name:"rpc.protocol", value:"", type:"entry");

  script_tag(name:"summary", value:"Connects to portmapper and fetches a list of all registered programs.  It then prints out a table
including (for each program) the RPC program number, supported version numbers, port number and
protocol, and program name.


SYNTAX:

nfs.version:  number If set overrides the detected version of nfs


mount.version:  number If set overrides the detected version of mountd


rpc.protocol:  table If set overrides the preferred order in which
protocols are tested. (ie. 'tcp', 'udp')");

  exit(0);
}

i = 0;

pref = script_get_preference("nfs.version");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'nfs.version', '=', pref, '"');
}
pref = script_get_preference("mount.version");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'mount.version', '=', pref, '"');
}
pref = script_get_preference("rpc.protocol");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'rpc.protocol', '=', pref, '"');
}

argv = make_list("nmap", "--script=rpcinfo.nse", get_host_ip());

if(i > 0)
{
  scriptArgs= "--script-args=";
  foreach arg(args) {
    scriptArgs += arg + ",";
  }
  argv = make_list(argv,scriptArgs);
}

res = pread(cmd: "nmap", argv: argv);

if(res)
{
  foreach line (split(res))
  {
    if(ereg(pattern:"^\|",string:line)) {
      result +=  substr(chomp(line),2) + '\n';
    }

    error = eregmatch(string:line, pattern:"^nmap: (.*)$");
    if (error) {
      msg = string('Nmap command failed with following error message:\n', line);
      log_message(data : msg);
    }
  }

  if("rpcinfo" >< result) {
    msg = string('Result found by Nmap Security Scanner (rpcinfo.nse) ',
                'http://nmap.org:\n\n', result);
    security_message(data : msg);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n', 'nmap ', argv);
  log_message(data: msg);
}
