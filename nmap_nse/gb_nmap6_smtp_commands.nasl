###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap6_smtp_commands.nasl 10579 2018-07-23 13:27:53Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Jason DePriest
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
  script_oid("1.3.6.1.4.1.25623.1.0.803533");
  script_version("$Revision: 10579 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-07-23 15:27:53 +0200 (Mon, 23 Jul 2018) $");
  script_tag(name:"creation_date", value:"2013-02-28 19:00:22 +0530 (Thu, 28 Feb 2013)");
  script_name("Nmap NSE 6.01: smtp-commands");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("find_service_3digits.nasl", "smtpserver_detect.nasl", "nmap_nse.nasl");
  script_require_ports("Services/smtp", 25);
  script_mandatory_keys("Tools/Present/nmap6.01", "Tools/Launch/nmap_nse");

  script_add_preference(name:"smtp.domain", value:"", type:"entry");

  script_tag(name:"summary", value:"Attempts to use EHLO and HELP to gather the Extended commands supported by an SMTP server.


SYNTAX:

smtp.domain:  or smtp-commands.domain Define the domain to be used in the SMTP commands.");

  exit(0);
}

include("smtp_func.inc");

i = 0;

pref = script_get_preference("smtp.domain");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'smtp.domain', '=', pref, '"');
}

port = get_smtp_port(default:25);

argv = make_list("nmap", "--script=smtp-commands.nse","-p", port, get_host_ip());

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

  if("smtp-commands" >< result) {
    msg = string('Result found by Nmap Security Scanner (smtp-commands.nse) ',
                'http://nmap.org:\n\n', result);
   log_message(data : msg, port:port);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n', 'nmap ', argv);
  log_message(data: msg, port:port);
}
