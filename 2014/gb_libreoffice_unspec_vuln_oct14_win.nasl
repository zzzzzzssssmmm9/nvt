#############################################################################/##
# OpenVAS Vulnerability Test
# $Id: gb_libreoffice_unspec_vuln_oct14_win.nasl 10138 2018-06-08 12:45:06Z asteins $
#
# LibreOffice Unspecified Vulnerability Oct14 (Windows)
#
# Authors:
# Deepmala <kdeepmala@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.804928");
  script_version("$Revision: 10138 $");
  script_cve_id("CVE-2014-0247");
  script_bugtraq_id(68151);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-06-08 14:45:06 +0200 (Fri, 08 Jun 2018) $");
  script_tag(name:"creation_date", value:"2014-10-01 12:57:57 +0450 (Wed, 01 Oct 2014)");

  script_name("LibreOffice Unspecified Vulnerability Oct14 (Windows)");

  script_tag(name: "summary" , value:"This host is installed with LibreOffice
  and is prone to unspecified vulnerability.");

  script_tag(name: "vuldetect" , value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name: "insight" , value:"Flaw exists due to the application not
  properly restricting VBA macros in the VBAProject element.");

  script_tag(name: "impact" , value:"Successful exploitation will allow attackers
  to bypass certain security restrictions and execute VBA script code without
  user approval.

  Impact Level: Application");

  script_tag(name: "affected" , value:"LibreOffice version 4.1.4/4.2.0 prior
  to 4.2.5 on Windows");

  script_tag(name: "solution" , value:"Upgrade to LibreOffice 4.2.5 or later,
  For updates refer to http://www.libreoffice.org");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/57383");
  script_xref(name:"URL", value:"https://www.libreoffice.org/about-us/security/advisories/cve-2014-0247");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_libreoffice_detect_portable_win.nasl");
  script_mandatory_keys("LibreOffice/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!libreVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_in_range(version:libreVer, test_version:"4.1.4", test_version2:"4.2.4"))
{
  security_message( port: 0, data: "The target host was found to be vulnerable" );
  exit(0);
}
