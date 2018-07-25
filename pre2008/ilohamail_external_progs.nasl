# OpenVAS Vulnerability Test
# $Id: ilohamail_external_progs.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: IlohaMail External Programs Vulnerabilities
#
# Authors:
# George A. Theall, <theall@tifaware.com>.
#
# Copyright:
# Copyright (C) 2004 George A. Theall
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

tag_summary = "The target is running at least one instance of IlohaMail version
0.8.6.  This version may contain flaws in the spell check and GnuPG
features that allow an authenticated attacker to run arbitrary
commands with the privileges of the web user simply by enclosing them
in backticks when spell checking or sending a message. 

***** OpenVAS has determined the vulnerability exists on the target
***** simply by looking at the version number of IlohaMail 
***** installed there.";

tag_solution = "Upgrade to IlohaMail version 0.8.7 or later or disable
spell check and GPG features (see conf/conf.inc).";

if (description) {
  script_oid("1.3.6.1.4.1.25623.1.0.14635");
  script_version("$Revision: 9348 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_xref(name:"OSVDB", value:"7332");
  script_xref(name:"OSVDB", value:"7333");
 
  name = "IlohaMail External Programs Vulnerabilities";
  script_name(name);
 
 
  summary = "Checks for External Programs vulnerabilities in IlohaMail";
 
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_copyright("This script is Copyright (C) 2004 George A. Theall");

  family = "Web application abuses";
  script_family(family);

  script_dependencies("global_settings.nasl", "ilohamail_detect.nasl");
  script_require_ports("Services/www", 80);

  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}

include("global_settings.inc");
include("http_func.inc");

host = get_host_name();
port = get_http_port(default:80);
if (debug_level) display("debug: searching for IlohaMail External Programs vulnerabilities on ", host, ":", port, ".\n");

if (!get_port_state(port)) exit(0);

# Check each installed instance, stopping if we find a vulnerable version.
installs = get_kb_list(string("www/", port, "/ilohamail"));
if (isnull(installs)) exit(0);
foreach install (installs) {
  matches = eregmatch(string:install, pattern:"^(.+) under (/.*)$");
  if (!isnull(matches)) {
    ver = matches[1];
    dir = matches[2];
    if (debug_level) display("debug: checking version ", ver, " under ", dir, ".\n");

   if (ver =~ "^0\.8\.6") {
      security_message(port);
      exit(0);
    }
  }
}
