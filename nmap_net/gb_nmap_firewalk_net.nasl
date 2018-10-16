###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_firewalk_net.nasl 11527 2018-09-21 15:59:27Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Henri Doreau
# NASL-Wrapper: autogenerated
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# Copyright (C) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.104048");
  script_version("$Revision: 11527 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 17:59:27 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("Nmap NSE net: firewalk");
  script_category(ACT_INIT);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE net");
  script_dependencies("nmap_nse_net.nasl");
  script_mandatory_keys("Tools/Launch/nmap_nse_net");

  script_add_preference(name:"firewalk.ttl", value:"", type:"entry");
  script_add_preference(name:"firewalk.gateway", value:"", type:"entry");

  script_tag(name:"summary", value:"Tries to discover firewall rules using an IP TTL expiration technique known as firewalking.

The scan requires a firewall (or 'gateway') and a metric (or 'target'). For each filtered port on
the target, send a probe with an IP TTL one greater than the number of hops to the gateway. The TTL
can be given in two ways: directly with the 'firewalk.ttl' script argument, or indirectly
with the 'firewalk.gateway' script argument. For 'firewalk.gateway', Nmap must
be run with the '--traceroute' option and the gateway must appear as one of the
traceroute hops.

If the probe is forwarded by the gateway, then we can expect to receive an ICMP_TIME_EXCEEDED reply
from the gateway next hop router, or eventually the target if it is directly connected to the
gateway. Otherwise, the probe will timeout. As for UDP scans, this process can be quite slow if lots
of ports are blocked by the gateway.

From an original idea of M. Schiffman and D. Goldsmith, authors of the firewalk tool.


SYNTAX:

firewalk.ttl:  value of the TTL to use. Should be one greater than the
number of hops to the gateway. In case both 'firewalk.ttl' and
'firewalk.gateway' IP address are
supplied, 'firewalk.gateway' is ignored.



firewalk.gateway:  IP address of the tested firewall. Must be present in the traceroute results.");

  exit(0);
}

include("nmap.inc");

phase = 0;
if (defined_func("scan_phase")) {
  phase = scan_phase();
}

if (phase == 1) {
    argv = make_array();

    pref = script_get_preference("firewalk.ttl");
    if (!isnull(pref) && pref != "") {
        argv["firewalk.ttl"] = string('"', pref, '"');
    }
    pref = script_get_preference("firewalk.gateway");
    if (!isnull(pref) && pref != "") {
        argv["firewalk.gateway"] = string('"', pref, '"');
    }
    nmap_nse_register(script:"firewalk", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"firewalk");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (firewalk.nse) http://nmap.org:\n\n';
        if (portspec == "0") {
            log_message(data:output_banner + res[portspec], port:0);
        } else {
            v = split(portspec, sep:"/", keep:0);
            proto = v[0];
            port = v[1];
            log_message(data:output_banner + res[portspec], port:port, protocol:proto);
        }
    }
}
