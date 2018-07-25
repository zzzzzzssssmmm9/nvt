###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_buildbot_waterfall_xss_vuln.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Buildbot 'waterfall.py' Cross-Site Scripting Vulnerability
#
# Authors:
# Nikita MR <rnikita@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow attacker to inject arbitrary web script
  or HTML via unspecified vectors and conduct cross-site scripting attacks.
  Impact Level: Application";
tag_affected = "Buildbot version 0.7.6 through 0.7.11p1 on all platforms.";
tag_insight = "This flaw arise because user supplied data passed into the waterfall web
  status view in status/web/waterfall.py is not sanitised before being
  returned to the user.";
tag_solution = "Upgrade to version 0.7.11p2 or later.
  http://sourceforge.net/projects/buildbot/";
tag_summary = "This host is installed with Buildbot and is prone to Cross Site
  Scripting vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800934");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-09-11 18:01:06 +0200 (Fri, 11 Sep 2009)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_cve_id("CVE-2009-2959");
  script_bugtraq_id(36100);
  script_name("Buildbot 'waterfall.py' Cross-Site Scripting Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/36352/");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2009/2352");
  script_xref(name : "URL" , value : "http://sourceforge.net/mailarchive/message.php?msg_name=42338fbf0908121232mb790a6cn787ac3de90e8bc31%40mail.gmail.com");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_buildbot_detect.nasl");
  script_require_keys("Buildbot/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("version_func.inc");

buildbotVer = get_kb_item("Buildbot/Ver");

if(buildbotVer != NULL)
{
  if(version_in_range(version:buildbotVer, test_version:"0.7.6",
                                          test_version2:"0.7.11.p1")){
    security_message(0);
  }
}
