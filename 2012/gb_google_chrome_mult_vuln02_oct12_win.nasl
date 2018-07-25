###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_mult_vuln02_oct12_win.nasl 10133 2018-06-08 11:13:34Z asteins $
#
# Google Chrome Multiple Vulnerabilities-02 Oct12 (Windows)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802473");
  script_version("$Revision: 10133 $");
  script_cve_id("CVE-2012-5112", "CVE-2012-5376");
  script_bugtraq_id(55867);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-06-08 13:13:34 +0200 (Fri, 08 Jun 2018) $");
  script_tag(name:"creation_date", value:"2012-10-15 11:14:26 +0530 (Mon, 15 Oct 2012)");
  script_name("Google Chrome Multiple Vulnerabilities-02 Oct12 (Windows)");
  script_xref(name : "URL" , value : "http://blog.chromium.org/2012/10/pwnium-2-results-and-wrap-up_10.html");
  script_xref(name : "URL" , value : "http://googlechromereleases.blogspot.in/2012/10/stable-channel-update_6105.html");

  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_google_chrome_detect_portable_win.nasl");
  script_require_keys("GoogleChrome/Win/Ver");
  script_tag(name : "impact" , value : "Successful exploitation could allow the attackers to execute arbitrary code
  and cause a denial of service.
  Impact Level: System/Application");
  script_tag(name : "affected" , value : "Google Chrome version prior to 22.0.1229.94 on Windows");
  script_tag(name : "insight" , value : "Multiple flaws are due to
  - Use-after-free erorr in the SVG implementation in WebKit, allows remote
    attackers to execute arbitrary code via unspecified vectors.
  - An erorr in Inter-process Communication (IPC) implementation, allows
    remote attackers to bypass intended sandbox restrictions and write to
    arbitrary files by leveraging access to a renderer process.");
  script_tag(name : "solution" , value : "Upgrade to the Google Chrome 22.0.1229.94 or later,
  For updates refer to http://www.google.com/chrome");
  script_tag(name : "summary" , value : "This host is installed with Google Chrome and is prone to multiple
  vulnerabilities.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

chromeVer = get_kb_item("GoogleChrome/Win/Ver");
if(!chromeVer){
  exit(0);
}

if(version_is_less(version:chromeVer, test_version:"22.0.1229.94")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}
