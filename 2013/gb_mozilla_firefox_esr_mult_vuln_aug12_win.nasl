###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_esr_mult_vuln_aug12_win.nasl 9911 2018-05-18 13:49:23Z cfischer $
#
# Mozilla Firefox ESR Multiple Vulnerabilities - August12 (Windows)
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803904");
  script_version("$Revision: 9911 $");
  script_cve_id("CVE-2012-3974", "CVE-2012-3980");
  script_bugtraq_id(55249);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-05-18 15:49:23 +0200 (Fri, 18 May 2018) $");
  script_tag(name:"creation_date", value:"2013-07-17 12:01:15 +0530 (Wed, 17 Jul 2013)");
  script_name("Mozilla Firefox ESR Multiple Vulnerabilities - August12 (Windows)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/50088");
  script_xref(name : "URL" , value : "http://securitytracker.com/id/1027450");
  script_xref(name : "URL" , value : "http://securitytracker.com/id/1027451");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2012/mfsa2012-67.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2012/mfsa2012-72.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_portable_win.nasl");
  script_mandatory_keys("Firefox-ESR/Win/Ver");
  script_tag(name : "impact" , value : "Successful exploitation could allow attackers to inject scripts, bypass
  certain security restrictions, execute arbitrary code in the context of the
  browser.
  Impact Level: System/Application");
  script_tag(name : "affected" , value : "Mozilla Firefox ESR version 10.x before 10.0.7 on Windows");
  script_tag(name : "insight" , value : "- An error in the installer will launch incorrect executable following new
    installation via a crafted executable file in a root directory.
  - An error in the web console can be exploited to inject arbitrary code that
    will be executed with chrome privileges.");
  script_tag(name : "solution" , value : "Upgrade to Mozilla Firefox ESR version 10.0.7 or later
  For updates refer to http://www.mozilla.com/en-US/firefox/all.html");
  script_tag(name : "summary" , value : "This host is installed with Mozilla Firefox ESR and is prone to multiple
  vulnerabilities.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");


ffVer = "";
ffVer = get_kb_item("Firefox-ESR/Win/Ver");

if(ffVer)
{
  if(version_in_range(version:ffVer, test_version:"10.0", test_version2:"10.0.6"))
  {
    security_message(0);
    exit(0);
  }
}
