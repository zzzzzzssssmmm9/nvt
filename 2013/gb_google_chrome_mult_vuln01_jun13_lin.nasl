###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_mult_vuln01_jun13_lin.nasl 9353 2018-04-06 07:14:20Z cfischer $
#
# Google Chrome Multiple Vulnerabilities-01 June13 (Linux)
#
# Authors:
# Arun Kallavi <karun@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow attackers to execute arbitrary code,
  bypass security restrictions, corrupt memory, or cause denial of service
  conditions.
  Impact Level: System/Application";

tag_affected = "Google Chrome version prior to 27.0.1453.110 on Linux";
tag_insight = "Multiple flaws due to,
  - Use-after-free errors in input handling, image handling, HTML5 Audio, SVG,
    and when accessing database APIs.
  - Unspecified erros with dev tools API, Skia GPU handling, SSL socket
    handling, and PDF viewer.";
tag_solution = "Upgrade to the Google Chrome 27.0.1453.110 or later,
  For updates refer to http://www.google.com/chrome";
tag_summary = "The host is installed with Google Chrome and is prone to multiple
  vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803648");
  script_version("$Revision: 9353 $");
  script_cve_id("CVE-2013-2865", "CVE-2013-2864", "CVE-2013-2863", "CVE-2013-2862",
                "CVE-2013-2861", "CVE-2013-2860", "CVE-2013-2859", "CVE-2013-2858",
                "CVE-2013-2857", "CVE-2013-2856", "CVE-2013-2855", "CVE-2013-2854");
  script_bugtraq_id(60395, 60396, 60397, 60398, 60399, 60400, 60401, 60402, 60403,
                    60404, 60405, 60406);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-06-11 15:37:34 +0530 (Tue, 11 Jun 2013)");
  script_name("Google Chrome Multiple Vulnerabilities-01 June13 (Linux)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/53681");
  script_xref(name : "URL" , value : "http://www.securelist.com/en/advisories/53681");
  script_xref(name : "URL" , value : "http://googlechromereleases.blogspot.in/2013/06/stable-channel-update.html");
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_google_chrome_detect_lin.nasl");
  script_mandatory_keys("Google-Chrome/Linux/Ver");
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

## Variable Initialization
chromeVer = "";

## Get the version from KB
chromeVer = get_kb_item("Google-Chrome/Linux/Ver");
if(!chromeVer){
  exit(0);
}

## Check for Google Chrome Version less than 27.0.1453.110
if(version_is_less(version:chromeVer, test_version:"27.0.1453.110"))
{
  security_message(0);
  exit(0);
}
