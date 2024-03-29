###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_websphere_mq_websockets_listener_xss_vuln.nasl 11424 2018-09-17 08:03:52Z mmartin $
#
# IBM WebSphere MQ XR WebSockets listener Cross-Site Scripting Vulnerability
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:ibm:websphere_mq";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805547");
  script_version("$Revision: 11424 $");
  script_cve_id("CVE-2015-0176");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-09-17 10:03:52 +0200 (Mon, 17 Sep 2018) $");
  script_tag(name:"creation_date", value:"2015-05-06 12:12:34 +0530 (Wed, 06 May 2015)");
  script_name("IBM WebSphere MQ XR WebSockets listener Cross-Site Scripting Vulnerability");

  script_tag(name:"summary", value:"This host is installed with IBM WebSphere MQ
  and is prone to cross-site scripting vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to improper validation
  of user-supplied input.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attacker to execute arbitrary script code in a user's browser session within
  the trust relationship between their browser and the server.");

  script_tag(name:"affected", value:"IBM WebSphere MQ version 8.x before 8.0.0.2");

  script_tag(name:"solution", value:"Upgrade to IBM WebSphere MQ version 8.0.0.2
  or later. For updates refer http://www-03.ibm.com/software/products/en/ibm-mq");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21699549");

  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_ibm_websphere_mq_detect.nasl");
  script_mandatory_keys("IBM/Websphere/MQ/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!mqVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_in_range(version:mqVer, test_version:"8.0", test_version2:"8.0.0.1"))
{
  report = 'Installed version: ' + mqVer + '\n' +
           'Fixed version:     ' + '8.0.0.2' + '\n';
  security_message(data:report);
  exit(0);
}
