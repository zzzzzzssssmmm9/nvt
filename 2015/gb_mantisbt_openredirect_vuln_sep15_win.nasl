###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mantisbt_openredirect_vuln_sep15_win.nasl 7546 2017-10-24 11:58:30Z cfischer $
#
# MantisBT Open Redirect Vulnerability September15 (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:mantisbt:mantisbt";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805972");
  script_version("$Revision: 7546 $");
  script_cve_id("CVE-2015-1042");
  script_bugtraq_id(71988);
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 13:58:30 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2015-09-07 12:56:25 +0530 (Mon, 07 Sep 2015)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("MantisBT Open Redirect Vulnerability September15 (Windows)");

  script_tag(name:"summary", value:"This host is running MantisBT and is prone
  to open redirect vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to use of an incorrect regular
  expression within string_sanitize_url function in core/string_api.php script.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to create a specially crafted URL, that if clicked, would redirect
  a victim from the intended legitimate web site to an arbitrary web site of the
  attacker's choosing.

  Impact Level: Application");

  script_tag(name:"affected", value:"MantisBT versions 1.2.0a3 through 1.2.18
  on Windows");

  script_tag(name:"solution", value:"Upgrade to version 1.2.19 or later, For
  updates refer to http://www.mantisbt.org.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://packetstormsecurity.com/files/130142");
  script_xref(name : "URL" , value : "http://seclists.org/fulldisclosure/2015/Jan/110");
  script_xref(name : "URL" , value : "http://www.openwall.com/lists/oss-security/2015/01/10/5");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("mantis_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("mantisbt/installed","Host/runs_windows");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
mantisPort = 0;
mantisVer = "";

## Get HTTP Port
if(!mantisPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get Version
if(!mantisVer = get_app_version(cpe:CPE, port:mantisPort)){
  exit(0);
}

##Check for 1.2.0a3, 1.2.0rc1, 1.2.0rc2 , 1.2.1 <= 1.2.18
if(version_in_range(version:mantisVer, test_version:"1.2.0", test_version2:"1.2.18"))
{
  report = 'Installed version: ' + mantisVer + '\n' +
           'Fixed version:     ' + "1.2.19" + '\n';
  security_message(data:report, port:mantisPort);
  exit(0);
}
