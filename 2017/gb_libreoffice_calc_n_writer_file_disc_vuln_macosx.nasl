###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_libreoffice_calc_n_writer_file_disc_vuln_macosx.nasl 8091 2017-12-13 06:22:57Z teissa $
#
# LibreOffice Calc And Writer File Disclosure Vulnerability (Mac OS X)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:libreoffice:libreoffice";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810579");
  script_version("$Revision: 8091 $");
  script_cve_id("CVE-2017-3157");
  script_bugtraq_id(96402);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-12-13 07:22:57 +0100 (Wed, 13 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-03-07 13:15:32 +0530 (Tue, 07 Mar 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("LibreOffice Calc And Writer File Disclosure Vulnerability (Mac OS X)");

  script_tag(name: "summary" , value:"The host is installed with LibreOffice
  and is prone to arbitrary file disclosure vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exists as embedded Objects in 
  writer and calc can contain previews of their content. A document can be 
  crafted which contains an embedded object that is a link to an existing file 
  on the targets system. On load the preview of the embedded object will be 
  updated to reflect the content of the file on the target system.");

  script_tag(name: "impact" , value:"Successful exploitation will allow local
  attacker to obtain sensitive information that may aid in launching further 
  attacks.

  Impact Level: Application");

  script_tag(name: "affected" , value:"LibreOffice version prior to 5.1.6, 5.2.x
  prior to 5.2.5 on Mac OS X.");

  script_tag(name: "solution" , value:"Upgrade to LibreOffice version
  5.1.6 or 5.2.5 or 5.3.0 later. For updates refer to
  http://www.libreoffice.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://www.securitytracker.com/id/1037893");
  script_xref(name : "URL" , value : "http://www.libreoffice.org/about-us/security/advisories/cve-2017-3157");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_libreoffice_detect_macosx.nasl");
  script_mandatory_keys("LibreOffice/MacOSX/Version");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
libreVer = "";
report = "";

## Get version
if(!libreVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less(version:libreVer, test_version:"5.1.6"))
{
  fix = "5.1.6";
  VULN = TRUE;
}
else if(version_in_range(version:libreVer, test_version:"5.2.0", test_version2:"5.2.4"))
{
  fix = "5.2.5 or 5.3.0";
  VULN = TRUE;
}

if(VULN)
{
  report = report_fixed_ver(installed_version:libreVer, fixed_version:fix);
  security_message(data:report);
  exit(0);
}
