###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_ldap_search_net.nasl 8095 2017-12-13 07:30:19Z teissa $
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

tag_summary = "Attempts to perform an LDAP search and returns all matches.

If no username and password is supplied to the script the Nmap registry is consulted. If the <code
>ldap-brute' script has been selected and it found a valid account, this account will be used.
If not anonymous bind will be used as a last attempt.


SYNTAX:

ldap.base:  If set, the script will use it as a base for the search. By default the defaultNamingContext is retrieved and used.
If no defaultNamingContext is available the script iterates over the available namingContexts


ldap.username:  If set, the script will attempt to perform an LDAP bind using the username and password


ldap.password:  If set, used together with the username to authenticate to the LDAP server


ldap.qfilter:  If set, specifies a quick filter. The library does not support parsing real LDAP filters.
The following values are valid for the filter parameter: computer, users or all. If no value is specified it defaults to all.


ldap.attrib:  If set, the search will include only the attributes specified. For a single attribute a string value can be used, if
multiple attributes need to be supplied a table should be used instead.


ldap.maxobjects:  If set, overrides the number of objects returned by the script (default 20). 
The value -1 removes the limit completely.";

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.104149");
    script_version("$Revision: 8095 $");
    script_tag(name:"last_modification", value:"$Date: 2017-12-13 08:30:19 +0100 (Wed, 13 Dec 2017) $");
    script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
    script_tag(name:"cvss_base", value:"0.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
    script_name("Nmap NSE net: ldap-search");


    script_category(ACT_INIT);
    script_tag(name:"qod_type", value:"remote_analysis");
    script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
    script_family("Nmap NSE net");
    script_dependencies("nmap_nse_net.nasl");
    script_mandatory_keys("Tools/Launch/nmap_nse_net");

    script_add_preference(name:"ldap.base", value:"", type:"entry");
    script_add_preference(name:"ldap.username", value:"", type:"entry");
    script_add_preference(name:"ldap.password", value:"", type:"entry");
    script_add_preference(name:"ldap.qfilter", value:"", type:"entry");
    script_add_preference(name:"ldap.attrib", value:"", type:"entry");
    script_add_preference(name:"ldap.maxobjects", value:"", type:"entry");

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

    pref = script_get_preference("ldap.base");
    if (!isnull(pref) && pref != "") {
        argv["ldap.base"] = string('"', pref, '"');
    }
    pref = script_get_preference("ldap.username");
    if (!isnull(pref) && pref != "") {
        argv["ldap.username"] = string('"', pref, '"');
    }
    pref = script_get_preference("ldap.password");
    if (!isnull(pref) && pref != "") {
        argv["ldap.password"] = string('"', pref, '"');
    }
    pref = script_get_preference("ldap.qfilter");
    if (!isnull(pref) && pref != "") {
        argv["ldap.qfilter"] = string('"', pref, '"');
    }
    pref = script_get_preference("ldap.attrib");
    if (!isnull(pref) && pref != "") {
        argv["ldap.attrib"] = string('"', pref, '"');
    }
    pref = script_get_preference("ldap.maxobjects");
    if (!isnull(pref) && pref != "") {
        argv["ldap.maxobjects"] = string('"', pref, '"');
    }
    nmap_nse_register(script:"ldap-search", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"ldap-search");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (ldap-search.nse) http://nmap.org:\n\n';
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
