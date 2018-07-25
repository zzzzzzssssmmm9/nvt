###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_esr_sec_bypass_vuln_oct12_win.nasl 9911 2018-05-18 13:49:23Z cfischer $
#
# Mozilla Firefox ESR Security Bypass Vulnerabilities - Oct 12 (Windows)
#
# Authors:
# Arun Kallavi <karun@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803667");
  script_version("$Revision: 9911 $");
  script_cve_id("CVE-2012-4192", "CVE-2012-4193");
  script_bugtraq_id(55889);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-05-18 15:49:23 +0200 (Fri, 18 May 2018) $");
  script_tag(name:"creation_date", value:"2013-07-12 12:20:16 +0530 (Fri, 12 Jul 2013)");
  script_name("Mozilla Firefox ESR Security Bypass Vulnerabilities - Oct 12 (Windows)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/50856");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/50935");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2012/mfsa2012-89.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_portable_win.nasl");
  script_mandatory_keys("Firefox-ESR/Win/Ver");
  script_tag(name : "impact" , value : "Successful exploitation will let attackers to bypass the Same Origin Policy
  and read the properties of a Location object via a crafted web site.
  Impact Level: Application");
  script_tag(name : "affected" , value : "Mozill Firefox ESR versions 10.x before 10.0.9 on Windows");
  script_tag(name : "insight" , value : "Security wrappers are unwrapped without doing a security check in
  defaultValue(). This can allow for improper access to the Location object.");
  script_tag(name : "solution" , value : "Upgrade to Mozilla Firefox ESR 10.0.9 or later
  For updates refer to http://www.mozilla.com/en-US/firefox/all.html");
  script_tag(name : "summary" , value : "The host is installed with Mozilla Firefox ESR and is prone to multiple
  vulnerabilities.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");


ffVer = get_kb_item("Firefox-ESR/Win/Ver");
if(ffVer && ffVer =~ "^10.0")
{
  if(version_in_range(version:ffVer, test_version:"10.0", test_version2:"10.0.8"))
  {
    security_message(0);
    exit(0);
  }
}
