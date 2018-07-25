###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_photoshop_png_image_file_bof_vuln_macosx.nasl 10020 2018-05-30 08:48:56Z cfischer $
#
# Adobe Photoshop PNG Image Processing Buffer Overflow Vulnerabilities (Mac OS X)
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:adobe:photoshop_cs6";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803026");
  script_version("$Revision: 10020 $");
  script_cve_id("CVE-2012-4170", "CVE-2012-0275");
  script_bugtraq_id(55333, 55372);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-05-30 10:48:56 +0200 (Wed, 30 May 2018) $");
  script_tag(name:"creation_date", value:"2012-09-03 18:23:45 +0530 (Mon, 03 Sep 2012)");
  script_name("Adobe Photoshop PNG Image Processing Buffer Overflow Vulnerabilities (Mac OS X)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/49141");
  script_xref(name : "URL" , value : "http://www.adobe.com/support/security/bulletins/apsb12-20.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("gb_adobe_photoshop_detect_macosx.nasl");
  script_mandatory_keys("Adobe/Photoshop/MacOSX/Version");

  script_tag(name : "impact" , value : "Successful exploitation will allow attackers to execute arbitrary code.

  Impact Level: System/Application");
  script_tag(name : "affected" , value : "Adobe Photoshop version prior to CS6 (13.0) on Mac OS X");
  script_tag(name : "insight" , value : "- A boundary error in the 'Standard MultiPlugin.8BF' module fails to
    process a Portable Network Graphics (PNG) image, which allows attacker to
    cause a buffer overflow via a specially crafted 'tRNS' chunk size.

  - Improper validation in Photoshop.exe when decompressing
    SGI24LogLum-compressed TIFF images.");
  script_tag(name : "solution" , value : "Upgrade to Adobe Photoshop version CS6 (13.0.1) or later,
  For updates refer to http://www.adobe.com/downloads/");
  script_tag(name : "summary" , value : "This host is installed with Adobe Photoshop and is prone to buffer
  overflow vulnerabilities.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE ) ) exit( 0 );
vers = infos['version'];
path = infos['location'];

if( version_is_equal( version:vers, test_version:"13.0" ) ) {
  report = report_fixed_ver( installed_version:"CS6 " + vers, fixed_version:"13.0.1", install_path:path );
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );