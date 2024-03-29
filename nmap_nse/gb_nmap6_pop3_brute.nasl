###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap6_pop3_brute.nasl 11537 2018-09-21 19:46:46Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Philip Pickering
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
  script_oid("1.3.6.1.4.1.25623.1.0.803538");
  script_version("$Revision: 11537 $");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 21:46:46 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2013-02-28 19:00:27 +0530 (Thu, 28 Feb 2013)");
  script_name("Nmap NSE 6.01: pop3-brute");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("find_service2.nasl", "nmap_nse.nasl");
  script_require_ports("Services/pop3", 110);
  script_mandatory_keys("Tools/Present/nmap", "Tools/Launch/nmap_nse");

  script_add_preference(name:"userdb", value:"", type:"entry");
  script_add_preference(name:"pop3loginmethod", value:"", type:"entry");
  script_add_preference(name:"unpwdb.passlimit", value:"", type:"entry");
  script_add_preference(name:"unpwdb.userlimit", value:"", type:"entry");
  script_add_preference(name:"unpwdb.timelimit", value:"", type:"entry");
  script_add_preference(name:"passdb", value:"", type:"entry");

  script_tag(name:"summary", value:"Tries to log into a POP3 account by guessing usernames and passwords.


SYNTAX:

userdb:  The filename of an alternate username database.


pop3loginmethod:  The login method to use:''USER''
(default), ''SASL-PLAIN'', ''SASL-LOGIN'',
''SASL-CRAM-MD5'', or ''APOP''.



unpwdb.passlimit:  The maximum number of passwords
'passwords' will return (default unlimited).


unpwdb.userlimit:  The maximum number of usernames
'usernames' will return (default unlimited).


unpwdb.timelimit:  The maximum amount of time that any iterator will run
before stopping. The value is in seconds by default and you can follow it
with 'ms', 's', 'm', or 'h' for
milliseconds, seconds, minutes, or hours. For example,
'unpwdb.timelimit=30m' or 'unpwdb.timelimit=.5h' for
30 minutes. The default depends on the timing template level (see the module
description). Use the value '0' to disable the time limit.


passdb:  The filename of an alternate password database.");

  exit(0);
}

# The corresponding NSE script doesn't belong to the 'safe' category
if (safe_checks()) exit(0);

include("pop3_func.inc");

i = 0;

pref = script_get_preference("userdb");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'userdb', '=', pref, '"');
}
pref = script_get_preference("pop3loginmethod");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'pop3loginmethod', '=', pref, '"');
}
pref = script_get_preference("unpwdb.passlimit");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'unpwdb.passlimit', '=', pref, '"');
}
pref = script_get_preference("unpwdb.userlimit");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'unpwdb.userlimit', '=', pref, '"');
}
pref = script_get_preference("unpwdb.timelimit");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'unpwdb.timelimit', '=', pref, '"');
}
pref = script_get_preference("passdb");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'passdb', '=', pref, '"');
}

port = get_pop3_port(default:110);

argv = make_list("nmap", "--script=pop3-brute.nse", "-p", port, get_host_ip());

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

  if("pop3-brute" >< result) {
    msg = string('Result found by Nmap Security Scanner (pop3-brute.nse) ',
                'http://nmap.org:\n\n', result);
    security_message(data : msg, port:port);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n', 'nmap ', argv);
  log_message(data: msg, port:port);
}
