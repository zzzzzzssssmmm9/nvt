###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_mult_vuln_jan11_lin.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# Google Chrome Multiple Vulnerabilities - Jan11 (Linux)
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation could allow attackers to cause a denial of service.
  Impact Level: Application";
tag_affected = "Google Chrome version prior to 8.0.552.237 on Linux";
tag_insight = "- An unspecified error exists within the extensions notification handling.
  - An unspecified error exists when handling pointers within node iteration.
  - An unspecified error exists when printing multi-page PDF files.
  - An error when handling CSS and canvas can be exploited to reference a stale
    pointer.
  - An error when handling CSS and cursors can be exploited to reference a stale
    pointer.
  - A use-after-free error when handling PDF pages can be exploited to reference
    freed memory.
  - An error due to an out-of-memory condition when processing PDF files can be
    exploited to cause stack corruption.
  - An error when handling mismatched video frame sizes can be exploited to
    reference invalid memory.
  - An error when handling SVG '<use>' elements can be exploited to reference
    a stale pointer.
  - An error when handling rouge extensions can be exploited to reference an
    uninitialised pointer.
  - An error within the Vorbis decoder can be exploited to cause a buffer
    overflow.
  - An error within PDF shading can be exploited to cause a buffer overflow.
  - An error when handling anchors may result in an incorrect type cast.
  - An error when handling videos may result in an incorrect type cast.
  - An error after removal of a DOM node may result in a stale rendering node.
  - An error when handling speech can be exploited to reference a stale pointer.";
tag_solution = "Upgrade to the Google Chrome 8.0.552.237 or later,
  For updates refer to http://www.google.com/chrome";
tag_summary = "The host is running Google Chrome and is prone to multiple
  vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801826");
  script_version("$Revision: 9351 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-01-27 07:47:27 +0100 (Thu, 27 Jan 2011)");
  script_cve_id("CVE-2011-0470", "CVE-2011-0471", "CVE-2011-0472", "CVE-2011-0473",
                "CVE-2011-0474", "CVE-2011-0475", "CVE-2011-0476", "CVE-2011-0477",
                "CVE-2011-0478", "CVE-2011-0479", "CVE-2011-0480", "CVE-2011-0481",
                "CVE-2011-0482", "CVE-2011-0483", "CVE-2011-0484", "CVE-2011-0485");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Google Chrome multiple vulnerabilities - Jan11 (Linux)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/42850/");
  script_xref(name : "URL" , value : "http://googlechromereleases.blogspot.com/2011/01/chrome-stable-release.html");

  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_google_chrome_detect_lin.nasl");
  script_require_keys("Google-Chrome/Linux/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

## Get the version from KB
chromeVer = get_kb_item("Google-Chrome/Linux/Ver");
if(!chromeVer){
  exit(0);
}

## Check for Google Chrome Version less than 8.0.552.237
if(version_is_less(version:chromeVer, test_version:"8.0.552.237")){
  security_message(0);
}