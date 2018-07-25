#
#VID be77eff6-ca91-11e0-aea3-00215c6a37bb
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from VID be77eff6-ca91-11e0-aea3-00215c6a37bb
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisories, and are Copyright (c) the respective author(s)
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

include("revisions-lib.inc");
tag_insight = "The following package is affected: rubygem-rails";
tag_solution = "Update your system with the appropriate patches or
software upgrades.

http://groups.google.com/group/rubyonrails-security/browse_thread/thread/6a1e473744bc389b
http://groups.google.com/group/rubyonrails-security/browse_thread/thread/3420ac71aed312d6
http://groups.google.com/group/rubyonrails-security/browse_thread/thread/6ffc93bde0298768
http://groups.google.com/group/rubyonrails-security/browse_thread/thread/2b9130749b74ea12
http://groups.google.com/group/rubyonrails-security/browse_thread/thread/56bffb5923ab1195
http://www.vuxml.org/freebsd/be77eff6-ca91-11e0-aea3-00215c6a37bb.html";
tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory.";



if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.70258");
 script_version("$Revision: 9351 $");
 script_cve_id("CVE-2011-2930", "CVE-2011-2931", "CVE-2011-3186");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2011-09-21 05:47:11 +0200 (Wed, 21 Sep 2011)");
 script_bugtraq_id(49179);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_name("FreeBSD Ports: rubygem-rails");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
 script_family("FreeBSD Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/freebsdrel", "login/SSH/success");
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-bsd.inc");

txt = "";
vuln = 0;
bver = portver(pkg:"rubygem-rails");
if(!isnull(bver) && revcomp(a:bver, b:"3.0.10")<0) {
    txt += 'Package rubygem-rails version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}

if(vuln) {
    security_message(data:string(txt));
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
