###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_firefox_url_spoof_vuln_lin.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Firefox URL Spoofing And Phising Vulnerability (Linux)
#
# Authors:
# Nikita MR <rnikita@secpod.com>
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

tag_impact = "Successful remote exploitation will let the attacker spoof the URL
  information by using homoglyphs of say the /(slash) and ?(question mark)and
  can gain sensitive information by redirecting the user to any malicious URL.
  Impact Level: Application";
tag_affected = "Mozilla Firefox version 3.0.6 and prior on Linux.";
tag_insight = "Firefox doesn't properly prevent the literal rendering of homoglyph
  characters in IDN domain names. This renders the user vulnerable to URL
  spoofing and phising attacks as the atatcker may redirect the user to a
  different arbitrary malformed website.";
tag_solution = "Upgrade to Mozilla Firefox version 3.6.3 or later
  For updates refer to http://www.mozilla.com/en-US/firefox/";
tag_summary = "The host is installed with Mozilla Firefox browser and is prone
  to URL spoofing and phising vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900512");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-02-26 05:27:20 +0100 (Thu, 26 Feb 2009)");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:P");
  script_cve_id("CVE-2009-0652");
  script_bugtraq_id(33837);
  script_name("Firefox URL Spoofing And Phising Vulnerability (Linux)");


  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("General");
  script_dependencies("gb_firefox_detect_lin.nasl");
  script_require_keys("Firefox/Linux/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "http://www.mozilla.org/projects/security/tld-idn-policy-list.html");
  script_xref(name : "URL" , value : "http://www.blackhat.com/html/bh-dc-09/bh-dc-09-speakers.html#Marlinspike");
  exit(0);
}


include("version_func.inc");

firefoxVer = get_kb_item("Firefox/Linux/Ver");
if(!firefoxVer){
  exit(0);
}

if(version_is_less_equal(version:firefoxVer, test_version:"3.0.6")){
  security_message(0);
}
