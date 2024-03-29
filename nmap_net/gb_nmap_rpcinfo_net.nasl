###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_rpcinfo_net.nasl 11527 2018-09-21 15:59:27Z cfischer $
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.104160");
  script_version("$Revision: 11527 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 17:59:27 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
  script_name("Nmap NSE net: rpcinfo");
  script_category(ACT_INIT);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE net");
  script_dependencies("nmap_nse_net.nasl");
  script_mandatory_keys("Tools/Launch/nmap_nse_net");

  script_add_preference(name:"nfs.version", value:"", type:"entry");
  script_add_preference(name:"mount.version", value:"", type:"entry");
  script_add_preference(name:"rpc.protocol", value:"", type:"entry");

  script_tag(name:"summary", value:"Connects to portmapper and fetches a list of all registered programs.


SYNTAX:

nfs.version:  number If set overrides the detected version of nfs


mount.version:  number If set overrides the detected version of mountd


rpc.protocol:  table If set overrides the preferred order in which
protocols are tested. (ie. 'tcp', 'udp')");

  exit(0);
}

include("nmap.inc");

phase = 0;
if (defined_func("scan_phase")) {
  phase = scan_phase();
}

if (phase == 1) {
    argv = make_array();

    pref = script_get_preference("nfs.version");
    if (!isnull(pref) && pref != "") {
        argv["nfs.version"] = string('"', pref, '"');
    }
    pref = script_get_preference("mount.version");
    if (!isnull(pref) && pref != "") {
        argv["mount.version"] = string('"', pref, '"');
    }
    pref = script_get_preference("rpc.protocol");
    if (!isnull(pref) && pref != "") {
        argv["rpc.protocol"] = string('"', pref, '"');
    }
    nmap_nse_register(script:"rpcinfo", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"rpcinfo");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (rpcinfo.nse) http://nmap.org:\n\n';
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
