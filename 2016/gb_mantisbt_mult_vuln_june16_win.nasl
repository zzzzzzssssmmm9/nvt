###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mantisbt_mult_vuln_june16_win.nasl 7545 2017-10-24 11:45:30Z cfischer $
#
# MantisBT SOAP API Information Disclosure Vulnerability - June16 (Windows)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:mantisbt:mantisbf";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807599");
  script_version("$Revision: 7545 $");
  script_cve_id("CVE-2014-9759");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 13:45:30 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2016-06-03 17:28:35 +0530 (Fri, 03 Jun 2016)");
  script_name("MantisBT SOAP API Information Disclosure Vulnerability - June16 (Windows)");

  script_tag(name:"summary", value:"This host is installed with MantisBT
  and is prone to an incomplete blacklist vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with
  the help of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to an incomplete blacklist
  vulnerability in the config_is_private function in 'config_api.php script' . 
  When a new config is added or an existing one is renamed, the black list must 
  be updated accordingly. If this is not or incorrectly done, the 
  config becomes available via SOAP API");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to obtain sensitive master salt configuration information via a SOAP API request.

  Impact Level: Application");

  script_tag(name:"affected", value:"MantisBT versions 1.3.x before 1.3.0 
  on Windows");

  script_tag(name:"solution", value:"No so solution or patch is available as of
  2nd June, 2016. Information regarding this issue will be updated once the solution 
  details are available.For updates refer to http://www.mantisbt.org/download.php");

  script_tag(name:"solution_type", value:"NoneAvailable");

  script_xref(name:"URL", value:"http://www.openwall.com/lists/oss-security/2016/01/02/1");
  script_xref(name:"URL", value:"https://mantisbt.org/bugs/view.php?id=20277");

  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("mantis_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("mantisbt/installed","Host/runs_windows");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
manPort = "";
manVer = "";

## get the port
if(!manPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get the version
if(!manVer = get_app_version(cpe:CPE, port:manPort)){
  exit(0);
}

## >= 1.3.0-beta.1
##Fixed in versions:1.3.0 (not yet released), possibly 1.3.0-rc.2
if(version_is_equal(version:manVer, test_version:"1.3.0-beta.1") ||
   version_is_equal(version:manVer, test_version:"1.3.0-beta.2") ||
   version_is_equal(version:manVer, test_version:"1.3.0-beta.3") ||
   version_is_equal(version:manVer, test_version:"1.3.0-rc.1"))
{
  report = report_fixed_ver(installed_version:manVer, fixed_version:"None available");
  security_message(data:report, port:manPort);
  exit(0);
}