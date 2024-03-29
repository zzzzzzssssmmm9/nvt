##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_stable-channel-update-for-desktop-2016-11_lin.nasl 11493 2018-09-20 09:02:35Z asteins $
#
# Google Chrome Security Updates(stable-channel-update-for-desktop-2016-11)-Linux
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

CPE = "cpe:/a:google:chrome";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810200");
  script_version("$Revision: 11493 $");
  script_cve_id("CVE-2016-5198");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-20 11:02:35 +0200 (Thu, 20 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-11-16 18:08:48 +0530 (Wed, 16 Nov 2016)");
  script_name("Google Chrome Security Updates(stable-channel-update-for-desktop-2016-11)-Linux");

  script_tag(name:"summary", value:"The host is installed with Google Chrome
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The Flaw exists due to an out of bounds
  memory access error in V8.");

  script_tag(name:"impact", value:"Successful exploitation of this
  vulnerability will allow remote attackers to cause information disclosure,
  execute arbitrary code and cause denial of service condition.");

  script_tag(name:"affected", value:"Google Chrome version
  prior to 54.0.2840.90  on Linux");

  script_tag(name:"solution", value:"Upgrade to Google Chrome version
  54.0.2840.90 or later.
  For updates refer to http://www.google.com/chrome");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://googlechromereleases.blogspot.in/2016/11/stable-channel-update-for-desktop.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_google_chrome_detect_lin.nasl");
  script_mandatory_keys("Google-Chrome/Linux/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!chr_ver = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:chr_ver, test_version:"54.0.2840.90"))
{
  report = report_fixed_ver(installed_version:chr_ver, fixed_version:"54.0.2840.90");
  security_message(data:report);
  exit(0);
}
