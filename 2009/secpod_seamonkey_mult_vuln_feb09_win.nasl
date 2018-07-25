###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_seamonkey_mult_vuln_feb09_win.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Mozilla Seamonkey Multiple Vulnerabilities Feb-09 (Windows)
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation could result in bypassing certain security
  restrictions, information disclosures, JavaScript code executions which
  can be executed with the privileges of the signed users.
  Impact Level: System/Application";
tag_affected = "Seamonkey version prior to 1.1.15 on Windows.";
tag_insight = "Multiple flaws due to,
  - Vectors related to the layout engine and destruction of arbitrary layout
    objects by the 'nsViewManager::Composite' function.
  - Cookies marked 'HTTPOnly' are readable by JavaScript through the request
    calls of XMLHttpRequest methods i.e. XMLHttpRequest.getAllResponseHeaders
    and XMLHttpRequest.getResponseHeader.";
tag_solution = "Upgrade to Seamonkey version 1.1.15
  http://www.seamonkey-project.org/releases";
tag_summary = "The host is installed with Mozilla Seamonkey browser and is prone
  to multiple vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900312");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-02-20 17:40:17 +0100 (Fri, 20 Feb 2009)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-0352", "CVE-2009-0353", "CVE-2009-0356",
                "CVE-2009-0357");
  script_bugtraq_id(33598);
  script_name("Mozilla Seamonkey Multiple Vulnerabilities Feb-09 (Windows)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/33808");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2009/mfsa2009-01.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2009/mfsa2009-04.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2009/mfsa2009-05.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Web application abuses");
  script_dependencies("gb_seamonkey_detect_win.nasl");
  script_require_keys("Seamonkey/Win/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

smVer = get_kb_item("Seamonkey/Win/Ver");
if(!smVer){
  exit(0);
}

# Grep for Seamonkey version < 1.1.15
if(version_is_less(version:smVer, test_version:"1.1.15")){
  security_message(0);
}
