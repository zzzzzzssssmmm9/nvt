###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_pcp_multiple_dir_trav_vuln_may17.nasl 6302 2017-06-10 17:10:53Z cfischer $
#
# Cisco Prime Collaboration Provisioning Multiple Directory Traversal Vulnerabilities - May17
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

CPE = "cpe:/a:cisco:prime_collaboration_provisioning";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811056");
  script_version("$Revision: 6302 $");
  script_cve_id("CVE-2017-6637", "CVE-2017-6636");
  script_bugtraq_id(98530, 98526);
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-06-10 19:10:53 +0200 (Sat, 10 Jun 2017) $");
  script_tag(name:"creation_date", value:"2017-05-29 13:39:30 +0530 (Mon, 29 May 2017)");
  script_name("Cisco Prime Collaboration Provisioning Multiple Directory Traversal Vulnerabilities - May17");

  script_tag(name:"summary", value:"This host is running cisco prime collaboration
  provisioning and is prone to multiple directory traversal vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws exist as the affected software
  does not perform proper input validation of HTTP requests and fails to apply
  role-based access controls (RBACs) to requested HTTP URLs.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  authenticated, remote attacker to view or delete any file on an affected
  system.

  Impact Level: System/Application");

  script_tag(name:"qod_type", value:"package");

  script_tag(name:"affected", value:"Cisco Prime Collaboration Provisioning
  Software Releases 9.0.0, 9.5.0, 10.0.0, 10.5.0, 10.5.1 and 10.6 through 11.0");

  script_tag(name:"solution", value:"Upgrade to Cisco Prime Collaboration
  Provisioning Software Release 11.1 or later. For details refer to
  reference links");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://bst.cloudapps.cisco.com/bugsearch/bug/CSCvc99618");
  script_xref(name:"URL", value:"https://bst.cloudapps.cisco.com/bugsearch/bug/CSCvc99604");
  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170517-pcp5");
  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170517-pcp4");

  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_pcp_version.nasl");
  script_mandatory_keys("cisco_pcp/version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!version = get_app_version(cpe:CPE)) exit(0);

if(version =~ "^((9|10|11)\.)")
{
  ## Checking for vulnerable version
  if((version == "9.0.0")|| (version == "9.5.0")|| (version == "10.0.0")||
     (version == "10.5.0")||(version == "10.5.1")||(version == "10.6.0")||
     (version == "10.6.2")||(version == "11.0.0"))
  {
    report = report_fixed_ver(installed_version:version, fixed_version:"11.1");
    security_message(data:report);
    exit(0);
  }
}
exit(0);
