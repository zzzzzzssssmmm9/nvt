###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_hpe_sap_business_suite_remote_code_exec_vuln.nasl 7174 2017-09-18 11:48:08Z asteins $
#
# HPE Sizing Tool for SAP Business Suite Remote Arbitrary Code Execution Vulnerability
# 
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:hp:sizing_tool_for_sap_business_suite_powered_by_hana";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809436");
  script_version("$Revision: 7174 $");
  script_cve_id("CVE-2016-4377");
  script_bugtraq_id(92479);
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-09-18 13:48:08 +0200 (Mon, 18 Sep 2017) $");
  script_tag(name:"creation_date", value:"2016-10-17 16:24:43 +0530 (Mon, 17 Oct 2016)");
  script_name("HPE Sizing Tool for SAP Business Suite Remote Arbitrary Code Execution Vulnerability");

  script_tag(name:"summary", value:"This host is installed with HPE Sizing Tool
  for SAP Business Suite and is prone to remote arbitrary code execution
  vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to an unspecified
  error.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  arbitrary code execution.

  Impact Level: System/Application.");

  script_tag(name:"affected", value:"HPE Sizing Tool for SAP Business Suite prior
  to version 16.11.1");

  script_tag(name:"solution", value:"Upgrade to HPE Sizing Tool for SAP Business
  Suite version 16.11.1 or later. For updates refer to https://www.hpe.com");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"http://h20564.www2.hpe.com/hpsc/doc/public/display?docId=emr_na-c05237578");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_hpe_sap_business_suite_detect.nasl");
  script_mandatory_keys("HPE/Sizing/Tool/SAP/Sizing/Suite/Win/Ver");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
hpVer= "";

## Get version
if(!hpVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Check For Version less than 16.11.1
if(version_is_less(version:hpVer, test_version:"16.11.1"))
{
  report = report_fixed_ver(installed_version:hpVer, fixed_version:"16.11.1");
  security_message(data:report);
  exit(0);
}
