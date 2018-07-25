###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_cyrus_sasllib_mul_bof_vuln.nasl 5055 2017-01-20 14:08:39Z teissa $
#
# Cyrus SASL Remote Buffer Overflow Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploits allow attackers to run arbitrary code and to crash an
  application that uses the library thus denying service to legitimate users.
  Impact Level: Application";
tag_affected = "Cyrus SASL version prior to 2.1.23";
tag_insight = "An error in 'sasl_encode64' function within the lib/saslutil.c, as it fails
  to perform adequate boundary checks on user supplied data before copying the
  data to allocated memory buffers.";
tag_solution = "Upgrade to version 2.1.23 or later.
  ftp://ftp.andrew.cmu.edu/pub/cyrus-mail/cyrus-sasl-2.1.23.tar.gz";
tag_summary = "This host has installed Cyrus SASL library and is prone to Remote
  Buffer Overflow vulnerability";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900660");
  script_version("$Revision: 5055 $");
  script_tag(name:"last_modification", value:"$Date: 2017-01-20 15:08:39 +0100 (Fri, 20 Jan 2017) $");
  script_tag(name:"creation_date", value:"2009-05-28 07:14:08 +0200 (Thu, 28 May 2009)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2009-0688");
  script_bugtraq_id(34961);
  script_name("Cyrus SASL Remote Buffer Overflow Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/35102");
  script_xref(name : "URL" , value : "http://www.kb.cert.org/vuls/id/238019");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2009/1313");

  script_tag(name:"qod_type", value:"executable_version_unreliable");
  script_tag(name: "solution_type", value: "VendorFix");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Buffer overflow");
  script_dependencies("secpod_cyrus_sasllib_detect.nasl");
  script_require_keys("Cyrus/SASL/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);

  exit(0);
}


include("version_func.inc");

saslVer = get_kb_item("Cyrus/SASL/Ver");
if(saslVer != NULL)
{
  if(version_is_less(version:saslVer, test_version:"2.1.23")){
  security_message(0);
  }
}
