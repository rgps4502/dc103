import ssl
import OpenSSL
import datetime
from pytz import timezone

# conf
SRC_TZ = 'UTC'
DST_TZ = 'Asia/Shanghai'


def get_ssl_expiry_date(host, port=443):
    """ get notAfter data from server cert """
    cert = ssl.get_server_certificate((host, port))
    x509 = OpenSSL.crypto.load_certificate(OpenSSL.crypto.FILETYPE_PEM, cert)
    return x509.get_notAfter().decode()


def load_ssl_date(dt_string, pattern='%Y%m%d%H%M%SZ'):
    """ convert ssl date from string to datetime obj """
    src_tz = timezone(SRC_TZ)
    dst_tz = timezone(DST_TZ)
    dt = src_tz.localize(datetime.datetime.strptime(dt_string, pattern))
    return dt.astimezone(tz=dst_tz)


print(load_ssl_date(get_ssl_expiry_date(
    'myself-bbs.com', port=443), pattern='%Y%m%d%H%M%SZ'))
