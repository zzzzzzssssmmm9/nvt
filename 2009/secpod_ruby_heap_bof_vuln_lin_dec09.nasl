###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ruby_heap_bof_vuln_lin_dec09.nasl 4861 2016-12-28 12:22:34Z mime $
#
# Ruby Interpreter Heap Overflow Vulnerability (Linux) - Dec09
#
# Authors:
# Sujit Ghosal <sghosal@secpod.com>
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

tag_solution = "Apply the patch
  ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.bz2

  *****
  NOTE: Please ignore this warning if the patch is applied.
  *****";

tag_impact = "Successful exploitation will let the attacker execute arbitrary code, corrupt
  the heap area to execute the crafted malicious shellcode into the system
  registers to take control over the remote machine.";
tag_affected = "Ruby Interpreter version 1.9.1 before 1.9.1 Patchlevel 376";
tag_insight = "The flaw is due to improper sanitization check while processing user
  supplied input data to the buffer inside 'String#ljust', 'String#center' and
  'String#rjust' methods.";
tag_summary = "This host is installed with Ruby Interpreter and is prone to Heap
  Overflow vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900726");
  script_version("$Revision: 4861 $");
  script_tag(name:"last_modification", value:"$Date: 2016-12-28 13:22:34 +0100 (Wed, 28 Dec 2016) $");
  script_tag(name:"creation_date", value:"2009-12-23 08:41:41 +0100 (Wed, 23 Dec 2009)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-4124");
  script_bugtraq_id(37278);
  script_name("Ruby Interpreter Heap Overflow Vulnerability (Linux) - Dec09");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/37660");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2009/3471");
  script_xref(name : "URL" , value : "http://www.ruby-lang.org/en/news/2009/12/07/heap-overflow-in-string");

  script_tag(name:"qod_type", value:"executable_version_unreliable");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Buffer overflow");
  script_dependencies("secpod_ruby_detect_lin.nasl");
  script_require_keys("Ruby/Lin/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "solution" , value : tag_solution);
  exit(0);
}


include("version_func.inc");

rubyVer = get_kb_item("Ruby/Lin/Ver");
if(!rubyVer){
  exit(0);
}

# Grep for Ruby Interpreter version from 1.9.1 to 1.9.1 Patch Level 375
if(version_in_range(version:rubyVer, test_version:"1.9.1",
                                     test_version2:"1.9.1.p375")){
  security_message(0);
}
