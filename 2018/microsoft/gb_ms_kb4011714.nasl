###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4011714.nasl 9430 2018-04-11 01:54:49Z ckuersteiner $
#
# Microsoft Excel 2007 Service Pack 3 Security Feature Bypass Vulnerability (KB4011714)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.812977");
  script_version("$Revision: 9430 $");
  script_cve_id("CVE-2018-0907");
  script_bugtraq_id(103325);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-04-11 03:54:49 +0200 (Wed, 11 Apr 2018) $");
  script_tag(name:"creation_date", value:"2018-03-14 08:54:01 +0530 (Wed, 14 Mar 2018)");
  script_name("Microsoft Excel 2007 Service Pack 3 Security Feature Bypass Vulnerability (KB4011714)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4011714");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw exists due to an error in Microsoft
  Office software which do not enforce macro settings on an Excel document. ");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attacker to bypass security feature and conduct further attacks.

  Impact Level: Application");

  script_tag(name:"affected", value:"Microsoft Excel 2007 Service Pack 3");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/4011714");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/4011714");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/Excel/Version");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");


excelVer = "";

excelVer = get_kb_item("SMB/Office/Excel/Version");
if(!excelVer){
  exit(0);
}

excelPath = get_kb_item("SMB/Office/Excel/Install/Path");
if(!excelPath){
  excelPath = "Unable to fetch the install path";
}

if(excelVer =~ "^(12\.)" && version_is_less(version:excelVer, test_version:"12.0.6786.5000"))
{
  report = report_fixed_ver(file_checked:excelPath + "Excel.exe",
                            file_version:excelVer, vulnerable_range:"12.0 - 12.0.6786.4999");
  security_message(data:report);
  exit(0);
}
exit(0);
