###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_tomcat_login_constraints_sec_bypass_vuln.nasl 11865 2018-10-12 10:03:43Z cfischer $
#
# Apache Tomcat Login Constraints Security Bypass Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:apache:tomcat";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803779");
  script_version("$Revision: 11865 $");
  script_cve_id("CVE-2011-1183");
  script_bugtraq_id(47196);
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:03:43 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-11-27 13:06:15 +0530 (Wed, 27 Nov 2013)");
  script_name("Apache Tomcat Login Constraints Security Bypass Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_apache_tomcat_detect.nasl");
  script_require_ports("Services/www", 8080);
  script_mandatory_keys("ApacheTomcat/installed");

  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/66675");
  script_xref(name:"URL", value:"http://cxsecurity.com/issue/WLB-2011040174");
  script_xref(name:"URL", value:"http://seclists.org/fulldisclosure/2011/Apr/96");
  script_xref(name:"URL", value:"http://archives.neohapsis.com/archives/fulldisclosure/2011-04/0090.html");

  script_tag(name:"summary", value:"This host is running Apache Tomcat and is prone to security bypass
  vulnerability.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"solution", value:"Upgrade Apache Tomcat version to 7.0.12 or later.");
  script_tag(name:"insight", value:"The flaw is due to constraints were ignored when no login configuration
  was present in the web.xml and the web application was marked as meta-data complete.");
  script_tag(name:"affected", value:"Apache Tomcat version 7.0.11");
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to bypass certain
  authentication and obtain sensitive information.");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://tomcat.apache.org");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_equal( version:vers, test_version:"7.0.11" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"7.0.11" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
