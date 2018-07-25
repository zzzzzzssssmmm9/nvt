###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_opera_pdf_js_rest_bypass_vuln_lin.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Opera PDF Javascript Security Bypass Vulnerability (Linux)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

tag_impact = "Successful exploitation will let attacker to execute arbitrary code result in
  spoof URLs, bypass the security restriction, XSS, Memory corruption, phishing
  attacks and steal generic information from website.

  Impact level: Application/Network";

tag_affected = "Opera version 9.64 and prior on Linux.";
tag_insight = "An error in Adobe Acrobat JavaScript protocol handler in the context of browser
  when a PDF file is opened in it via execute DOM calls in response to a
  javascript: URI.";
tag_solution = "Upgrade to Opera Version 10 or later,
  For updates refer to http://www.opera.com/download/";
tag_summary = "The host is installed with Opera Web Browser and is prone to PDF
  Javascript Security Bypass Vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900636");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-05-19 08:03:45 +0200 (Tue, 19 May 2009)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-1599");
  script_name("Opera PDF Javascript Security Bypass Vulnerability (Linux)");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/archive/1/503183/100/0/threaded");
  script_xref(name : "URL" , value : "http://secniche.org/papers/SNS_09_03_PDF_Silent_Form_Re_Purp_Attack.pdf");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Web application abuses");
  script_dependencies("secpod_opera_detection_linux_900037.nasl");
  script_require_keys("Opera/Linux/Version");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

operaVer = get_kb_item("Opera/Linux/Version");
if(operaVer == NULL){
  exit(0);
}

if(version_is_less_equal(version:operaVer, test_version:"9.64")){
  security_message(0);
}
