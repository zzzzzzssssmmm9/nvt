###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_fa6784d0bd_libsndfile_fc25.nasl 7080 2017-09-08 05:49:48Z asteins $
#
# Fedora Update for libsndfile FEDORA-2017-fa6784d0bd
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.873329");
  script_version("$Revision: 7080 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-08 07:49:48 +0200 (Fri, 08 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-09-01 07:11:18 +0200 (Fri, 01 Sep 2017)");
  script_cve_id("CVE-2017-12562");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for libsndfile FEDORA-2017-fa6784d0bd");
  script_tag(name: "summary", value: "Check the version of libsndfile");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "libsndfile is a C library for reading 
and writing sound files such as AIFF, AU, WAV, and others through one standard 
interface. It can currently read/write 8, 16, 24 and 32-bit PCM files as well 
as 32 and 64-bit floating point WAV files and a number of compressed formats. 
It compiles and runs on *nix, MacOS, and Win32.");
  script_tag(name: "affected", value: "libsndfile on Fedora 25");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-fa6784d0bd");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/PQ6OKXOLNMOTPF3OZMMBLBRD26RWT6EZ");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC25")
{

  if ((res = isrpmvuln(pkg:"libsndfile", rpm:"libsndfile~1.0.28~6.fc25", rls:"FC25")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
