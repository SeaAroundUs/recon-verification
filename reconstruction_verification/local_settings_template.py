# use this with
# --settings=flounder.local_settings
# in order to have local configuration settings

from .settings import *

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': '',
        'USER': '',
        'PASSWORD': '',
        'HOST': '',
        'PORT': ''
    }
}

SECRET_KEY = ''

LOGGING['handlers']['file']['filename'] = os.path.normpath('/var/log/recon-site/recon.log')
