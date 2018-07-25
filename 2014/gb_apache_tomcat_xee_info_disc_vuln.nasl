###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_tomcat_xee_info_disc_vuln.nasl 4347 2016-10-25 13:52:16Z cfi $
#
# Apache Tomcat XML External Entity Information Disclosure Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:apache:tomcat";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805019");
  script_version("$Revision: 4347 $");
  script_cve_id("CVE-2014-0119");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2016-10-25 15:52:16 +0200 (Tue, 25 Oct 2016) $");
  script_tag(name:"creation_date", value:"2014-11-28 19:52:03 +0530 (Fri, 28 Nov 2014)");
  script_name("Apache Tomcat XML External Entity Information Disclosure Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_dependencies("gb_apache_tomcat_detect.nasl");
  script_mandatory_keys("ApacheTomcat/installed");
  script_require_ports("Services/www", 8080);

  script_xref(name:"URL", value:"http://secunia.com/advisories/59732");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-7.html");

  script_tag(name:"summary", value:"This host is running Apache Tomcat and is
  prone to information disclosure vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to an application does
  not properly constrain the class loader that accesses the XML parser used
  with an XSLT stylesheet");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to read arbitrary files via a crafted web application that provides
  an XML external entity declaration in conjunction with an entity reference. 

  Impact Level: Application");

  script_tag(name:"affected", value:"Apache Tomcat before 6.0.40, 7.x before 7.0.54, and 8.x before 8.0.6");

  script_tag(name:"solution", value:"Upgrade to version 6.0.40, 7.0.54,
  8.0.6 or later. For updates refer to refer http://tomcat.apache.org");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_in_range( version:vers, test_version:"6.0.0", test_version2:"6.0.39" ) ||
    version_in_range( version:vers, test_version:"7.0.0", test_version2:"7.0.53" ) ||
    version_in_range( version:vers, test_version:"8.0.0.RC1", test_version2:"8.0.5" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"6.0.40/7.0.53/8.0.5" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );