# OpenVAS Vulnerability Test
# $Id: kerio_webmail_multiple_flaws.nasl 10033 2018-05-31 07:51:19Z ckuersteiner $
# Description: Kerio WebMail v5 multiple flaws
#
# Authors:
# Tenable Network Security
# Modified by David Maciejak <david dot maciejak at kyxar dot fr>
#
# Copyright:
# Copyright (C) 2003-2007 Tenable Network Security & Copyright (C) 2004 David Maciejak
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

# Ref 1:
#  Date: Wed, 18 Jun 2003 21:58:51 +0200 (CEST)
#  Subject: Multiple buffer overflows and XSS in Kerio MailServer
#  From: "David F.Madrid" <conde0@telefonica.net>
#  To: <bugtraq@securityfocus.com>
# Ref 2:
#  Abraham Lincoln" <sunninja@scientist.com>

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.80069");
 script_version("$Revision: 10033 $");
 script_tag(name:"last_modification", value:"$Date: 2018-05-31 09:51:19 +0200 (Thu, 31 May 2018) $");
 script_tag(name:"creation_date", value:"2008-10-24 23:33:44 +0200 (Fri, 24 Oct 2008)");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

 script_cve_id("CVE-2002-1434", "CVE-2003-0487", "CVE-2003-0488");
 script_bugtraq_id(5507, 7966, 7967, 7968, 8230, 9975);
 script_xref(name:"OSVDB", value:"2159");
 script_xref(name:"OSVDB", value:"4953");
 script_xref(name:"OSVDB", value:"4954");
 script_xref(name:"OSVDB", value:"4955");
 script_xref(name:"OSVDB", value:"4956");
 script_xref(name:"OSVDB", value:"4958");

 script_name("Kerio WebMail v5 multiple flaws");

 script_category(ACT_GATHER_INFO);
 script_tag(name:"qod_type", value:"remote_banner");

 script_copyright("This script is Copyright (C) 2003-2007 Tenable Network Security & Copyright (C) 2004 David Maciejak");
 script_family("Gain a shell remotely");
 script_dependencies("find_service1.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);

 script_tag(name: "solution", value: "Upgrade to Kerio MailServer 5.7.7 or newer");

 script_tag(name: "summary", value: "The remote host is running version 5 of the Kerio MailServer.

There are multiple flaws in this interface which may allow an attacker with a valid webmail account on this host
to obtain a shell on this host or to perform a cross-site-scripting attack against this host with version prior to
5.6.4.

Version of MailServer prior to 5.6.5 are also prone to a denial of service condition when an incorrect login to
the admin console occurs. This could cause the server to crash.

Version of MailServer prior to 5.7.7 is prone to a remotely exploitable buffer overrun condition. This
vulnerability exists in the spam filter component. If successfully exploited, this could permit remote attackers
to execute arbitrary code in the context of the MailServer software. This could also cause a denial of service in
the server.");

 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);
if(!get_port_state(port)) exit(0);

res = http_get_cache(item:"/", port:port);
if (egrep(string:res, pattern:"^Server: Kerio MailServer ([0-4]\.|5\.[0-6]\.|5\.7\.[0-6])") )
{
  security_message(port);
  set_kb_item(name: 'www/'+port+'/XSS', value: TRUE);
}
