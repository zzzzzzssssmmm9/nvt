###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ibm_db2_db2pd_dos_vuln_win.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# IBM DB2 db2pd Denial Of Service Vulnerability (Windows)
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

tag_impact = "Successful exploitation will allow attacker to cause a denial of service
  (null pointer dereference and application crash).
  Impact Level: System/Application";
tag_affected = "IBM DB2 version 9.1 prior to FP7
  IBM DB2 version 9.5 prior to FP5";
tag_insight = "The flaw is due to a null pointer dereference error in db2pd within
  the problem determination component via unspecified vectors.";
tag_solution = "Update IBM DB2 9.1 FP7, 9.5 FP5,
  http://www-01.ibm.com/support/docview.wss?rs=0&uid=swg24022678";
tag_summary = "The host is installed with IBM DB2 and is prone to Denial of Service
  vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.901080");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-12-23 08:41:41 +0100 (Wed, 23 Dec 2009)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_cve_id("CVE-2009-4332");
  script_bugtraq_id(37332);
  script_name("IBM DB2 db2pd Denial Of Service Vulnerability (Windows)");


  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Databases");
  script_dependencies("secpod_ibm_db2_detect_win_900218.nasl");
  script_require_keys("Win/IBM-db2/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "ftp://ftp.software.ibm.com/ps/products/db2/fixes/english-us/aparlist/db2_v95/APARLIST.TXT");
  script_xref(name : "URL" , value : "ftp://ftp.software.ibm.com/ps/products/db2/fixes/english-us/aparlist/db2_v91/APARLIST.TXT");
  exit(0);
}


include("version_func.inc");

ibmVer = get_kb_item("Win/IBM-db2/Ver");
if(!ibmVer){
  exit(0);
}

# Check for IBM DB2 Version 9.1 before 9.1 FP7  (IBM DB2 9.1 FP 7 = 9.1.700.855)
# Check for IBM DB2 Version 9.5 before 9.5 FP5 (IBM DB2 9.5 FP 5 = 9.5.500.784)
if(version_in_range(version:ibmVer, test_version:"9.1", test_version2:"9.1.700.854")||
   version_in_range(version:ibmVer, test_version:"9.5", test_version2:"9.5.500.783")){
  security_message(0);
}
