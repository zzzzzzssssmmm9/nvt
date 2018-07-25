###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_safari_plugin_code_exec_vuln_win.nasl 9352 2018-04-06 07:13:02Z cfischer $
#
# Apple Safari Plugin Unloading Remote Code Execution Vulnerability (Windows)
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

tag_impact = "Successful exploitation could allow attackers to execute arbitrary
code by tricking a user into visiting a specially crafted web page.

Impact Level: System/Application";

tag_affected = "Apple Safari version 5.1.2 on Windows";

tag_insight = "The flaw is due to unloading of plug-ins when navigating to
a new page, which allows remote attackers to execute arbitrary code via a
crafted web page while the user interacts with the plug-in.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is installed with Apple Safari web browser and is prone
to remote code execution vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802819");
  script_version("$Revision: 9352 $");
  script_cve_id("CVE-2011-3845");
  script_bugtraq_id(52325);
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-03-19 12:27:04 +0530 (Mon, 19 Mar 2012)");
  script_name("Apple Safari Plugin Unloading Remote Code Execution Vulnerability (Windows)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/45758");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/52325");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/73713");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_apple_safari_detect_win_900003.nasl");
  script_require_keys("AppleSafari/Version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("version_func.inc");

# Variable Initialization
safVer = NULL;

safVer = get_kb_item("AppleSafari/Version");
if(!safVer){
  exit(0);
}

## Check for Apple Safari Versions 5.1.2 -> 5.34.52.7
if(version_is_equal(version:safVer, test_version:"5.34.52.7")){
  security_message(0);
}
