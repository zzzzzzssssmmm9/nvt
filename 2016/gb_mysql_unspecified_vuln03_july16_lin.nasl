###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mysql_unspecified_vuln03_july16_lin.nasl 61124 2016-07-21 12:47:01 +0530 july$
#
# Oracle MySQL Unspecified Vulnerability-03 July16 (Linux)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.808701");
  script_version("$Revision: 7545 $");
  script_cve_id("CVE-2016-3452");
  script_bugtraq_id(91999);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 13:45:30 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2016-07-21 12:53:30 +0530 (Thu, 21 Jul 2016)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("Oracle MySQL Unspecified Vulnerability-03 July16 (Linux)");

  script_tag(name:"summary", value:"This host is running Oracle MySQL and is
  prone to an unspecified vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"An unspecified error exist in the MySQL Server
  component via unknown vectors related to Security Encryption.");

  script_tag(name:"impact", value:"Successful exploitation will allows 
  remote attacker to affect confidentiality via unknown vectors.

  Impact Level: Application");

  script_tag(name:"affected", value:"Oracle MySQL Server 5.5.48 and earlier,
  5.6.29 and earlier, 5.7.10 and earlier on Linux");

  script_tag(name:"solution", value:"Apply the patch from below link,
  http://www.oracle.com/technetwork/security-advisory/cpujul2016-2881720.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/security-advisory/cpujul2016-2881720.html");

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Databases");
  script_dependencies("mysql_version.nasl", "os_detection.nasl");
  script_require_ports("Services/mysql", 3306);
  script_mandatory_keys("MySQL/installed","Host/runs_unixoide");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
mysqlVer = "";
sqlPort = "";

## Get Port
if(!sqlPort = get_app_port(cpe:CPE)){
  CPE = "cpe:/a:mysql:mysql";
  if(!sqlPort = get_app_port(cpe:CPE)){
    exit(0);
  }
}

## Get version
if(!mysqlVer = get_app_version(cpe:CPE, port:sqlPort)){
  exit(0);
}

if(mysqlVer =~ "^(5\.(5|6|7))")
{
  if(version_in_range(version:mysqlVer, test_version:"5.5.0", test_version2:"5.5.48") ||
     version_in_range(version:mysqlVer, test_version:"5.6.0", test_version2:"5.6.29") ||
     version_in_range(version:mysqlVer, test_version:"5.7.0", test_version2:"5.7.10"))
  {
    report = report_fixed_ver( installed_version:mysqlVer, fixed_version: "Apply the patch" );
    security_message(data:report, port:sqlPort);
    exit(0);
  }
}
