###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_teamviewer_auth_bypass_vuln_sep18_lin.nasl 11362 2018-09-12 13:37:01Z santu $
#
# TeamViewer Authentication Bypass Vulnerability Sep18 (Linux)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:teamviewer:teamviewer";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813899");
  script_version("$Revision: 11362 $");
  script_cve_id("CVE-2018-16550");
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-12 15:37:01 +0200 (Wed, 12 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-07 13:42:31 +0530 (Fri, 07 Sep 2018)");
  script_name("TeamViewer Authentication Bypass Vulnerability Sep18 (Linux)");

  script_tag(name:"summary", value:"The host is installed with TeamViewer
  Premium is prone to authentication bypass vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"The flaw is due to an improper brute-force
  authentication protection mechanism.");

  script_tag(name:"impact", value:"Successful exploitation would allow attackers
  to bypass the authentication protection mechanism and determine the correct value
  of the default 4-digit PIN.

  Impact Level: Application");

  script_tag(name:"affected", value:"TeamViewer versions 10.x through 13.x on Linux.");

  script_tag(name:"solution", value:"No known solution is available as of 07th
  September, 2018. Information regarding this issue will be updated once solution
  details are available. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"NoneAvailable");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://twitter.com/vah_13/status/1036894081350291457");
  script_xref(name:"URL", value:"https://www.teamviewer.com/en");

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_teamviewer_detect_lin.nasl");
  script_mandatory_keys("TeamViewer/Linux/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
teamVer = infos['version'];
teamPath = infos['location'];

if(teamVer =~ "^(10|13)\.")
{
  report = report_fixed_ver(installed_version:teamVer, fixed_version:"NoneAvailable", install_path:teamPath);
  security_message(data:report);
  exit(0);
}
