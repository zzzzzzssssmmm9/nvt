###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_java_se_mult_vuln02_oct12_win.nasl 10144 2018-06-08 14:06:26Z asteins $
#
# Oracle Java SE JRE Multiple Unspecified Vulnerabilities-02 oct12 (Windows)
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802479");
  script_version("$Revision: 10144 $");
  script_cve_id("CVE-2012-5085", "CVE-2012-5084", "CVE-2012-5073", "CVE-2012-5077",
                "CVE-2012-5079", "CVE-2012-5081", "CVE-2012-5083");
  script_bugtraq_id(56067, 56063, 56080, 56058, 56082, 56071,56025);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-06-08 16:06:26 +0200 (Fri, 08 Jun 2018) $");
  script_tag(name:"creation_date", value:"2012-10-19 12:43:54 +0530 (Fri, 19 Oct 2012)");
  script_name("Oracle Java SE JRE Multiple Unspecified Vulnerabilities-02 oct12 (Windows)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/50949/");
  script_xref(name : "URL" , value : "http://www.securelist.com/en/advisories/50949");
  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_portable_win.nasl");
  script_require_keys("Sun/Java/JRE/Win/Ver");
  script_tag(name : "impact" , value : "Successful exploitation allows remote attackers to execute arbitrary code on
  the target system or cause complete denial of service conditions.
  Impact Level: System/Application");
  script_tag(name : "affected" , value : "Oracle Java SE 7 Update 7 and earlier, 6 Update 35 and earlier,
  5.0 Update 36 and earlier and 1.4.2_38 and earlier");
  script_tag(name : "insight" , value : "Multiple unspecified vulnerabilities exists in the application related
  to 2D, Networking, Swing, Libraries, Security and JSSE.");
  script_tag(name : "solution" , value : "Apply the patch from below link
  http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html");
  script_tag(name : "summary" , value : "This host is installed with Oracle Java SE and is prone to multiple
  unspecified vulnerabilities.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}

include("version_func.inc");

jreVer = get_kb_item("Sun/Java/JRE/Win/Ver");
if(jreVer)
{
  if(version_is_less_equal(version:jreVer, test_version:"1.4.2.38") ||
     version_in_range(version:jreVer, test_version:"1.7", test_version2:"1.7.0.7") ||
     version_in_range(version:jreVer, test_version:"1.6", test_version2:"1.6.0.35") ||
     version_in_range(version:jreVer, test_version:"1.5", test_version2:"1.5.0.36")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}
