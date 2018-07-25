###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mysql_mult_dos_vuln.nasl 7024 2017-08-30 11:51:43Z teissa $
#
# MySQL Multiple Denial Of Service Vulnerabilities
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation could allow users to cause a Denial of Service.
  Impact Level: Application";
tag_affected = "MySQL version 5.1 before 5.1.49 on all running platform.";
tag_insight = "The flaws are due to:
  - An error in 'storage/innobase/dict/dict0crea.c' in 'mysqld' allows remote
    authenticated users to cause a denial of service by modifying the
    innodb_file_format or innodb_file_per_table configuration parameters for
    the InnoDB storage engine.
  - An error in handling of 'IN' or 'CASE' operations with NULL arguments that
    are explicitly specified or indirectly provided by the WITH ROLLUP modifier.
  - An error in handling of certain arguments to the BINLOG command, which
    triggers an access of uninitialized memory.
  - An error in creating temporary tables while using InnoDB, which triggers an
    assertion failure.";
tag_solution = "Upgrade to MySQL version 5.1.49
  For updates refer to http://dev.mysql.com/downloads";
tag_summary = "The host is running MySQL and is prone to multiple denial of service
  vulnerabilities.";

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.801566";
CPE = "cpe:/a:mysql:mysql";

if(description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 7024 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-30 13:51:43 +0200 (Wed, 30 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-01-18 07:48:41 +0100 (Tue, 18 Jan 2011)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
 script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_cve_id("CVE-2010-3676", "CVE-2010-3679",  "CVE-2010-3678", "CVE-2010-3680");
  script_name("MySQL Multiple Denial Of Service Vulnerabilities");
  script_xref(name : "URL" , value : "http://bugs.mysql.com/bug.php?id=54477");
  script_xref(name : "URL" , value : "https://bugzilla.redhat.com/show_bug.cgi?id=628172");
  script_xref(name : "URL" , value : "http://dev.mysql.com/doc/refman/5.1/en/news-5-1-49.html");
  script_xref(name : "URL" , value : "http://www.openwall.com/lists/oss-security/2010/09/28/10");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("mysql_version.nasl");
  script_require_ports("Services/mysql", 3306);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("misc_func.inc");
include("version_func.inc");
include("global_settings.inc");
include("host_details.inc");

sqlPort = get_app_port(cpe:CPE, nvt:SCRIPT_OID);
if(!sqlPort){
  sqlPort = 3306;
}

if(!get_port_state(sqlPort)){
  exit(0);
}

mysqlVer = get_app_version(cpe:CPE, nvt:SCRIPT_OID, port:sqlPort);
if(isnull(mysqlVer)){
  exit(0);
}

mysqlVer = eregmatch(pattern:"([0-9.a-z]+)", string:mysqlVer);
if(!isnull(mysqlVer[1]))
{
  if(version_in_range(version:mysqlVer[1], test_version:"5.1",test_version2:"5.1.48")){
    security_message(sqlPort);
  }
}
