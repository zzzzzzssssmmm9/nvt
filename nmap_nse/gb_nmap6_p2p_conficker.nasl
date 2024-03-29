###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap6_p2p_conficker.nasl 11528 2018-09-21 16:15:13Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Ron Bowes (with research from Symantec Security Response)
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
  script_oid("1.3.6.1.4.1.25623.1.0.803503");
  script_version("$Revision: 11528 $");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 18:15:13 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2013-02-28 18:59:52 +0530 (Thu, 28 Feb 2013)");
  script_name("Nmap NSE 6.01: p2p-conficker");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("nmap_nse.nasl");
  script_mandatory_keys("Tools/Present/nmap6.01", "Tools/Launch/nmap_nse");

  script_add_preference(name:"smbport", value:"", type:"entry");
  script_add_preference(name:"checkall", value:"", type:"entry");
  script_add_preference(name:"randomseed", value:"", type:"entry");
  script_add_preference(name:"checkconficker", value:"", type:"entry");
  script_add_preference(name:"smbbasic", value:"", type:"entry");
  script_add_preference(name:"realip", value:"", type:"entry");
  script_add_preference(name:"smbsign", value:"", type:"entry");

  script_tag(name:"summary", value:"Checks if a host is infected with Conficker.C or higher, based on Conficker's peer to peer
communication.

When Conficker.C or higher infects a system, it opens four ports: two TCP and two UDP. The ports are
random, but are seeded with the current week and the IP of the infected host. By determining the
algorithm, one can check if these four ports are open, and can probe them for more data.

Once the open ports are found, communication can be initiated using Conficker's custom peer to peer
protocol.  If a valid response is received, then a valid Conficker infection has been found.

This check won't work properly on a multihomed or NATed system because the open ports will be based
on a nonpublic IP.  The argument 'checkall' tells Nmap to attempt communication with
every open port (much like a version check) and the argument 'realip' tells Nmap to base
its port generation on the given IP address instead of the actual IP.

By default, this will run against a system that has a standard Windows port open (445, 139, 137).
The arguments 'checkall' and 'checkconficker' will both perform checks
regardless of which port is open, see the args section for more information.

Note: Ensure your clock is correct (within a week) before using this script!

The majority of research for this script was done by Symantec Security Response, and some was taken
from public sources (most notably the port blacklisting was found by David Fifield). A big thanks
goes out to everybody who contributed!


SYNTAX:

smbport:       Override the default port choice. If 'smbport' is open, it's used. It's assumed
to be the same protocol as port 445, not port 139. Since it probably isn't possible to change
Windows' ports normally, this is mostly useful if you're bouncing through a relay or something.


checkall:  If set to '1' or 'true', attempt
to communicate with every open port.


randomseed:    Set to a value to change the filenames/service names that are randomly generated.



checkconficker:  If set to '1' or 'true', the script will always run on active hosts,
it doesn't matter if any open ports were detected.


smbbasic:     Forces the authentication to use basic security, as opposed to 'extended security'.
Against most modern systems, extended security should work, but there may be cases
where you want to force basic. There's a chance that you'll get better results for
enumerating users if you turn on basic authentication.


realip:  An IP address to use in place of the one known by Nmap.



smbsign:       Controls whether or not server signatures are checked in SMB packets. By default, on Windows,
server signatures aren't enabled or required. By default, this library will always sign
packets if it knows how, and will check signatures if the server says to. Possible values are:

  - 'force':      Always check server signatures, even if server says it doesn't support them (will
probably fail, but is technically more secure).

  - 'negotiate': [default] Use signatures if server supports them.

  - 'ignore':    Never check server signatures. Not recommended.

  - 'disable':   Don't send signatures, at all, and don't check the server's. not recommended.
More information on signatures can be found in 'smbauth.lua'.");

  exit(0);
}

i = 0;

port = script_get_preference("smbport");
if (port !~ '^[0-9]+$')
{
  port = 445;
}

pref = script_get_preference("smbport");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'smbport', '=', pref, '"');
}
pref = script_get_preference("checkall");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'checkall', '=', pref, '"');
}
pref = script_get_preference("randomseed");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'randomseed', '=', pref, '"');
}
pref = script_get_preference("checkconficker");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'checkconficker', '=', pref, '"');
}
pref = script_get_preference("smbbasic");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'smbbasic', '=', pref, '"');
}
pref = script_get_preference("realip");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'realip', '=', pref, '"');
}
pref = script_get_preference("smbsign");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'smbsign', '=', pref, '"');
}

argv = make_list("nmap", "-vv", "--script=p2p-conficker.nse", "-p", port, get_host_ip());

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
      log_message(data : msg, port:port);
    }
  }

  if("p2p-conficker" >< result && "Host is CLEAN" >!< result ) {
    msg = string('Result found by Nmap Security Scanner (p2p-conficker.nse) ',
                'http://nmap.org:\n\n', result);
    security_message(data : msg, port:port);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n', 'nmap ', argv);
  log_message(data: msg, port:port);
}
