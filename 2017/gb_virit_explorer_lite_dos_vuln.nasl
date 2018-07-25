###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_virit_explorer_lite_dos_vuln.nasl 10055 2018-06-04 04:44:00Z ckuersteiner $
#
# TG Soft Vir.IT eXplorer Lite Denial Of Service Vulnerability
#
# Authors:
# Tameem Eissa <tameem.eissa@greenbone.net>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH
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

CPE = "cpe:/a:tg_soft:vir.it_explorer_lite";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.107266");
  script_version("$Revision: 10055 $");
  script_cve_id("CVE-2017-16948");
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-06-04 06:44:00 +0200 (Mon, 04 Jun 2018) $");
  script_tag(name: "creation_date", value: "2017-11-27 09:50:38 +0700 (Mon, 27 Nov 2017)");
  script_name("TG Soft Vir.IT eXplorer Lite Denial Of Service Vulnerability");

  script_tag(name: "summary" , value:"The host is installed with TG Soft Vir.IT eXplorer Lite and is prone to
Denial Of Service vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of the detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw is due to a NULL value in a 0x82730008 DeviceIoControl request to
\\\\.\\Viragtlt.");

  script_tag(name: "impact" , value:"Successful exploitation would allow local users to cause a denial of service
(NULL pointer dereference) or possibly have unspecified other impact.");

  script_tag(name: "affected" , value:"TG Soft Vir.IT eXplorer Lite 8.5.42");

  script_tag(name: "solution" , value:"No known solution is available as of 04th June, 2018. Information regarding
this issue will be updated once solution details are available.");

  script_tag(name:"solution_type", value:"NoneAvailable");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name: "URL", value: "https://vuldb.com/en/?id.109971");
  script_xref(name: "URL", value: "https://github.com/k0keoyo/Vir.IT-explorer-Anti-Virus-Null-Pointer-Reference-PoC/tree/master/VirIT_NullPointerReference1");

  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_dependencies("gb_virit_explorer_lite_detect.nasl");
  script_mandatory_keys("Virit/explorer/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!Ver = get_app_version(cpe:CPE))
  exit(0);

if(version_is_equal(version:Ver, test_version:"8.5.42"))
{
  report = report_fixed_ver(installed_version:Ver, fixed_version:"None");
  security_message(data:report);
  exit(0);
}

exit(0);
