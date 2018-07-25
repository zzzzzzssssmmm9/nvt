###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mesosphere_marathon_exposure_vuln.nasl 10582 2018-07-23 15:30:28Z tpassfeld $
#
# Mesosphere Marathon Web UI exposure
#
# Authors:
# Thorsten Passfeld <thorsten.passfeld@greenbone.net>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.114012");
  script_version("$Revision: 10582 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-23 17:30:28 +0200 (Mon, 23 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-07-20 11:40:39 +0200 (Fri, 20 Jul 2018)");
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:P/A:P");
  script_name("Mesosphere Marathon Web UI exposure");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_mesosphere_marathon_detect.nasl");
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"https://info.lacework.com/hubfs/Containers%20At-Risk_%20A%20Review%20of%2021,000%20Cloud%20Environments.pdf");

  script_tag(name:"summary", value:"The script checks if the Mesosphere Marathon Web UI is exposed to the public 
  at the remote web server.");

  script_tag(name:"insight", value:"The installation or configuration of Mesosphere Marathon might be incomplete and therefore 
  it is unprotected and exposed to the public.");

  script_tag(name:"vuldetect", value:"Check if the Mesosphere Marathon UI is accessible.");

  script_tag(name:"impact", value:"Access to the dashboard gives you top level
		  access to all aspects of administration for the cluster it is assigned to manage.
		  That includes managing applications, containers, starting workloads, adding and
		  modifying applications, and setting key security controls.");

  script_tag(name:"solution", value:"It is highly recommended to consider the following: 
  - Regardless of network policy, use MFA for all access;
  - Apply strict controls to network access, especially for UI and API ports;
  - Use SSL for all servers and use valid certificates with proper expiration and enforcement policies;
  - Investigate VPN (bastion), reverse proxy or direct connect connections to sensitive servers;
  - Look into product and services such as Lacework in order to discover, detect, prevent, and secure your container services.");

  script_tag(name:"solution_type", value:"Mitigation");
  script_tag(name:"qod_type", value:"remote_banner");

  script_timeout(600);

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:8080);

if(get_kb_item("Mesosphere/Marathon/installed")) {
  report = "Mesosphere Marathon UI is exposed to the public under the following URL: " + report_vuln_url(port:port, url: "/", url_only: TRUE);
  security_message(port:port, data:report);
  exit(0);
}

exit(99);
