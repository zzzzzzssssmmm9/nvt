###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_dns_random_txid_net.nasl 11527 2018-09-21 15:59:27Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script:
# Script: Brandon Enright <bmenrigh@ucsd.edu>
# txidtest.dns-oarc.net: Duane Wessels <wessels@dns-oarc.net>
#
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
  script_oid("1.3.6.1.4.1.25623.1.0.104095");
  script_version("$Revision: 11527 $");
  script_cve_id("CVE-2008-1447");
  script_bugtraq_id(30131);
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 17:59:27 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_name("Nmap NSE net: dns-random-txid");
  script_category(ACT_INIT);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE net");
  script_dependencies("nmap_nse_net.nasl");
  script_mandatory_keys("Tools/Launch/nmap_nse_net");
  script_tag(name:"summary", value:"Checks a DNS server for the predictable-TXID DNS recursion vulnerability.  Predictable TXID values
can make a DNS server vulnerable to cache poisoning attacks (see CVE-2008-1447).

The script works by querying txidtest.dns-oarc.net (see https://www.dns-
oarc.net/oarc/services/txidtest).  Be aware that any targets against which this script is run will
be sent to and potentially recorded by one or more DNS servers and the txidtest server. In addition
your IP address will be sent along with the txidtest query to the DNS server running on the target.");

  exit(0);
}

include("nmap.inc");

# The corresponding NSE script doesn't belong to the 'safe' category
if (safe_checks()) exit(0);

phase = 0;
if (defined_func("scan_phase")) {
  phase = scan_phase();
}

if (phase == 1) {
  argv = make_array();
  nmap_nse_register(script:"dns-random-txid", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"dns-random-txid");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (dns-random-txid.nse) http://nmap.org:\n\n';
        if (portspec == "0") {
            security_message(data:output_banner + res[portspec], port:0);
        } else {
            v = split(portspec, sep:"/", keep:0);
            proto = v[0];
            port = v[1];
            security_message(data:output_banner + res[portspec], port:port, protocol:proto);
        }
    }
}
