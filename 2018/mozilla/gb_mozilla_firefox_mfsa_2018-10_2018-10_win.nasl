###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_mfsa_2018-10_2018-10_win.nasl 9923 2018-05-22 13:23:32Z cfischer $
#
# Mozilla Firefox Security Updates(mfsa_2018-10_2018-10)-Windows
#
# Authors:
# Rinu Kuriaksoe <krinu@secpod.com>
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

CPE = "cpe:/a:mozilla:firefox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813056");
  script_version("$Revision: 9923 $");
  script_cve_id("CVE-2018-5148");
  script_bugtraq_id(103506);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-05-22 15:23:32 +0200 (Tue, 22 May 2018) $");
  script_tag(name:"creation_date", value:"2018-03-27 16:43:58 +0530 (Tue, 27 Mar 2018)");
  script_name("Mozilla Firefox Security Updates(mfsa_2018-10_2018-10)-Windows");

  script_tag(name: "summary" , value:"This host is installed with Mozilla Firefox
  and is prone to an use after free vulnerability.");

  script_tag(name: "vuldetect" , value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name: "insight" , value:"The flaw exists due to a use after free
  error in the compositor during certain graphics operations when a raw pointer
  is used instead of a reference counted one.");

  script_tag(name: "impact" , value:"Successful exploitation will allow an
  attacker to crash the affected application and denying service to
  legitimate users.

  Impact Level: Application.");

  script_tag(name: "affected" , value:"Mozilla Firefox version before 59.0.2 on Windows.");

  script_tag(name: "solution" , value:"Upgrade to Mozilla Firefox version 59.0.2
  or later, For updates refer to http://www.mozilla.com/en-US/firefox/all.html");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2018-10");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_portable_win.nasl");
  script_mandatory_keys("Firefox/Win/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE)) exit(0);
ffVer = infos['version'];
ffPath = infos['location'];

if(version_is_less(version:ffVer, test_version:"59.0.2"))
{
  report = report_fixed_ver(installed_version:ffVer, fixed_version:"59.0.2", install_path:ffPath);
  security_message(data:report);
  exit(0);
}

exit(99);
