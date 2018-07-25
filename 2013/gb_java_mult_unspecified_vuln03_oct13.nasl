###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_java_mult_unspecified_vuln03_oct13.nasl 10144 2018-06-08 14:06:26Z asteins $
#
# Oracle Java SE JRE Multiple Unspecified Vulnerabilities-03 Oct 2013 (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:oracle:jre";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804119");
  script_version("$Revision: 10144 $");
  script_cve_id("CVE-2013-5838");
  script_bugtraq_id(63131);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-06-08 16:06:26 +0200 (Fri, 08 Jun 2018) $");
  script_tag(name:"creation_date", value:"2013-10-25 17:35:17 +0530 (Fri, 25 Oct 2013)");
  script_name("Oracle Java SE JRE Multiple Unspecified Vulnerabilities-03 Oct 2013 (Windows)");


  script_tag(name : "summary" , value : "This host is installed with Oracle Java SE JRE and is prone to multiple
vulnerabilities.");
  script_tag(name : "vuldetect" , value : "Get the installed version of Oracle Java SE JRE with the help of detect NVT
and check it is vulnerable or not.");
  script_tag(name : "solution" , value : "Apply the patch from below link,
http://www.oracle.com/technetwork/topics/security/cpuoct2013-1899837.html");
  script_tag(name : "insight" , value : "Unspecified vulnerability exists due to unknown vectors related to Libraries.");
  script_tag(name : "affected" , value : "Oracle Java SE 7 update 25 and earlier on Windows");
  script_tag(name : "impact" , value : "Successful exploitation will allow remote attackers to affect confidentiality,
integrity, and availability via unknown vectors.

Impact Level: System/Application.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/55315");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/63131");
  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/cpuoct2013-1899837.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_portable_win.nasl");
  script_mandatory_keys("Sun/Java/JRE/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!jreVer = get_app_version(cpe:CPE))
{
  CPE = "cpe:/a:sun:jre";
  if(!jreVer = get_app_version (cpe:CPE)){
    exit(0);
  }
}


if(jreVer =~ "^(1\.7)")
{
  if(version_in_range(version:jreVer, test_version:"1.7.0.0", test_version2:"1.7.0.25"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}