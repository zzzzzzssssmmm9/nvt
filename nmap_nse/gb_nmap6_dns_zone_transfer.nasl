###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap6_dns_zone_transfer.nasl 11537 2018-09-21 19:46:46Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Eddie Bell
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
  script_oid("1.3.6.1.4.1.25623.1.0.803507");
  script_version("$Revision: 11537 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 21:46:46 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2013-02-28 18:59:56 +0530 (Thu, 28 Feb 2013)");
  script_name("Nmap NSE 6.01: dns-zone-transfer");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("nmap_nse.nasl", "dns_server_tcp.nasl");
  script_require_ports("Services/domain", 53);
  script_mandatory_keys("Tools/Present/nmap6.01", "Tools/Launch/nmap_nse");

  script_add_preference(name:"dns-zone-transfer.server", value:"", type:"entry");
  script_add_preference(name:"dns-zone-transfer.addall", value:"", type:"entry");
  script_add_preference(name:"dns-zone-transfer.port", value:"", type:"entry");
  script_add_preference(name:"dns-zone-transfer.domain", value:"", type:"entry");

  script_tag(name:"summary", value:"Requests a zone transfer (AXFR)from a DNS server.

The script sends an AXFR query to a DNS server. The domain to query is determined by examining the
name given on the command line, the DNS server's hostname, or it can be specified with the <code
>dns-zone-transfer.domain' script argument. If the query is successful all domains and domain
types are returned along with common type specific data (SOA/MX/NS/PTR/A).

This script can run at different phases of an Nmap scan: * Script Pre-scanning: in this phase the
script will run before any Nmap scan and use the defined DNS server in the arguments. The script
arguments in this phase are:'dns-zone-transfer.server' the DNS server to use, can be a
hostname or an IP address and must be specified. The 'dns-zone-transfer.port' argument is
optional and can be used to specify the DNS server port. * Script scanning: in this phase the script
will run after the other Nmap phases and against an Nmap discovered DNS server. If we don't have the
'true' hostname for the DNS server we cannot determine a likely zone to perform the transfer on.

Useful resources * DNS for rocket scientists: http://www.zytrax.com/books/dns/ * How the AXFR
protocol works: http://cr.yp.to/djbdns/axfr-notes.html


SYNTAX:

dns-zone-transfer.server:  DNS server. If set, this argument will
enable the script for the 'Script Pre-scanning phase'.


dns-zone-transfer.addall:   If specified, adds all IP addresses
including private ones onto Nmap scanning queue when the
script argument 'newtargets' is given. The default
behavior is to skip private IPs (non-routable).


dns-zone-transfer.port:  DNS server port, this argument concerns
the 'Script Pre-scanning phase' and it's optional, the default
value is '53'.


dns-zone-transfer.domain:  Domain to transfer.");

  exit(0);
}

# The corresponding NSE script doesn't belong to the 'safe' category
if (safe_checks()) exit(0);

i = 0;

pref = script_get_preference("dns-zone-transfer.server");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'dns-zone-transfer.server', '=', pref, '"');
}
pref = script_get_preference("dns-zone-transfer.addall");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'dns-zone-transfer.addall', '=', pref, '"');
}
pref = script_get_preference("dns-zone-transfer.port");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'dns-zone-transfer.port', '=', pref, '"');
}
pref = script_get_preference("dns-zone-transfer.domain");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'dns-zone-transfer.domain', '=', pref, '"');
}

port = get_kb_item("Services/domain");
if(!port) port = 53;
if(!get_port_state(port)) exit(0);

# nb: The NSE script is only supporting TCP...
argv = make_list("nmap", "--script=dns-zone-transfer.nse", "-p", port, get_host_ip());

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

  if("dns-zone-transfer" >< result) {
    msg = string('Result found by Nmap Security Scanner (dns-zone-transfer.nse) ',
                'http://nmap.org:\n\n', result);
    log_message(data : msg, port:port);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n', 'nmap ', argv);
  log_message(data: msg, port:port);
}
