###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_tomcat_http_nio_connector_dos_vuln_win.nasl 7549 2017-10-24 12:10:14Z cfischer $
#
# Apache Tomcat HTTP NIO Denial Of Service Vulnerability (Windows)
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.802679");
  script_version("$Revision: 7549 $");
  script_cve_id("CVE-2012-2733");
  script_bugtraq_id(56402);
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 14:10:14 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2012-11-27 18:17:31 +0530 (Tue, 27 Nov 2012)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("Apache Tomcat HTTP NIO Denial Of Service Vulnerability (Windows)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_dependencies("gb_apache_tomcat_detect.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 8080);
  script_mandatory_keys("ApacheTomcat/installed", "Host/runs_windows");

  script_xref(name:"URL", value:"http://secunia.com/advisories/51138");
  script_xref(name:"URL", value:"http://svn.apache.org/viewvc?view=revision&revision=1350301");
  script_xref(name:"URL", value:"http://svn.apache.org/viewvc?view=revision&revision=1356208");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-6.html");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-7.html");

  tag_solution = "Apply patch or upgrade Apache Tomcat to 6.0.36, 7.0.28 or later,
  For updates refer to http://tomcat.apache.org/

  *****
  NOTE: Ignore this warning, if above mentioned patch is manually applied.
  *****";

  tag_impact = "Successful exploitation could allow remote attackers to cause a denial of
  service condition.

  Impact Level: Application";

  tag_affected = "Apache Tomcat version 6.x to 6.0.35 and 7.x to 7.0.27";

  tag_insight = "The flaw is due to error in
  java/org/apache/coyote/http11/InternalNioInputBuffer.java in the HTTP NIO
  connector, which does not properly restrict the request-header size.";

  tag_summary = "This host is running Apache Tomcat Server and is prone to denial
  of service vulnerability.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"solution", value:tag_solution);

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

# check the version for 6.0 < 6.0.36 and 7.0 < 7.0.28
if( version_in_range( version:vers, test_version:"6.0.0", test_version2:"6.0.35" ) ||
    version_in_range( version:vers, test_version:"7.0.0", test_version2:"7.0.27" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"6.0.36/7.0.28" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
