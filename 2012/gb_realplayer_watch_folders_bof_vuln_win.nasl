###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_realplayer_watch_folders_bof_vuln_win.nasl 9352 2018-04-06 07:13:02Z cfischer $
#
# RealPlayer Watch Folders Function Buffer Overflow Vulnerability (Windows)
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

tag_impact = "Successful exploitation will allow remote attackers to execute
arbitrary code on the system.

Impact Level: System/Application";

tag_affected = "RealPlayer version 15.0.5.109";

tag_insight = "The 'Watch Folders' function fails to process an overly long
directory path, which can be exploited to cause stack-based buffer overflow via
a crafted ZIP file.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is installed with RealPlayer and is prone to buffer
overflow vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803043");
  script_version("$Revision: 9352 $");
  script_cve_id("CVE-2012-4987");
  script_bugtraq_id(56324);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-11-06 12:38:20 +0530 (Tue, 06 Nov 2012)");
  script_name("RealPlayer Watch Folders Function Buffer Overflow Vulnerability (Windows)");
  script_xref(name : "URL" , value : "http://seclists.org/fulldisclosure/2012/Oct/189");
  script_xref(name : "URL" , value : "http://www.reactionpenetrationtesting.co.uk/realplayer-watchfolders.html");
  script_xref(name : "URL" , value : "http://packetstormsecurity.org/files/117691/Realplayer-Watchfolders-Long-Filepath-Overflow.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("gb_realplayer_detect_win.nasl");
  script_require_keys("RealPlayer/Win/Ver");
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
rpVer = "";

#Get Version
rpVer = get_kb_item("RealPlayer/Win/Ver");
if(!rpVer){
  exit(0);
}

## Check for Realplayer 15.0.5.109
if(version_is_equal(version:rpVer, test_version:"15.0.5.109")){
  security_message(0);
}
