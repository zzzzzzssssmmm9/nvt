###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap6_http_headers.nasl 10579 2018-07-23 13:27:53Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Ron Bowes
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
  script_oid("1.3.6.1.4.1.25623.1.0.803512");
  script_version("$Revision: 10579 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-07-23 15:27:53 +0200 (Mon, 23 Jul 2018) $");
  script_tag(name:"creation_date", value:"2013-02-28 19:00:01 +0530 (Thu, 28 Feb 2013)");
  script_name("Nmap NSE 6.01: http-headers");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("nmap_nse.nasl", "find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_mandatory_keys("Tools/Launch/nmap_nse", "Tools/Present/nmap6.01");

  script_add_preference(name:"http.pipeline", value:"", type:"entry");
  script_add_preference(name:"path", value:"", type:"entry");
  script_add_preference(name:"http.useragent", value:"", type:"entry");
  script_add_preference(name:"http-max-cache-size", value:"", type:"entry");
  script_add_preference(name:"useget", value:"", type:"entry");

  script_tag(name:"summary", value:"Performs a GET request for the root folder ('/')of a web server and displays the HTTP headers
returned.


SYNTAX:

http.pipeline:  If set, it represents the number of HTTP requests that'll be
pipelined (ie, sent in a single request). This can be set low to make
debugging easier, or it can be set high to test how a server reacts (its
chosen max is ignored).

TODO
Implement cache system for http pipelines



path:  The path to request, such as '/index.php'. Default '/'.


http.useragent:  The value of the User-Agent header field sent with
requests. By default it is
''Mozilla/5.0 (compatible; Nmap Scripting Engine; http://nmap.org/book/nse.html)''.
A value of the empty string disables sending the User-Agent header field.



http-max-cache-size:  The maximum memory size (in bytes) of the cache.



useget:  Set to force GET requests instead of HEAD.");

  exit(0);
}

include ("http_func.inc");

i = 0;

port = get_http_port(default:80);

pref = script_get_preference("http.pipeline");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'http.pipeline', '=', pref, '"');
}
pref = script_get_preference("path");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'path', '=', pref, '"');
}
pref = script_get_preference("http.useragent");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'http.useragent', '=', pref, '"');
}
pref = script_get_preference("http-max-cache-size");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'http-max-cache-size', '=', pref, '"');
}
pref = script_get_preference("useget");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'useget', '=', pref, '"');
}

argv = make_list("nmap","--script=http-headers.nse","-p",port,get_host_ip());

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

  if("http-headers" >< result) {
    msg = string('Result found by Nmap Security Scanner (http-headers.nse) ',
                'http://nmap.org:\n\n', result);
   log_message(data : msg, port:port);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n', 'nmap ', argv);
  log_message(data: msg, port:port);
}
