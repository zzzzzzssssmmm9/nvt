###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_orca_browser_js_n_data_uri_xss_vuln.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Orca Browser 'javascript:' And 'data:' URI XSS Vulnerability
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow attackers to conduct
Cross-Site Scripting attacks in the victim's system.

Impact Level: Application";

tag_affected = "Orca Browser version 1.2 Build 5 on Windows.";

tag_insight = "Error occurs when application fails to sanitise the
'javascript:' and 'data:' URIs in Refresh headers or Location headers in HTTP
responses, which can be exploited via vectors related to injecting a Refresh
header or Location HTTP response header.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is installed with Orca Browser Browser and is prone
to Cross-Site Scripting vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801101");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-09-08 18:25:53 +0200 (Tue, 08 Sep 2009)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_cve_id("CVE-2009-3017");
  script_name("Orca Browser 'javascript:' And 'data:' URI XSS Vulnerability");
  script_xref(name : "URL" , value : "http://websecurity.com.ua/3386/");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/53002");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/archive/1/506163/100/0/threaded");

  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_orca_browser_detect.nasl");
  script_require_keys("OrcaBrowser/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("version_func.inc");

# Get for Orca Browser
orcaVer = get_kb_item("OrcaBrowser/Ver");

if(orcaVer)
{
  # Check for Orca Browser Version 1.2 Build 5 (1.2.0.5)
  if(version_is_equal(version:orcaVer, test_version:"1.2.0.5")){
    security_message(0);
  }
}
