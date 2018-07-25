###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap6_ms_sql_info.nasl 10579 2018-07-23 13:27:53Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Chris Woodbury, Thomas Buchanan
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
  script_oid("1.3.6.1.4.1.25623.1.0.803572");
  script_version("$Revision: 10579 $");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-07-23 15:27:53 +0200 (Mon, 23 Jul 2018) $");
  script_tag(name:"creation_date", value:"2013-02-28 19:01:01 +0530 (Thu, 28 Feb 2013)");
  script_name("Nmap NSE 6.01: ms-sql-info");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("nmap_nse.nasl");
  script_mandatory_keys("Tools/Present/nmap6.01", "Tools/Launch/nmap_nse");

  script_add_preference(name:"mssql.instance-name", value:"", type:"entry");
  script_add_preference(name:"mssql.instance-all", value:"", type:"entry");
  script_add_preference(name:"mssql.password", value:"", type:"entry");
  script_add_preference(name:"mssql.username", value:"", type:"entry");
  script_add_preference(name:"mssql.protocol", value:"", type:"entry");
  script_add_preference(name:"mssql.scanned-ports-only", value:"", type:"entry");
  script_add_preference(name:"mssql.instance-port", value:"", type:"entry");
  script_add_preference(name:"mssql.timeout", value:"", type:"entry");
  script_add_preference(name:"mssql.domain", value:"", type:"entry");

  script_tag(name:"summary", value:"Attempts to determine configuration and version information for Microsoft SQL Server instances.

SQL Server credentials required: No (will not benefit from  'mssql.username' &
'mssql.password'). Run criteria: * Host script: Will always run. * Port script: N/A

NOTE: Unlike previous versions, this script will NOT attempt to log in to SQL Server instances.
Blank passwords can be checked using the 'ms-sql-empty-password' script. E.g.: 'nmap
-sn --script ms-sql-empty-password --script-args mssql.instance-all <host>'

The script uses two means of getting version information for SQL Server instances: * Querying the
SQL Server Browser service, which runs by default on UDP port 1434 on servers that have SQL Server
2000 or later installed. However, this service may be disabled without affecting the functionality
of the instances. Additionally, it provides imprecise version information.  * Sending a probe to the
instance, causing the instance to respond with information including the exact version number. This
is the same method that Nmap uses for service versioning; however, this script can also do the same
for  instances accessiable via Windows named pipes, and can target all of the instances listed by
the SQL Server Browser service.

In the event that the script can connect to the SQL Server Browser service (UDP 1434) but is unable
to connect directly to the instance to obtain more accurate version information (because ports are
blocked or the 'mssql.scanned-ports-only' argument has been used), the script will rely
only upon the version number provided by the SQL Server Browser/Monitor, which has the following
limitations: * For SQL Server 2000 and SQL Server 7.0 instances, the RTM version number is always
given, regardless of any service packs or patches installed. * For SQL Server 2005 and later, the
version number will reflect the service pack installed, but the script will not be able to tell
whether patches have been installed.



SYNTAX:

mssql.instance-name:  The name of the instance to connect to.



mssql.instance-all:  Targets all SQL server instances discovered
through the browser service.



mssql.password:  The password for 'mssql.username'. If this
argument is not given but 'mssql.username', a blank password
is used.



mssql.username:  The username to use to connect to SQL Server instances.
This username is used by scripts taking actions that require
authentication (e.g. 'ms-sql-query') This username (and its
associated password) takes precedence over any credentials discovered
by the 'ms-sql-brute' and 'ms-sql-empty-password'
scripts.



mssql.protocol:  The protocol to use to connect to the instance. The
protocol may be either 'NP','Named Pipes' or
'TCP'.



mssql.scanned-ports-only:  If set, the script will only connect
to ports that were included in the Nmap scan. This may result in
instances not being discovered, particularly if UDP port 1434 is not
included. Additionally, instances that are found to be running on
ports that were not scanned (e.g. if 1434/udp is in the scan and the
SQL Server Browser service on that port reports an instance
listening on 43210/tcp, which was not scanned) will be reported but
will not be stored for use by other ms-sql-
- scripts.


mssql.instance-port:  The port of the instance to connect to.



mssql.timeout:  How long to wait for SQL responses. This is a number
followed by 'ms' for milliseconds, 's' for
seconds, 'm' for minutes, or 'h' for hours.
Default: '30s'.



mssql.domain:  The domain against which to perform integrated
authentication. When set, the scripts assume integrated authentication
should be performed, rather than the default sql login.");

  exit(0);
}

i = 0;

port = 1434;

pref = script_get_preference("mssql.instance-name");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'mssql.instance-name', '=', pref, '"');
}
pref = script_get_preference("mssql.instance-all");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'mssql.instance-all', '=', pref, '"');
}
pref = script_get_preference("mssql.password");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'mssql.password', '=', pref, '"');
}
pref = script_get_preference("mssql.username");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'mssql.username', '=', pref, '"');
}
pref = script_get_preference("mssql.protocol");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'mssql.protocol', '=', pref, '"');
}
pref = script_get_preference("mssql.scanned-ports-only");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'mssql.scanned-ports-only', '=', pref, '"');
}
pref = script_get_preference("mssql.instance-port");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'mssql.instance-port', '=', pref, '"');
}
pref = script_get_preference("mssql.timeout");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'mssql.timeout', '=', pref, '"');
}
pref = script_get_preference("mssql.domain");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'mssql.domain', '=', pref, '"');
}

argv = make_list("nmap", "-sU", "--script=ms-sql-info.nse", "-p", port, get_host_ip());

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

  if("ms-sql-info" >< result) {
    msg = string('Result found by Nmap Security Scanner (ms-sql-info.nse) ',
                'http://nmap.org:\n\n', result);
    security_message(data : msg, port:port);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n', 'nmap ', argv);
  log_message(data: msg, port:port);
}
