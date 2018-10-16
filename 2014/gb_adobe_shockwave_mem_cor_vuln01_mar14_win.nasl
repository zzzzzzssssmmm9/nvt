###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_shockwave_mem_cor_vuln01_mar14_win.nasl 2014-03-21 14:04:57Z Mar$
#
# Adobe Shockwave Player Memory Corruption Vulnerability Mar14 (Windows)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:adobe:shockwave_player";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804517");
  script_version("$Revision: 11867 $");
  script_cve_id("CVE-2014-0505");
  script_bugtraq_id(66182);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:48:11 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-03-21 14:04:57 +0530 (Fri, 21 Mar 2014)");
  script_name("Adobe Shockwave Player Memory Corruption Vulnerability Mar14 (Windows)");


  script_tag(name:"summary", value:"This host is installed with Adobe Shockwave Player and is prone to memory
corruption vulnerability.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Flaw is due to an unspecified error.");
  script_tag(name:"impact", value:"Successful exploitation will allow attackers to execute arbitrary code, cause
memory corruption and compromise a user's system.");
  script_tag(name:"affected", value:"Adobe Shockwave Player version before 12.1.0.150 on Windows.");
  script_tag(name:"solution", value:"Upgrade to version 12.1.0.150 or later.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/57277");
  script_xref(name:"URL", value:"https://www.hkcert.org/my_url/en/alert/14031701");
  script_xref(name:"URL", value:"http://helpx.adobe.com/security/products/shockwave/apsb14-10.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_shockwave_player_detect.nasl");
  script_mandatory_keys("Adobe/ShockwavePlayer/Ver");
  script_xref(name:"URL", value:"http://get.adobe.com/shockwave");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!playerVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:playerVer, test_version:"12.1.0.150"))
{
  security_message( port: 0, data: "The target host was found to be vulnerable" );
  exit(0);
}
