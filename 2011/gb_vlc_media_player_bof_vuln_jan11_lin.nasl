###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vlc_media_player_bof_vuln_jan11_lin.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# VLC Media Player 'CDG decoder' multiple buffer overflow vulnerabilities (Linux)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation could allow attackers to crash the affected
  application, or execute arbitrary code by convincing a user to open a
  malicious CD+G (CD+Graphics) media file or visit a specially crafted web
  page.
  Impact Level: Application";
tag_affected = "VLC media player version prior to 1.1.6 on Linux";
tag_insight = "The flaws are due to an array indexing errors in the 'DecodeTileBlock()'
  and 'DecodeScroll()' [modules/codec/cdg.c] functions within the CDG decoder
  module when processing malformed data.";
tag_solution = "Upgrade to the VLC media player version 1.1.6 or later,
  For updates refer to http://download.videolan.org/pub/videolan/vlc/";
tag_summary = "The host is installed with VLC Media Player and is prone multiple
  buffer overflow vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801727");
  script_version("$Revision: 9351 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-01-31 05:37:34 +0100 (Mon, 31 Jan 2011)");
  script_cve_id("CVE-2011-0021");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("VLC Media Player 'CDG decoder' multiple buffer overflow vulnerabilities (Linux)");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2011/0185");
  script_xref(name : "URL" , value : "http://openwall.com/lists/oss-security/2011/01/20/3");

  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("secpod_vlc_media_player_detect_lin.nasl");
  script_require_keys("VLCPlayer/Lin/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"executable_version_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

## Get the version from KB
vlcVer = get_kb_item("VLCPlayer/Lin/Ver");
if(!vlcVer){
  exit(0);
}

## Check for VLC Media Player Version less than 1.1.6
if(version_is_less(version:vlcVer, test_version:"1.1.6")){
  security_message(0);
}
