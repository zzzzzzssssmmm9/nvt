###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ipswitch_whatsup_mult_vuln.nasl 11640 2018-09-27 07:15:20Z asteins $
#
# Ipswitch WhatsUp Multiple Vulnerabilities
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

CPE = 'cpe:/a:ipswitch:whatsup_gold';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106163");
  script_version("$Revision: 11640 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-27 09:15:20 +0200 (Thu, 27 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-08-02 08:27:33 +0700 (Tue, 02 Aug 2016)");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");

  script_tag(name:"qod_type", value:"remote_banner");

  script_cve_id("CVE-2015-6004", "CVE-2015-6005");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Ipswitch WhatsUp Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_ipswitch_whatsup_detect.nasl");
  script_mandatory_keys("ipswitch_whatsup/installed");

  script_tag(name:"summary", value:"Ipswitch WhatsUp Gold is prone to multiple vulnerabilities.");


  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"insight", value:"Ipswitch WhatsUp Gold is prone to multiple vulnerabilities:

Multiple SQL injection vulnerabilities allow remote attackers to execute arbitrary SQL commands via the
UniqueID (aka sUniqueID) parameter to WrFreeFormText.asp in the Reports component or the Find Device parameter.
(CVE-2015-6004).

Multiple cross-site scripting (XSS) vulnerabilities in allow remote attackers to inject arbitrary web script
or HTML via an SNMP OID object, an SNMP trap message, the View Names field, the Group Names field, the Flow
Monitor Credentials field, the Flow Monitor Threshold Name field, the Task Library Name field, the Task Library
Description field, the Policy Library Name field, the Policy Library Description field, the Template Library
Name field, the Template Library Description field, the System Script Library Name field, the System Script
Library Description field, or the CLI Settings Library Description field. (CVE-2015-6005)");

  script_tag(name:"impact", value:"An authenticated attacker may execute arbitrary SQL commands or inject
arbitrary web script or HTML.");

  script_tag(name:"affected", value:"IPSwitch WhatsUp Gold before 16.4");

  script_tag(name:"solution", value:"Upgrade to Version 16.4 or later");

  script_xref(name:"URL", value:"https://www.kb.cert.org/vuls/id/176160");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "16.4")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "16.4");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
