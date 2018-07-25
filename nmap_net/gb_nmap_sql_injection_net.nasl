###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_sql_injection_net.nasl 8087 2017-12-12 13:12:04Z teissa $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Eddie Bell
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

tag_summary = "Spiders an HTTP server looking for URLs containing queries vulnerable to an SQL injection attack.

The script spiders an HTTP server looking for URLs containing queries. It then proceeds to combine
crafted SQL commands with susceptible URLs in order to obtain errors. The errors are analysed to see
if the URL is vulnerable to attack. This uses the most basic form of SQL injection but anything more
complicated is better suited to a standalone tool. Both meta-style and HTTP redirects are supported.

We may not have access to the target web server's true hostname, which can prevent access to
virtually hosted sites.  This script only follows absolute links when the host name component is the
same as the target server's reverse-DNS name.


SYNTAX:

http.pipeline:  If set, it represents the number of HTTP requests that'll be
pipelined (ie, sent in a single request). This can be set low to make
debugging easier, or it can be set high to test how a server reacts (its
chosen max is ignored).


http.useragent:  The value of the User-Agent header field sent with
requests. By default it is
''Mozilla/5.0 (compatible; Nmap Scripting Engine; http://nmap.org/book/nse.html)''.
A value of the empty string disables sending the User-Agent header field.



sql-injection.start:  The path at which to start spidering; default '/'.


http-max-cache-size:  The maximum memory size (in bytes) of the cache.



sql-injection.maxdepth:  The maximum depth to spider; default 10.";

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.104126");
    script_version("$Revision: 8087 $");
    script_tag(name:"last_modification", value:"$Date: 2017-12-12 14:12:04 +0100 (Tue, 12 Dec 2017) $");
    script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_name("Nmap NSE net: sql-injection");


    script_category(ACT_INIT);
    script_tag(name:"qod_type", value:"remote_analysis");
    script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
    script_family("Nmap NSE net");
    script_dependencies("nmap_nse_net.nasl");
    script_mandatory_keys("Tools/Launch/nmap_nse_net");

    script_add_preference(name:"http.pipeline", value:"", type:"entry");
    script_add_preference(name:"http.useragent", value:"", type:"entry");
    script_add_preference(name:"sql-injection.start", value:"", type:"entry");
    script_add_preference(name:"http-max-cache-size", value:"", type:"entry");
    script_add_preference(name:"sql-injection.maxdepth", value:"", type:"entry");

    script_tag(name : "summary" , value : tag_summary);
    exit(0);
}


include("nmap.inc");

# The corresponding NSE script does't belong to the 'safe' category
if (safe_checks()) exit(0);

phase = 0;
if (defined_func("scan_phase")) {
    phase = scan_phase();
}

if (phase == 1) {
    # Get the preferences
    argv = make_array();

    pref = script_get_preference("http.pipeline");
    if (!isnull(pref) && pref != "") {
        argv["http.pipeline"] = string('"', pref, '"');
    }
    pref = script_get_preference("http.useragent");
    if (!isnull(pref) && pref != "") {
        argv["http.useragent"] = string('"', pref, '"');
    }
    pref = script_get_preference("sql-injection.start");
    if (!isnull(pref) && pref != "") {
        argv["sql-injection.start"] = string('"', pref, '"');
    }
    pref = script_get_preference("http-max-cache-size");
    if (!isnull(pref) && pref != "") {
        argv["http-max-cache-size"] = string('"', pref, '"');
    }
    pref = script_get_preference("sql-injection.maxdepth");
    if (!isnull(pref) && pref != "") {
        argv["sql-injection.maxdepth"] = string('"', pref, '"');
    }
    nmap_nse_register(script:"sql-injection", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"sql-injection");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (sql-injection.nse) http://nmap.org:\n\n';
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
