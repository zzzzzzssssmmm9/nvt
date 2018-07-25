# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2015-2199.nasl 6560 2017-07-06 11:58:38Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@solinor.com> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.com
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
#
if(description)
 {
script_oid("1.3.6.1.4.1.25623.1.0.122787");
script_version("$Revision: 6560 $");
script_tag(name:"creation_date", value:"2015-11-25 13:18:53 +0200 (Wed, 25 Nov 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:58:38 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2015-2199");
script_tag(name: "insight", value: "ELSA-2015-2199 -  glibc security, bug fix, and enhancement update - [2.17-105.0.1]- Remove strstr and strcasestr implementations using sse4.2 instructions.- Upstream commits 584b18eb4df61ccd447db2dfe8c8a7901f8c8598 and 1818483b15d22016b0eae41d37ee91cc87b37510 backported.[2.17-105]- Fix up test case for initial-exec fix (#1248208).[2.17-104]- Mark all TLS variables in libc.so as initial-exec (#1248208).[2.17-103]- Apply correct fix for #1195672.[2.17-102]- Remove workaround for kernel netlink bug (#1089836).- Use only 32-bit instructions in optimized 32-bit POWER functions (#1240796).[2.17-101]- Correct the AArch64 ABI baseline for libpthread (#1234622).[2.17-100]- Prevent tst-rec-dlopen from intermittently failing in parallel builds due to a missing makefile dependency (#1225959).[2.17-99]- Increase AArch64 TLS descriptor performance (#1202952).[2.17-98]- Move arch-specific header files from glibc-headers to glibc-devel (#1230328).[2.17-97]- Rebase high-precision timing support for microbenchmark (#1214326).[2.17-96]- Rebase microbenchmarks from upstream for performance testing (#1214326)- Fix running microbenchmark script bench.pl from source (#1084395)[2.17-95]- Enable systemtap support for all architectures (#1225490).[2.17-94]- Fix ruserok API scalability issues (#1216246).[2.17-93]- Backport fixes and enhancements for ppc64 and ppc64le (#1162895). - Correct DT_PPC64_NUM in elf/elf.h. - Correct IBM long double frexpl. - Correct IBM long double nextafterl.[2.17-92]- Backport fixes for various security flaws (#1209107): - Prevent heap buffer overflow in swscanf (CVE-2015-1472, CVE-2015-1473, - Prevent integer overflow in _IO_wstr_overflow (#1195762). - Prevent potential denial of service in internal_fnmatch (#1197730). - Prevent buffer overflow in gethostbyname_r and related functions with misaligned buffer (CVE-2015-1781, #1199525).[2.17-91]- Allow more shared libraries with static TLS to be loaded (#1227699).[2.17-90]- Work around kernel netlink bug on some specialized hardware setup (#1089836).- Fix invalid file descriptor reuse when sending DNS query (CVE-2013-7423, #1194143).- Sync netinet/tcp.h with the kernel (#1219891).[2.17-89]- Avoid deadlock in malloc on backtrace (#1207032).- Actually test iconv modules (#1176906).- Use calloc to allocate xports (#1159169).- Return EAI_AGAIN for AF_UNSPEC when herrno is TRY_AGAIN (#1098042).[2.17-88]- Add librtkaio.abilist generated by make update-abi (#1173238).[2.18-87]- Enhance nscd inotify support (#1193797).[2.17-86]- Use NSS_STATUS_TRYAGAIN to indicate insufficient buffer (#1173537).[2.17-85]- Skip logging for DNSSEC responses (#1186620).- Also apply the RHEL6.7 Makerules patch (#1189278).[2.17-84]- Initialize nscd stats data (#1183456).[2.17-83]- Resize DTV if the current DTV isn't big enough (#1189278).[2.17-82]- Backport an alternate implementation of strstr and strcasestr for x86 that doesn't use the stack for temporaries requiring 16-byte alignment (#1150282).[2.17-81]- Fix recursive dlopen() (#1165212).- Correctly size profiling reloc table (#1144133).[2.17-80]- Work around a suspected gcc 4.8 bug (#1064066).[2.17-79]- Restructure spec file to unconditionally apply ppc64le support (#1182355).- Fix test failure in test-ildoubl on ppc64 (#1186491)."); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2015-2199");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2015-2199.html");
script_cve_id("CVE-2013-7423","CVE-2015-1781","CVE-2015-1472","CVE-2015-1473");
script_tag(name:"cvss_base", value:"7.5");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/oracle_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_copyright("Eero Volotinen");
script_family("Oracle Linux Local Security Checks");
exit(0);
}
include("revisions-lib.inc");
include("pkg-lib-rpm.inc");
release = get_kb_item("ssh/login/release");
res = "";
if(release == NULL)
{
 exit(0);
}
if(release == "OracleLinux7")
{
  if ((res = isrpmvuln(pkg:"glibc", rpm:"glibc~2.17~105.0.1.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"glibc-common", rpm:"glibc-common~2.17~105.0.1.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"glibc-devel", rpm:"glibc-devel~2.17~105.0.1.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"glibc-headers", rpm:"glibc-headers~2.17~105.0.1.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"glibc-static", rpm:"glibc-static~2.17~105.0.1.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"glibc-utils", rpm:"glibc-utils~2.17~105.0.1.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nscd", rpm:"nscd~2.17~105.0.1.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

