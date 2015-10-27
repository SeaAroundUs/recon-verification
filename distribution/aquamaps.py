import html
import re
from urllib.request import urlopen
import xml.etree.ElementTree as ET

import logging

logger = logging.getLogger(__name__)


def get_map(genus, species):
    """follows pattern of example method at http://aquamaps.org/webservice/"""

    url = "http://www.aquamaps.org/webservice/getAMap.php?genus={}&species={}"\
        .format(genus, species)
    response = urlopen(url).read()
    logger.warn('retrieved {}'.format(url))
    xml_lines = response.decode('utf-8').split('\r\n')
    # fragile way of giving this a root element in order to be well formed
    # enough to be parsable
    xml_lines.insert(1, '<fakeroot>')
    xml_lines.append('</fakeroot>')
    root = ET.fromstring(''.join(xml_lines))
    body = root.find('section').find('section_body')

    # extract the image and link and return an html fragment
    match = re.search("http://www.aquamaps.org/preMap.php.*?'", body.text)
    link = match.group(0)[:-1]
    match = re.search('http://www.aquamaps.org/imagethumb/file_destination/.*?\.jpg', body.text)
    img = match.group(0)
    return '<a target="_blank" href="{}">{}</a><br /><img src="{}" />'.format(link,link,img)
