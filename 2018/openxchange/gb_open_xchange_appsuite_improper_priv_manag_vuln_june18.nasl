###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_open_xchange_appsuite_improper_priv_manag_vuln_june18.nasl 10868 2018-08-10 05:36:57Z ckuersteiner $
#
# Open-Xchange (OX) AppSuite Improper Privilege Management Vulnerability-June18
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:open-xchange:open-xchange_appsuite";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813445");
  script_version("$Revision: 10868 $");
  script_cve_id("CVE-2017-17062");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 07:36:57 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-06-19 12:05:29 +0530 (Tue, 19 Jun 2018)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Open-Xchange (OX) AppSuite Improper Privilege Management Vulnerability-June18");

  script_tag(name:"summary", value:"The host is installed with Open-Xchange (OX)
  AppSuite and is prone to improper privilege management vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an error in the
  the backend component in Open-Xchange OX App Suite where certain 'user
  attributes' can be saved by using arbitrary users identifiers within the same
  context.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to void non-repudiation, as there seems no way to access other users attributes.

  Impact Level: Application");

  script_tag(name:"affected", value:"Open-Xchange OX App Suite before 7.6.3-rev35,
  7.8.x before 7.8.2-rev38, 7.8.3 before 7.8.3-rev41, and 7.8.4 before 7.8.4-rev19");

  script_tag(name:"solution", value:"Upgrade to Open-Xchange (OX) AppSuite
  version 7.6.3-rev35 or 7.8.2-rev38 or 7.8.3-rev41 or 7.8.4-rev19 or later.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://www.open-xchange.com");
  script_xref(name:"URL", value:"https://www.exploit-db.com/exploits/44881");
  script_xref(name:"URL", value:"http://seclists.org/fulldisclosure/2018/Jun/23");
  script_xref(name:"URL", value:"https://packetstormsecurity.com/files/148118");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_ox_app_suite_detect.nasl");
  script_mandatory_keys("open_xchange_appsuite/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!oxPort = get_app_port(cpe:CPE)){
  exit(0);
}

infos = get_app_version_and_location(cpe:CPE, port:oxPort, exit_no_version:TRUE);
oxVer = infos['version'];
path = infos['location'];

oxRev = get_kb_item("open_xchange_appsuite/" + oxPort + "/revision");
if(!oxRev){
  exit(0);
}

oxVer = oxVer + "." + oxRev;

if(version_is_less(version:oxVer, test_version:"7.6.3.35")){
  fix = "7.6.3-rev35";
}

else if(version_in_range( version:oxVer, test_version:"7.8.2", test_version2: "7.8.2.37")){
  fix = "7.8.2-rev38";
}

else if(version_in_range( version:oxVer, test_version:"7.8.3", test_version2: "7.8.3.40")){
  fix = "7.8.3-rev41";
}

else if(version_in_range( version:oxVer, test_version:"7.8.4", test_version2: "7.8.4.18")){
  fix = "7.8.4-rev19";
}

if(fix)
{
  report = report_fixed_ver(installed_version:oxVer, fixed_version:fix, install_path:path);
  security_message(data:report, port:oxPort);
  exit(0);
}
exit(0);
