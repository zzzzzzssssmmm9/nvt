###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_broadcast_wsdd_discover_net.nasl 8087 2017-12-12 13:12:04Z teissa $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Patrik Karlsson
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

tag_summary = "Uses a multicast query to discover devices supporting the Web Services Dynamic Discovery (WS-
Discovery) protocol. It also attempts to locate any published Windows Communication Framework (WCF)
web services (.NET 4.0 or later).";

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.104140");
    script_version("$Revision: 8087 $");
    script_tag(name:"last_modification", value:"$Date: 2017-12-12 14:12:04 +0100 (Tue, 12 Dec 2017) $");
    script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
    script_tag(name:"cvss_base", value:"0.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
    script_name("Nmap NSE net: broadcast-wsdd-discover");


    script_category(ACT_INIT);
    script_tag(name:"qod_type", value:"remote_analysis");
    script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
    script_family("Nmap NSE net");
    script_dependencies("nmap_nse_net.nasl");
    script_mandatory_keys("Tools/Launch/nmap_nse_net");


    script_tag(name : "summary" , value : tag_summary);
    exit(0);
}


include("nmap.inc");


phase = 0;
if (defined_func("scan_phase")) {
    phase = scan_phase();
}

if (phase == 1) {
    # Get the preferences
    argv = make_array();


    nmap_nse_register(script:"broadcast-wsdd-discover", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"broadcast-wsdd-discover");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (broadcast-wsdd-discover.nse) http://nmap.org:\n\n';
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
