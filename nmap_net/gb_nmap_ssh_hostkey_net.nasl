###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_ssh_hostkey_net.nasl 8095 2017-12-13 07:30:19Z teissa $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Sven Klemm
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

tag_summary = "Shows SSH hostkeys.

Shows the target SSH server's key fingerprint and (with high enough verbosity level) the public key
itself.  It records the discovered host keys in 'nmap.registry' for use by other scripts.
Output can be controlled with the 'ssh_hostkey' script argument.


SYNTAX:

ssh_hostkey:  Controls the output format of keys. Multiple values may be
given, separated by spaces. Possible values are

- ''full'': The entire key, not just the fingerprint.

- ''bubble'': Bubble Babble output,

- ''visual'': Visual ASCII art representation.

- ''all'': All of the above.";

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.104056");
    script_version("$Revision: 8095 $");
    script_tag(name:"last_modification", value:"$Date: 2017-12-13 08:30:19 +0100 (Wed, 13 Dec 2017) $");
    script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
    script_name("Nmap NSE net: ssh-hostkey");


    script_category(ACT_INIT);
    script_tag(name:"qod_type", value:"remote_analysis");
    script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
    script_family("Nmap NSE net");
    script_dependencies("nmap_nse_net.nasl");
    script_mandatory_keys("Tools/Launch/nmap_nse_net");

    script_add_preference(name:"ssh_hostkey", value:"", type:"entry");

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

    pref = script_get_preference("ssh_hostkey");
    if (!isnull(pref) && pref != "") {
        argv["ssh_hostkey"] = string('"', pref, '"');
    }
    nmap_nse_register(script:"ssh-hostkey", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"ssh-hostkey");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (ssh-hostkey.nse) http://nmap.org:\n\n';
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
