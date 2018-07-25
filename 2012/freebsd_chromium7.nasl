#
#VID 2f5ff968-5829-11e1-8288-00262d5ed8ee
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from VID 2f5ff968-5829-11e1-8288-00262d5ed8ee
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com
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
tag_insight = "The following package is affected: chromium

CVE-2011-3015
Multiple integer overflows in the PDF codecs in Google Chrome before
17.0.963.56 allow remote attackers to cause a denial of service or
possibly have unspecified other impact via unknown vectors.

CVE-2011-3016
Use-after-free vulnerability in Google Chrome before 17.0.963.56
allows remote attackers to cause a denial of service or possibly have
unspecified other impact via vectors involving counter nodes, related
to a 'read-after-free' issue.

CVE-2011-3017
Use-after-free vulnerability in Google Chrome before 17.0.963.56
allows remote attackers to cause a denial of service or possibly have
unspecified other impact via vectors related to database handling.

CVE-2011-3018
Heap-based buffer overflow in Google Chrome before 17.0.963.56 allows
remote attackers to cause a denial of service or possibly have
unspecified other impact via vectors related to path rendering.

CVE-2011-3019
Heap-based buffer overflow in Google Chrome before 17.0.963.56 allows
remote attackers to cause a denial of service or possibly have
unspecified other impact via a crafted Matroska video (aka MKV) file.

CVE-2011-3020
Unspecified vulnerability in the Native Client validator
implementation in Google Chrome before 17.0.963.56 has unknown impact
and remote attack vectors.

CVE-2011-3021
Use-after-free vulnerability in Google Chrome before 17.0.963.56
allows remote attackers to cause a denial of service or possibly have
unspecified other impact via vectors related to subframe loading.

CVE-2011-3022
translate/translate_manager.cc in Google Chrome before 17.0.963.56 and
19.x before 19.0.1036.7 uses an HTTP session to exchange data for
translation, which allows remote attackers to obtain sensitive
information by sniffing the network.

CVE-2011-3023
Use-after-free vulnerability in Google Chrome before 17.0.963.56
allows user-assisted remote attackers to cause a denial of service or
possibly have unspecified other impact via vectors related to
drag-and-drop operations.

CVE-2011-3024
Google Chrome before 17.0.963.56 allows remote attackers to cause a
denial of service (application crash) via an empty X.509 certificate.

CVE-2011-3025
Google Chrome before 17.0.963.56 does not properly parse H.264 data,
which allows remote attackers to cause a denial of service
(out-of-bounds read) via unspecified vectors.

CVE-2011-3026
Integer overflow in libpng, as used in Google Chrome before
17.0.963.56, allows remote attackers to cause a denial of service or
possibly have unspecified other impact via unknown vectors that
trigger an integer truncation.

CVE-2011-3027
Google Chrome before 17.0.963.56 does not properly perform a cast of
an unspecified variable during handling of columns, which allows
remote attackers to cause a denial of service or possibly have
unknown other impact via a crafted document.";
tag_solution = "Update your system with the appropriate patches or
software upgrades.

http://googlechromereleases.blogspot.com/search/label/Stable%20updates
http://www.vuxml.org/freebsd/2f5ff968-5829-11e1-8288-00262d5ed8ee.html";
tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory.";



if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.71171");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_cve_id("CVE-2011-3015", "CVE-2011-3016", "CVE-2011-3017", "CVE-2011-3018", "CVE-2011-3019", "CVE-2011-3020", "CVE-2011-3021", "CVE-2011-3022", "CVE-2011-3023", "CVE-2011-3024", "CVE-2011-3025", "CVE-2011-3026", "CVE-2011-3027");
 script_version("$Revision: 9352 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2012-03-12 11:35:07 -0400 (Mon, 12 Mar 2012)");
 script_name("FreeBSD Ports: chromium");


 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
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
vuln = 0;
txt = "";
bver = portver(pkg:"chromium");
if(!isnull(bver) && revcomp(a:bver, b:"17.0.963.56")<0) {
    txt += "Package chromium version " + bver + " is installed which is known to be vulnerable.\n";
    vuln = 1;
}

if(vuln) {
    security_message(data:string(txt ));
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
