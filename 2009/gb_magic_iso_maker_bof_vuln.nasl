###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_magic_iso_maker_bof_vuln.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Magic ISO Maker Buffer Overflow Vulnerability
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

tag_impact = "Successful exploitation will let the attacker execute arbitrary codes in
  the context of the application and can cause Heap Overflow.

  Impact level: Application";

tag_affected = "Magic ISO Maker version 5.5 build 274 and prior.";
tag_insight = "This flaw is due to inadequate boundary check while processing 'CCD'
  image files.";
tag_solution = "No solution or patch was made available for at least one year since
  disclosure of this vulnerability. Likely none will be provided anymore. General
  solution options are to upgrade to a newer release, disable respective features,
  remove the product or replace the product by another one
  For updates refer to http://www.magiciso.com/download.htm";
tag_summary = "This host is running Magic ISO Maker and is prone to Heap-Based
  Buffer Overflow Vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800273");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-04-13 15:50:35 +0200 (Mon, 13 Apr 2009)");
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:C");
  script_cve_id("CVE-2009-1257");
  script_name("Magic ISO Maker Buffer Overflow Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/34595");
  script_xref(name : "URL" , value : "http://www.milw0rm.com/exploits/8343");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2009/0940");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("gb_magic_iso_maker_detect.nasl");
  script_require_keys("MagicISOMaker/Ver");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("version_func.inc");

magicVer = get_kb_item("MagicISOMaker/Ver");
if(!magicVer){
  exit(0);
}

# Grep for Magic ISO maker version 5.5.0274 or prior.
if(version_is_less_equal(version:magicVer, test_version:"5.5.0274")){
  security_message(0);
}
