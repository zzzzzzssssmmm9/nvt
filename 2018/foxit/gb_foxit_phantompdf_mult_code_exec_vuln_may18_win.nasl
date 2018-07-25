###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_foxit_phantompdf_mult_code_exec_vuln_may18_win.nasl 10171 2018-06-13 06:19:25Z cfischer $
#
# Foxit PhantomPDF Multiple Code Execution Vulnerabilities - May18 (Windows)
#
# Authors:
# Rajat Mishra <rajatm@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation;
# either version 2 of the License, or (at your option) any later version.
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

CPE = "cpe:/a:foxitsoftware:phantompdf";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812896");
  script_version("$Revision: 10171 $");
  script_cve_id("CVE-2018-5674", "CVE-2018-5677", "CVE-2018-5676", "CVE-2018-5675",
                "CVE-2018-5678", "CVE-2018-5680", "CVE-2018-5679", "CVE-2018-7407",
                "CVE-2018-7406");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-06-13 08:19:25 +0200 (Wed, 13 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-05-25 13:43:57 +0530 (Fri, 25 May 2018)");
  script_name("Foxit PhantomPDF Multiple Code Execution Vulnerabilities - May18 (Windows)");

  script_tag(name: "summary" , value:"The host is installed with Foxit PhantomPDF
  and is prone to multiple code execution vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exists due to,
 
  - Lack of proper validation of user-supplied data.

  - Foxit PhantomPDF unable to sanitize itself from crafted data in the PDF
    file.");

  script_tag(name: "impact" , value:"Successful exploitation will allow an
  attacker to execute arbitrary code.  

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Foxit PhantomPDF versions before 9.1 on
  windows.");

  script_tag(name: "solution" , value:"Upgrade to Foxit PhantomPDF version 9.1
  or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name : "URL" , value:"http://www.foxitsoftware.com");
  script_xref(name : "URL" , value:"https://www.foxitsoftware.com/support/security-bulletins.php#content-2018");
 
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_foxit_phantom_reader_detect.nasl");
  script_mandatory_keys("Foxit/PhantomPDF/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
pdfVer = infos['version'];
pdfPath = infos['location'];

if(version_is_less(version:pdfVer, test_version:"9.1"))
{
  report = report_fixed_ver(installed_version:pdfVer, fixed_version:"9.1", install_path:pdfPath);
  security_message(data:report);
  exit(0);
}
exit(0);
