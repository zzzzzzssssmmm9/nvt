###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_shockwave_player_mult_vuln_nov12_win.nasl 9352 2018-04-06 07:13:02Z cfischer $
#
# Adobe Shockwave Player Multiple Vulnerabilities Nov-2012 (Windows)
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

tag_impact = "Successful exploitation will allow an attacker to cause denial of service or
  execute arbitrary code by tricking a user into visiting a specially crafted
  web page.
  Impact Level: System/Application";
tag_affected = "Adobe Shockwave Player Versions prior to 11.6.8.638 on Windows";
tag_insight = "The flaws are due to memory corruption errors and array indexing error
  when processing malformed file.";
tag_solution = "Upgrade to Adobe Shockwave Player 11.6.8.638 or later,
  For updates refer to http://get.adobe.com/shockwave/otherversions/";
tag_summary = "This host is installed with Adobe Shockwave Player and is prone
  to multiple vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802485");
  script_version("$Revision: 9352 $");
  script_cve_id("CVE-2012-4172", "CVE-2012-4173", "CVE-2012-4174", "CVE-2012-4175",
                "CVE-2012-4176", "CVE-2012-5273");
  script_bugtraq_id(56194, 56195, 56190, 56193, 56188, 56187);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-11-02 15:48:07 +0530 (Fri, 02 Nov 2012)");
  script_name("Adobe Shockwave Player Multiple Vulnerabilities Nov-2012 (Windows)");
  script_xref(name : "URL" , value : "http://seclists.org/cert/2012/108");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/51090/");
  script_xref(name : "URL" , value : "http://www.securitytracker.com/id/1027692");
  script_xref(name : "URL" , value : "http://www.adobe.com/support/security/bulletins/apsb12-23.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_shockwave_player_detect.nasl");
  script_require_keys("Adobe/ShockwavePlayer/Ver");
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

## Variables Initialization
shockVer = NULL;

shockVer = get_kb_item("Adobe/ShockwavePlayer/Ver");
if(!shockVer){
  exit(0);
}

## Check for Adobe Shockwave Player versions prior to 11.6.8.638
if(version_is_less(version:shockVer, test_version:"11.6.8.638")){
  security_message(0);
}
