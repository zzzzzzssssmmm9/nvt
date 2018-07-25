###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms_ie_iframe_dos_vuln.nasl 8266 2018-01-01 07:28:32Z teissa $
#
# Microsoft Internet Explorer 'IFRAME' Denial Of Service Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2010 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation will allow remote attackers to cause a
denial of service.

Impact Level: Apllication";

tag_affected = "Microsoft Internet Explorer version 6.0.2900.2180,
8.0.7600.16385, and 7.0.5730.13 prior.";

tag_insight = "The flaw is due to improper handling of an 'IFRAME' element
with a mailto: URL in its 'SRC' attribute, which allows remote attackers to
consume resources via an HTML document with many 'IFRAME' elements.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is installed with Internet Explorer and is prone to
Denial Of Service vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902183");
  script_version("$Revision: 8266 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-01 08:28:32 +0100 (Mon, 01 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-05-25 13:56:16 +0200 (Tue, 25 May 2010)");
  script_cve_id("CVE-2010-1991");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("Microsoft Internet Explorer 'IFRAME' Denial Of Service Vulnerability");


  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Denial of Service");
  script_dependencies("gb_ms_ie_detect.nasl");
  script_require_keys("MS/IE/Version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"WillNotFix");
  script_xref(name : "URL" , value : "http://websecurity.com.ua/4206/");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/archive/1/511327/100/0/threaded");
  exit(0);
}


include("version_func.inc");

ieVer = get_kb_item("MS/IE/Version");
if(!ieVer){
  exit(0);
}

if(version_is_equal(version:ieVer, test_version:"7.0.5730.13") ||
   version_is_equal(version:ieVer, test_version:"6.0.2900.2180") ||
   version_is_equal(version:ieVer, test_version:"8.0.7600.16385")){
  security_message(0);
}
