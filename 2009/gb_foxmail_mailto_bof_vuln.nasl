###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_foxmail_mailto_bof_vuln.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# FoxMail Client Buffer Overflow Vulnerability
#
# Authors:
# Sujit Ghosal <sghosal@secpod.com>
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

tag_impact = "Successful exploitation will allow attacker to insert a long crafted
  URI in the MAILTO field and can cause a stack overflow to the application.
  Impact Level: Application";
tag_affected = "Foxmail version 6.5 or prior on Windows.";
tag_insight = "This flaw is due to lack of sanitization and boundary check in the user
  supplied data which can be exploited by adding a long URL length in the
  HREF attribute of an A element.";
tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.
For updates refer to http://www.foxmail.com.cn";
tag_summary = "This host is installed with FoxMail Client and is prone to Buffer
  Overflow Vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800220");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-01-08 14:06:04 +0100 (Thu, 08 Jan 2009)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2008-5839");
  script_bugtraq_id(31294);
  script_name("FoxMail Client Buffer Overflow vulnerability");
  script_xref(name : "URL" , value : "http://www.sebug.net/exploit/4681");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/45343");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("gb_foxmail_detect.nasl");
  script_mandatory_keys("Foxmail/Win/Ver");

  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);

  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("version_func.inc");

fmVer = get_kb_item("Foxmail/Win/Ver");
if(!fmVer){
  exit(0);
}

# Check for Foxmail version 6.5 or prior
if(version_is_less_equal(version:fmVer, test_version:"6.5")){
  security_message(0);
}
