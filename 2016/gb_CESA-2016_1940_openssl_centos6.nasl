###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for openssl CESA-2016:1940 centos6 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.882569");
  script_version("$Revision: 6658 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:51:48 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-10-05 15:43:10 +0530 (Wed, 05 Oct 2016)");
  script_cve_id("CVE-2016-2177", "CVE-2016-2178", "CVE-2016-2179", "CVE-2016-2180", 
                "CVE-2016-2181", "CVE-2016-2182", "CVE-2016-6302", "CVE-2016-6304", 
                "CVE-2016-6306", "CVE-2016-2183");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for openssl CESA-2016:1940 centos6 ");
  script_tag(name: "summary", value: "Check the version of openssl");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "OpenSSL is a toolkit that implements the 
Secure Sockets Layer (SSL) and Transport Layer Security (TLS) protocols, 
as well as a full-strength general-purpose cryptography library.

Security Fix(es):

* A memory leak flaw was found in the way OpenSSL handled TLS status
request extension data during session renegotiation. A remote attacker
could cause a TLS server using OpenSSL to consume an excessive amount of
memory and, possibly, exit unexpectedly after exhausting all available
memory, if it enabled OCSP stapling support. (CVE-2016-6304)

* It was discovered that OpenSSL did not always use constant time
operations when computing Digital Signature Algorithm (DSA) signatures. A
local attacker could possibly use this flaw to obtain a private DSA key
belonging to another user or service running on the same system.
(CVE-2016-2178)

* It was discovered that the Datagram TLS (DTLS) implementation could fail
to release memory in certain cases. A malicious DTLS client could cause a
DTLS server using OpenSSL to consume an excessive amount of memory and,
possibly, exit unexpectedly after exhausting all available memory.
(CVE-2016-2179)

* A flaw was found in the Datagram TLS (DTLS) replay protection
implementation in OpenSSL. A remote attacker could possibly use this flaw
to make a DTLS server using OpenSSL to reject further packets sent from a
DTLS client over an established DTLS connection. (CVE-2016-2181)

* An out of bounds write flaw was discovered in the OpenSSL BN_bn2dec()
function. An attacker able to make an application using OpenSSL to process
a large BIGNUM could cause the application to crash or, possibly, execute
arbitrary code. (CVE-2016-2182)

* A flaw was found in the DES/3DES cipher was used as part of the TLS/SSL
protocol. A man-in-the-middle attacker could use this flaw to recover some
plaintext data by capturing large amounts of encrypted traffic between
TLS/SSL server and client if the communication used a DES/3DES based
ciphersuite. (CVE-2016-2183)

This update mitigates the CVE-2016-2183 issue by lowering priority of DES
cipher suites so they are not preferred over cipher suites using AES. For
compatibility reasons, DES cipher suites remain enabled by default and
included in the set of cipher suites identified by the HIGH cipher string.
Future updates may move them to MEDIUM or not enable them by default.

* An integer underflow flaw leading to a buffer over-read was found in the
way OpenSSL parsed TLS session tickets. A remote attacker could use this
flaw to crash a TLS server using OpenSSL if it used SHA-512 as HMAC for
session tickets. (CVE-2016-6302)

* Multiple integer overflow f ... 

  Description truncated, for more information please check the Reference URL");
  script_tag(name: "affected", value: "openssl on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2016:1940");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2016-September/022098.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"openssl", rpm:"openssl~1.0.1e~48.el6_8.3", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssl-devel", rpm:"openssl-devel~1.0.1e~48.el6_8.3", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssl-perl", rpm:"openssl-perl~1.0.1e~48.el6_8.3", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssl-static", rpm:"openssl-static~1.0.1e~48.el6_8.3", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
