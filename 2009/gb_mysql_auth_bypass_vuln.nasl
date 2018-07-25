###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mysql_auth_bypass_vuln.nasl 4869 2016-12-29 11:01:45Z teissa $
#
# MySQL Authenticated Access Restrictions Bypass Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation could allow users to bypass intended access restrictions
  by calling CREATE TABLE with DATA DIRECTORY or INDEX DIRECTORY argument referring
  to a subdirectory.
  Impact Level: Application";
tag_affected = "MySQL 5.1.x before 5.1.41 on all running platform.";
tag_insight = "The flaw is due to an error while calling CREATE TABLE on a MyISAM table with modified
  DATA DIRECTORY or INDEX DIRECTORY.";
tag_solution = "Upgrade to MySQL version 5.1.41
  For updates refer to http://dev.mysql.com/downloads";
tag_summary = "The host is running MySQL and is prone to Access restrictions Bypass
  Vulnerability";

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.801066";
CPE = "cpe:/a:mysql:mysql";

if(description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 4869 $");
  script_tag(name:"last_modification", value:"$Date: 2016-12-29 12:01:45 +0100 (Thu, 29 Dec 2016) $");
  script_tag(name:"creation_date", value:"2009-12-04 14:17:59 +0100 (Fri, 04 Dec 2009)");
  script_tag(name:"cvss_base", value:"4.4");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2009-4030");
  script_name("MySQL Authenticated Access Restrictions Bypass Vulnerability");
  script_xref(name : "URL" , value : "http://bugs.mysql.com/bug.php?id=32167");
  script_xref(name : "URL" , value : "http://dev.mysql.com/doc/refman/5.1/en/news-5-1-41.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_dependencies("mysql_version.nasl");
  script_require_ports("Services/mysql", 3306);
  script_require_keys("MySQL/installed");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("misc_func.inc");
include("version_func.inc");
include("host_details.inc");

sqlPort =  get_app_port(cpe:CPE, nvt:SCRIPT_OID);
if(!sqlPort){
  sqlPort = 3306;
}

if(!get_port_state(sqlPort)){
  exit(0);
}

mysqlVer = get_app_version(cpe:CPE, nvt:SCRIPT_OID, port:sqlPort);
if(!isnull(mysqlVer))
{
  mysqlVer = eregmatch(pattern:"([0-9.a-z]+)", string:mysqlVer);
  if(!isnull(mysqlVer[1]))
  {
    if(version_in_range(version:mysqlVer[1], test_version:"5.1",test_version2:"5.1.40")){
      security_message(sqlPort);
    }
  }
}

