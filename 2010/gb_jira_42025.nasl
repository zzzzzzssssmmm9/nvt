###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_jira_42025.nasl 5306 2017-02-16 09:00:16Z teissa $
#
# Jira Cross Site Scripting and Information Disclosure Vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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

CPE = 'cpe:/a:atlassian:jira';

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100740");
 script_version("$Revision: 5306 $");
 script_tag(name: "last_modification", value: "$Date: 2017-02-16 10:00:16 +0100 (Thu, 16 Feb 2017) $");
 script_tag(name: "creation_date", value: "2010-08-03 13:36:27 +0200 (Tue, 03 Aug 2010)");
 script_tag(name: "cvss_base", value: "5.0");
 script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:P/I:N/A:N");

 script_bugtraq_id(42025);
 
 script_tag(name:"qod_type", value:"remote_banner");

 script_tag(name: "solution_type", value: "VendorFix");

 script_name("Jira Cross Site Scripting and Information Disclosure Vulnerabilities");

 script_category(ACT_GATHER_INFO);

 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_family("Web application abuses");
 script_dependencies("secpod_atlassian_jira_detect.nasl");
 script_mandatory_keys("atlassian_jira/installed");

 script_tag(name: "summary", value: "Atlassian JIRA is prone to multiple cross-site scripting vulnerabilities
and an information disclosure vulnerability.");

 script_tag(name: "vuldetect", value: "Checks the version.");

 script_tag(name: "insight", value: "The application fails to sufficiently sanitize user-supplied input.");

 script_tag(name: "impact", value: "Attackers can exploit these issues to obtain sensitive information,
steal cookie-based authentication information, and execute arbitrary client-side scripts in the context of
the browser.");

 script_tag(name: "affected", value: "Jira 4.01 is vulnerable; other versions may also be affected.");

 script_tag(name: "solution", value: "Update to the latest JIRA version.");

 script_xref(name: "URL" , value: "http://www.securityfocus.com/bid/42025");


 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if("#" >< version) {
  jver = split(version, sep: "#", keep: FALSE);
  if(!isnull(jver[0])) {
    version = jver[0];
  }
} 

if (version_is_equal(version: version, test_version: "4.0.1")) {
   security_message(port: port);
   exit(0);
}

exit(0);
