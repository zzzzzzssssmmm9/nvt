###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mcafee_epolicy_orchestrator_mitm_vuln_jun15.nasl 6505 2017-07-03 09:58:27Z teissa $
#
# McAfee ePolicy Orchestrator Man-in-the-Middle Attack Vulnerability - June15
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

CPE = "cpe:/a:mcafee:epolicy_orchestrator";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805595");
  script_version("$Revision: 6505 $");
  script_cve_id("CVE-2015-2859");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-07-03 11:58:27 +0200 (Mon, 03 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-06-25 14:42:10 +0530 (Thu, 25 Jun 2015)");
  script_name("McAfee ePolicy Orchestrator Man-in-the-Middle Attack Vulnerability - June15");

  script_tag(name:"summary", value:"This host is installed with McAfee ePolicy
  Orchestrator and is prone to man-in-the-middle attack vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists as the application fails to
  properly validate SSL/TLS certificates");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attacker to intercept and manipulate HTTPS traffic between the ePO application
  and registered servers.

  Impact Level: Application");

  script_tag(name:"affected", value:"McAfee ePolicy Orchestrator version 4.x
  through 4.6.9 and 5.x through 5.1.2");

  script_tag(name:"solution", value:"Upgrade to McAfee ePolicy Orchestrator
  version 4.6.9 or 5.1.2 or later, and then apply the manual settings listed in
  given link, https://kc.mcafee.com/corporate/index?page=content&id=KB84628 ");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name:"URL", value:"http://www.kb.cert.org/vuls/id/264092");
  script_xref(name:"URL", value:"https://kc.mcafee.com/corporate/index?page=content&id=KB84628");
  script_xref(name:"URL", value:"https://kc.mcafee.com/corporate/index?page=content&id=SB10120");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_mcafee_epolicy_orchestrator_detect.nasl");
  script_mandatory_keys("mcafee_ePO/installed");
  script_require_ports("Services/www", 8443);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
mcaVer = "";
mcaPort = "";

## get the port
if(!mcaPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get the version
if(!mcaVer = get_app_version(cpe:CPE, port:mcaPort)){
  exit(0);
}

##Check for version, 5.x < 5.1.2
if(version_in_range(version:mcaVer, test_version:"5.0.0", test_version2:"5.1.1"))
{
  fix = "Upgrade to 5.1.2 and apply the manual settings";
  VULN = TRUE;
}

##Check for version, 4.x < 4.6.9
if(version_in_range(version:mcaVer, test_version:"4.0.0", test_version2:"4.6.8"))
{
  fix = "Upgrade to 4.6.9 and apply the manual settings";
  VULN = TRUE;
}

##Check for version, == 4.6.9, prone to FP
if(version_is_equal(version:mcaVer, test_version:"4.6.9"))
{
  fix = "Apply the manual settings";
  VULN = TRUE;
}

##Check for version, == 5.1.2, prone to FP
if(version_is_equal(version:mcaVer, test_version:"5.1.2"))
{
  fix = "Apply the manual settings";
  VULN = TRUE;
}

if(VULN)
{
  report = 'Installed Version: ' + mcaVer + '\n' +
           'Fixed Version:     ' + fix + '\n';

  security_message(data:report, port:mcaPort);
  exit(0);
}
exit(0);