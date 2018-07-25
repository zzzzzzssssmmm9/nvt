###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mysql_unspecified_vuln02_feb15_win.nasl 7546 2017-10-24 11:58:30Z cfischer $
#
# Oracle MySQL Multiple Unspecified vulnerabilities-02 Feb15 (Windows)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:oracle:mysql";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805133");
  script_version("$Revision: 7546 $");
  script_cve_id("CVE-2015-0432");
  script_bugtraq_id(72217);
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 13:58:30 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2015-02-03 12:00:39 +0530 (Tue, 03 Feb 2015)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Oracle MySQL Multiple Unspecified vulnerabilities-02 Feb15 (Windows)");

  script_tag(name:"summary", value:"This host is running Oracle MySQL and is
  prone to multiple unspecified vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Unspecified errors in the MySQL Server
  component via unknown vectors related to Server:InnoDB:DDL:Foreign Key");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to disclose potentially sensitive information, manipulate certain data,
  cause a DoS (Denial of Service), and compromise a vulnerable system.

  Impact Level: Application");

  script_tag(name:"affected", value:"Oracle MySQL Server version 5.5.40 and
  earlier on Windows.");

  script_tag(name:"solution", value:"Apply the patch from below link,
  http://www.oracle.com/technetwork/topics/security/cpujan2015-1972971.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/62525");
  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/cpujan2015-1972971.html");

  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Databases");
  script_dependencies("mysql_version.nasl", "os_detection.nasl");
  script_require_ports("Services/mysql", 3306);
  script_mandatory_keys("MySQL/installed","Host/runs_windows");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

## Variable Initialization
mysqlVer = "";
sqlPort = "";

## Get Port
if(!sqlPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get version
if(!mysqlVer = get_app_version(cpe:CPE, port:sqlPort))
{
  CPE = "cpe:/a:mysql:mysql";
  if(!mysqlVer = get_app_version(cpe:CPE, port:sqlPort)){
    exit(0);
  }
}

if(mysqlVer =~ "^(5\.5)")
{
  if(version_in_range(version:mysqlVer, test_version:"5.5", test_version2:"5.5.40"))
  {
    report = 'Installed version: ' + mysqlVer + '\n';
    security_message(data:report, port:sqlPort);
    exit(0);
  }
}
